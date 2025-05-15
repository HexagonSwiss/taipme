// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_change_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserChangePasswordModel _$UserChangePasswordModelFromJson(
        Map<String, dynamic> json) =>
    _UserChangePasswordModel(
      currentPassword: json['currentPassword'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$UserChangePasswordModelToJson(
        _UserChangePasswordModel instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
    };
