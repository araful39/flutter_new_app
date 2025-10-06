import 'package:dio/dio.dart';
import 'package:flutter_application/features/home/model/product_list_response.dart';
import 'package:flutter_application/networks/dio/dio.dart';
import '../../../../../../../networks/endpoints.dart';
import '../../../../../../../networks/exception_handler/data_source.dart';

final class ProductListApi {
  static final ProductListApi _singleton = ProductListApi._internal();
  ProductListApi._internal();
  static ProductListApi get instance => _singleton;

  Future<ProductListResponse> productData() async {
    try {
      Response response = await getHttp(Endpoints.productList());

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProductListResponse.fromJson(response.data);
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
