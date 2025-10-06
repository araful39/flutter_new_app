import 'package:dio/dio.dart';
import 'package:flutter_application/features/profile_screen/model/get_profile_response.dart';
import 'package:flutter_application/networks/dio/dio.dart';

import '../../../../../../networks/endpoints.dart';
import '../../../../../../networks/exception_handler/data_source.dart';

final class GetProfileApi {
  static final GetProfileApi _singleton = GetProfileApi._internal();
  GetProfileApi._internal();
  static GetProfileApi get instance => _singleton;

  Future<GetProfileResponse> getProfile() async {
    try {
      Response response = await getHttp(
        "https://api.escuelajs.co/api/v1/users/1",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        GetProfileResponse data = GetProfileResponse.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
