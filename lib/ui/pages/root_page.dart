import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:structure_study/ui/viewmodels/user/user_viewmodel.dart';

import '../../domain/user/model/user_model.dart';
import 'auth/home_page.dart';
import 'auth/login_page.dart';

class RootPage extends StatefulWidget {
  static const routeName = '/root';
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late final UserViewModel _userViewModel;

  @override
  void initState() {
    _userViewModel = Get.find<UserViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      UserModel user = _userViewModel.userModel;

      if (user is Error) {
        //alert
      }

      return user.map((value) => const HomePage(),
          initial: (_) => loading(),
          loading: (_) => loading(),
          error: (_) => const LoginPage(),
          empty: (_) => const LoginPage());
    });
  }

  Widget loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
