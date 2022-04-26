import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:structure_study/domain/user/usecase/user_usecase.dart';

import '../model/user_model.dart';

class UserUseCaseImpl implements UserUseCase {
  @override
  Future<UserModel> loadUser() async {
    final storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "token");

    await Future.delayed(Duration(seconds: 1));

    if (token == null) {
      return UserModel.empty();
    }

    //user 가져오기 서버에서
    return UserModel.loading();
  }
}
