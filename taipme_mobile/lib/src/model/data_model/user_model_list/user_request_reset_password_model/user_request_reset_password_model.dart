import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_request_reset_password_model.freezed.dart';
part 'user_request_reset_password_model.g.dart';

@freezed
abstract class UserRequestResetPasswordModel with _$UserRequestResetPasswordModel {
  const factory UserRequestResetPasswordModel({
    required String token,
    required String newPassword,
  }) = _UserRequestResetPasswordModel;

  factory UserRequestResetPasswordModel.fromJson(Map<String, Object?> json) =>
      _$UserRequestResetPasswordModelFromJson(json);
}
