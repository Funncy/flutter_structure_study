import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({required String email, required String password}) =
      _LoginModel;

  const factory LoginModel.initial() = Initial;
  const factory LoginModel.loading() = Loading;
  const factory LoginModel.error([String? message]) = Error;
  const factory LoginModel.loaded() = Loaded;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
