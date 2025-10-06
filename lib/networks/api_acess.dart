

import 'package:flutter_application/features/home/data/rx.dart';
import 'package:flutter_application/features/home/model/product_list_response.dart';
import 'package:flutter_application/features/profile_screen/data/rx.dart';
import 'package:flutter_application/features/profile_screen/model/get_profile_response.dart';
import 'package:rxdart/subjects.dart';

final ProductListRX productListRX = ProductListRX(
  empty: ProductListResponse(),
  dataFetcher: BehaviorSubject<ProductListResponse>(),
);
final GetProfileRX getProfileRX = GetProfileRX(
  empty: GetProfileResponse(),
  dataFetcher: BehaviorSubject<GetProfileResponse>(),
);