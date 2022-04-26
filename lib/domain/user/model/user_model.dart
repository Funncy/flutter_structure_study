import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel(
      {required int id,
      required String email,
      required String username}) = _UserModel;

  const factory UserModel.initial() = Initial;
  const factory UserModel.loading() = Loading;
  const factory UserModel.error([String? message]) = Error;
  const factory UserModel.empty() = Empty;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
