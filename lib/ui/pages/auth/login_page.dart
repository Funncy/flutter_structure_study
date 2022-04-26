import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:structure_study/ui/pages/mixin/input_decroator_mixin.dart';
import 'package:structure_study/ui/viewmodels/auth/login/login_viewmodel.dart';
import 'package:structure_study/ui/viewmodels/user/user_viewmodel.dart';

import '../../viewmodels/view_state.dart';
import '../widgets/loading_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with InputDecoratorMixin {
  late GlobalKey<FormState> _formKey;
  late LoginViewModel _loginViewModel;
  late UserViewModel _userViewModel;
  late TextEditingController _emailTextController;
  late TextEditingController _pwTextController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _loginViewModel = Get.find<LoginViewModel>();
    _userViewModel = Get.find<UserViewModel>();
    _emailTextController = TextEditingController();
    _pwTextController = TextEditingController();
    super.initState();
  }

  void login() async {
    bool isValidate = _formKey.currentState?.validate() ?? false;
    if (isValidate) {
      await _loginViewModel.login(
          email: _emailTextController.text.trim(),
          password: _pwTextController.text);
      if (_loginViewModel.viewState is Loaded) {
        _userViewModel.loadUser();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("로그인 페이지")),
      body: Obx(() {
        ViewState viewState = _loginViewModel.viewState;
        if (viewState is Error) {
          //alert
        }

        return Stack(
          children: [
            _emailLoginBody(),
            if (viewState is Loading) LoadingWidget()
          ],
        );
      }),
    );
  }

  Container _emailLoginBody() {
    return Container(
        child: Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _emailTextController,
                    decoration: textInputDecor('이메일 주소'),
                    style: Theme.of(context).textTheme.bodyText1,
                    // TextStyle(
                    //     color: Colors.white,
                    //     fontSize: AppBarNickNameFontSize),
                    validator: (text) {
                      if (text == null || text == "") {
                        return '올바른 이메일을 입력해주세요.';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    // onEditingComplete: () => login(),
                    controller: _pwTextController,
                    decoration: textInputDecor('비밀번호'),
                    style: Theme.of(context).textTheme.bodyText1,
                    validator: (text) {
                      if (text == null || text == "") {
                        return '비밀번호를 입력해주세요.';
                      }
                    },
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  onPressed: login,
                  child: const Text("로그인"),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {},
                  child: const Text("회원가입"),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
