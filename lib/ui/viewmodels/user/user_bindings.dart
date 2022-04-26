import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:structure_study/domain/user/usecase/user_usecase_impl.dart';
import 'package:structure_study/ui/viewmodels/user/user_viewmodel.dart';

class UserBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<UserViewModel>(UserViewModel(userUseCase: UserUseCaseImpl()));
  }
}
