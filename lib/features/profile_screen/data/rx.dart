import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application/features/profile_screen/data/api.dart';
import 'package:flutter_application/features/profile_screen/model/get_profile_response.dart';
import 'package:flutter_application/networks/rx_base.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rxdart/rxdart.dart';

final class GetProfileRX extends RxResponseInt<GetProfileResponse> {
  final api = GetProfileApi.instance;

  bool success = false;
  String message = "";

  GetProfileRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> getProfile() async {
    try {
      GetProfileResponse data = await api.getProfile();
      return await handleSuccessWithReturn(data);
    } catch (error) {
      log("error---$error");
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    GetProfileResponse response = data;
    await EasyLoading.showSuccess(message);
    dataFetcher.sink.add(response);
    return true;
  }

  @override
  handleErrorWithReturn(error) async {
    DioException exception = error as DioException;
    if (exception.type == DioExceptionType.connectionError) {
      message = "Check Your Network Connection";
    } else if (exception.response != null &&
        exception.response!.data != null &&
        exception.response!.data is Map<String, dynamic>) {
      message = exception.response!.data["message"] ?? " failed";
    } else {
      message = "An unexpected error occured.";
    }
    await EasyLoading.showError(message);
    await Future.delayed(const Duration(seconds: 2));
    dataFetcher.sink.addError(error);
    return false;
  }
}
