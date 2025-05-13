import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_registration.freezed.dart';
part 'user_registration.g.dart';

@freezed
class UserRegistrationModel with _$UserRegistrationModel {
  const factory UserRegistrationModel({
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
  }) = _UserRegistrationModel;

  factory UserRegistrationModel.fromJson(Map<String, Object?> json) => _$UserRegistrationModelFromJson(json);
}