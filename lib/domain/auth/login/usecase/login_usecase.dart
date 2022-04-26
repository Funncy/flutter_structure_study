import 'package:dartz/dartz.dart';
import 'package:structure_study/core/error/failure.dart';

import '../model/login_model.dart';

abstract class LoginUseCase {
  Future<Either<Failure, String>> login(LoginModel login);
}
