import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    DateTime? birthDate,
    String? id,
    String? firebaseMessagingId,
    String? email,
    String? password,
    String? phoneNumber,
    String? name,
    String? lastName,
    String? profileImage, // Download URL OR StoragePath
    String? addressString,
    @Default(false) bool isEmailVerified,
    @Default(false) bool consentToTermsOfService,
    @Default(false) bool consentToPrivacyPolicy,
    @Default(false) bool consentToNewsletter,
    @Default(false) bool consentToPushNotifications,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}