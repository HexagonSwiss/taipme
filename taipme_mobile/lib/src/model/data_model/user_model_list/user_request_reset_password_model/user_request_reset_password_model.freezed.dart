// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_request_reset_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRequestResetPasswordModel {
  String get token;
  String get newPassword;

  /// Create a copy of UserRequestResetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserRequestResetPasswordModelCopyWith<UserRequestResetPasswordModel>
      get copyWith => _$UserRequestResetPasswordModelCopyWithImpl<
              UserRequestResetPasswordModel>(
          this as UserRequestResetPasswordModel, _$identity);

  /// Serializes this UserRequestResetPasswordModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserRequestResetPasswordModel &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, newPassword);

  @override
  String toString() {
    return 'UserRequestResetPasswordModel(token: $token, newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class $UserRequestResetPasswordModelCopyWith<$Res> {
  factory $UserRequestResetPasswordModelCopyWith(
          UserRequestResetPasswordModel value,
          $Res Function(UserRequestResetPasswordModel) _then) =
      _$UserRequestResetPasswordModelCopyWithImpl;
  @useResult
  $Res call({String token, String newPassword});
}

/// @nodoc
class _$UserRequestResetPasswordModelCopyWithImpl<$Res>
    implements $UserRequestResetPasswordModelCopyWith<$Res> {
  _$UserRequestResetPasswordModelCopyWithImpl(this._self, this._then);

  final UserRequestResetPasswordModel _self;
  final $Res Function(UserRequestResetPasswordModel) _then;

  /// Create a copy of UserRequestResetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? newPassword = null,
  }) {
    return _then(_self.copyWith(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserRequestResetPasswordModel implements UserRequestResetPasswordModel {
  const _UserRequestResetPasswordModel(
      {required this.token, required this.newPassword});
  factory _UserRequestResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$UserRequestResetPasswordModelFromJson(json);

  @override
  final String token;
  @override
  final String newPassword;

  /// Create a copy of UserRequestResetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserRequestResetPasswordModelCopyWith<_UserRequestResetPasswordModel>
      get copyWith => __$UserRequestResetPasswordModelCopyWithImpl<
          _UserRequestResetPasswordModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserRequestResetPasswordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserRequestResetPasswordModel &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, newPassword);

  @override
  String toString() {
    return 'UserRequestResetPasswordModel(token: $token, newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class _$UserRequestResetPasswordModelCopyWith<$Res>
    implements $UserRequestResetPasswordModelCopyWith<$Res> {
  factory _$UserRequestResetPasswordModelCopyWith(
          _UserRequestResetPasswordModel value,
          $Res Function(_UserRequestResetPasswordModel) _then) =
      __$UserRequestResetPasswordModelCopyWithImpl;
  @override
  @useResult
  $Res call({String token, String newPassword});
}

/// @nodoc
class __$UserRequestResetPasswordModelCopyWithImpl<$Res>
    implements _$UserRequestResetPasswordModelCopyWith<$Res> {
  __$UserRequestResetPasswordModelCopyWithImpl(this._self, this._then);

  final _UserRequestResetPasswordModel _self;
  final $Res Function(_UserRequestResetPasswordModel) _then;

  /// Create a copy of UserRequestResetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = null,
    Object? newPassword = null,
  }) {
    return _then(_UserRequestResetPasswordModel(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
