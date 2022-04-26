import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:structure_study/domain/user/model/user_model.dart';
import 'package:structure_study/domain/user/usecase/user_usecase.dart';

class UserViewModel extends GetxController {
  late final UserUseCase _userUseCase;

  UserViewModel({required UserUseCase userUseCase}) {
    _userUseCase = userUseCase;
  }

  final Rx<UserModel> _userModel = Rx(const UserModel.initial());

  UserModel get userModel => _userModel.value;

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  Future<void> loadUser() async {
    _userModel.value = UserModel.loading();

    UserModel user = await _userUseCase.loadUser();
    _userModel.value = user;
  }
}
