import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:structure_study/data/auth/auth_remote_repository.dart';
import 'package:structure_study/domain/user/usecase/user_usecase.dart';

import '../model/user_model.dart';

class UserUseCaseImpl implements UserUseCase {
  late AuthRemoteRepository _authRemoteRepository;

  UserUseCaseImpl({required AuthRemoteRepository authRemoteRepository}) {
    _authRemoteRepository = authRemoteRepository;
  }

  @override
  Future<UserModel> loadUser() async {
    try {
      UserModel user = await _authRemoteRepository.loadUser();

      //user 가져오기 서버에서
      return user;
    } catch (e) {
      print(e);
      return const UserModel.error('test');
    }
  }
}
