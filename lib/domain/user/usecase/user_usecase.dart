import 'package:structure_study/domain/user/model/user_model.dart';

abstract class UserUseCase {
  Future<UserModel> loadUser();
}
