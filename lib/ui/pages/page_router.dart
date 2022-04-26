import 'package:get/get.dart';
import 'package:structure_study/ui/viewmodels/auth/login/login_bindings.dart';
import 'package:structure_study/ui/viewmodels/user/user_bindings.dart';
import 'root_page.dart';

class PageRouter {
  static final initial = RootPage.routeName;

  static final routes = [
    GetPage(
        name: RootPage.routeName,
        page: () => RootPage(),
        bindings: [UserBindings(), LoginBindings()]),
  ];
}
