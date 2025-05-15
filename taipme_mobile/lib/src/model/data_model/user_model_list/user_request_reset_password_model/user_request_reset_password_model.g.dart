// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_reset_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRequestResetPasswordModel _$UserRequestResetPasswordModelFromJson(
        Map<String, dynamic> json) =>
    _UserRequestResetPasswordModel(
      token: json['token'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$UserRequestResetPasswordModelToJson(
        _UserRequestResetPasswordModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'newPassword': instance.newPassword,
    };
