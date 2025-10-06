import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_application/features/home/data/api.dart';
import 'package:flutter_application/features/home/model/product_list_response.dart';
import 'package:flutter_application/networks/rx_base.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:rxdart/rxdart.dart';

final class ProductListRX extends RxResponseInt<ProductListResponse> {
  final api = ProductListApi.instance;

  bool success = false;
  String message = "";

  ProductListRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> productData() async {
    try {
      ProductListResponse data = await api.productData();
      return await handleSuccessWithReturn(data);
    } catch (error) {
      log("error---$error");
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    ProductListResponse response = data;
    dataFetcher.sink.add(response);
    return true;
  }

  @override
  handleErrorWithReturn(error) async {
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionError) {
        message = "Check Your Network Connection";
      } else if (error.response != null &&
          error.response!.data != null &&
          error.response!.data is Map<String, dynamic>) {
        message = error.response!.data["message"] ?? "Request failed";
      } else {
        message = "An unexpected error occurred.";
      }
    } else {
      message = "Something went wrong.";
    }
    await EasyLoading.showError(message);

    dataFetcher.sink.addError(error);
    return false;
  }
}
