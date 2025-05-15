import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_request_password_model.freezed.dart';
part 'user_request_password_model.g.dart';

@freezed
abstract class UserRequestPasswordModel with _$UserRequestPasswordModel {
  const factory UserRequestPasswordModel({
    required String email,
  }) = _UserRequestPasswordModel;

  factory UserRequestPasswordModel.fromJson(Map<String, Object?> json) => _$UserRequestPasswordModelFromJson(json);
}