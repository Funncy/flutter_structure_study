import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:structure_study/core/constants/constants.dart';
import 'package:structure_study/domain/user/model/user_model.dart';

import '../../core/error/failure.dart';
import '../../domain/auth/login/model/login_model.dart';

// part 'auth_remote_repository.g.dart';

// @RestApi(baseUrl: Constants.serverUrl)
// abstract class AuthRemoteRepository {
//   factory AuthRemoteRepository(Dio dio, {String? baseUrl}) =
//       _AuthRemoteRepository;

//   @GET('/user')
//   Future<UserModel> loadUser();

//   @POST('/user/login')
//   Future<Map<String, dynamic>> login(@Body() LoginModel loginModel);
// }

class AuthRemoteRepository {
  String baseUrl = Constants.serverUrl;
  late Dio _dio;
  AuthRemoteRepository(Dio dio, {String? baseUrl}) {
    _dio = dio;
  }

  Future<UserModel> loadUser() async {
    try {
      Response response = await _dio.get('$baseUrl/user');
      if (response.data['success']) {
        return UserModel.fromJson(response.data['data']);
      }
      return UserModel.error('test');
    } catch (e) {
      return UserModel.error('test');
    }
  }
  // Future<Either<Failure, UserModel>> loadUser() async {
  //   try {
  //     Response response = await _dio.get('$baseUrl/user');
  //     if (response.data['success']) {
  //       return Right(UserModel.fromJson(response.data['data']));
  //     }
  //     return Left(Failure(title: 'test', content: 'test'));
  //   } catch (e) {
  //     return Left(Failure(title: 'test', content: 'test'));
  //   }
  // }

  Future<Either<Failure, String>> login(LoginModel loginModel) async {
    try {
      print('$baseUrl/user');
      print(loginModel.toJson());
      Response response =
          await _dio.post('$baseUrl/user/login', data: loginModel.toJson());
      if (response.data['success']) {
        return Right(response.data['data']['token']);
      }
      return Left(Failure(title: 'test', content: 'test'));
    } catch (e) {
      return Left(Failure(title: 'test', content: 'test'));
    }
  }
}
