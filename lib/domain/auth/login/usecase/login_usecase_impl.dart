import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:structure_study/core/error/failure.dart';
import 'package:structure_study/data/auth/auth_remote_repository.dart';
import 'package:structure_study/domain/auth/login/model/login_model.dart';
import 'package:structure_study/domain/user/model/user_model.dart';
import 'login_usecase.dart';

class LoginUseCaseImpl implements LoginUseCase {
  late AuthRemoteRepository _authRemoteRepository;

  LoginUseCaseImpl({required AuthRemoteRepository authRemoteRepository}) {
    _authRemoteRepository = authRemoteRepository;
  }

  @override
  Future<Either<Failure, String>> login(LoginModel login) async {
    try {
      Either<Failure, String> result = await _authRemoteRepository.login(login);
      if (result.isLeft()) {
        return Left(Failure(title: '로그인 실패', content: '다시 시도해주세요.'));
      }
      var token = result.fold((l) => l, (r) => r);
      print(token);
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: token as String);
      print(storage.read(key: 'token'));
      return Right(token);
    } catch (e) {
      return Left(Failure(title: '로그인 실패', content: '다시 시도해주세요.'));
    }
  }
}
