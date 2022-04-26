import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:structure_study/core/auth_dio.dart';
import 'package:structure_study/data/auth/auth_remote_repository.dart';
import 'package:structure_study/domain/auth/login/usecase/login_usecase_impl.dart';
import 'package:structure_study/ui/viewmodels/auth/login/login_viewmodel.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginViewModel>(LoginViewModel(
        loginUseCase: LoginUseCaseImpl(
            authRemoteRepository: AuthRemoteRepository(authDio()))));
  }
}
