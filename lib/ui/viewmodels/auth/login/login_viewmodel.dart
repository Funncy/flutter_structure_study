import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:structure_study/domain/auth/login/model/login_model.dart';
import 'package:structure_study/ui/viewmodels/view_state.dart';

import '../../../../domain/auth/login/usecase/login_usecase.dart';

class LoginViewModel extends GetxController {
  late final LoginUseCase _loginUseCase;

  LoginViewModel({required LoginUseCase loginUseCase}) {
    _loginUseCase = loginUseCase;
  }

  final Rx<ViewState> _viewState = Rx(const ViewState.initial());
  ViewState get viewState => _viewState.value;

  Future<void> login({required String email, required String password}) async {
    _viewState.value = const ViewState.loading();

    LoginModel loginModel = LoginModel(email: email, password: password);

    await _loginUseCase.login(loginModel);

    _viewState.value = const ViewState.loaded();
  }
}
