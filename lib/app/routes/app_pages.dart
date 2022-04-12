import 'package:get/get.dart';

import '../modules/create_product/bindings/create_product_binding.dart';
import '../modules/create_product/views/create_product_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search_product/bindings/search_product_binding.dart';
import '../modules/search_product/views/search_product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PRODUCT,
      page: () => CreateProductView(),
      binding: CreateProductBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PRODUCT,
      page: () => SearchProductView(),
      binding: SearchProductBinding(),
    ),
  ];
}
