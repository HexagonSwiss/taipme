import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_change_password_model.freezed.dart';
part 'user_change_password_model.g.dart';

@freezed
abstract class UserChangePasswordModel with _$UserChangePasswordModel {
  const factory UserChangePasswordModel({
    required String currentPassword,
    required String newPassword,
  }) = _UserChangePasswordModel;

  factory UserChangePasswordModel.fromJson(Map<String, Object?> json) => _$UserChangePasswordModelFromJson(json);
}