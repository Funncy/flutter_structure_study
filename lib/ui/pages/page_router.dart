import 'package:get/get.dart';
import 'root_page.dart';

class PageRouter {
  static final initial = RootPage.routeName;

  static final routes = [
    GetPage(name: RootPage.routeName, page: () => RootPage(), bindings: []),
  ];
}
