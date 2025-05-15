// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_change_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserChangePasswordModel {
  String get currentPassword;
  String get newPassword;

  /// Create a copy of UserChangePasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserChangePasswordModelCopyWith<UserChangePasswordModel> get copyWith =>
      _$UserChangePasswordModelCopyWithImpl<UserChangePasswordModel>(
          this as UserChangePasswordModel, _$identity);

  /// Serializes this UserChangePasswordModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserChangePasswordModel &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPassword, newPassword);

  @override
  String toString() {
    return 'UserChangePasswordModel(currentPassword: $currentPassword, newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class $UserChangePasswordModelCopyWith<$Res> {
  factory $UserChangePasswordModelCopyWith(UserChangePasswordModel value,
          $Res Function(UserChangePasswordModel) _then) =
      _$UserChangePasswordModelCopyWithImpl;
  @useResult
  $Res call({String currentPassword, String newPassword});
}

/// @nodoc
class _$UserChangePasswordModelCopyWithImpl<$Res>
    implements $UserChangePasswordModelCopyWith<$Res> {
  _$UserChangePasswordModelCopyWithImpl(this._self, this._then);

  final UserChangePasswordModel _self;
  final $Res Function(UserChangePasswordModel) _then;

  /// Create a copy of UserChangePasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_self.copyWith(
      currentPassword: null == currentPassword
          ? _self.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
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
class _UserChangePasswordModel implements UserChangePasswordModel {
  const _UserChangePasswordModel(
      {required this.currentPassword, required this.newPassword});
  factory _UserChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$UserChangePasswordModelFromJson(json);

  @override
  final String currentPassword;
  @override
  final String newPassword;

  /// Create a copy of UserChangePasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserChangePasswordModelCopyWith<_UserChangePasswordModel> get copyWith =>
      __$UserChangePasswordModelCopyWithImpl<_UserChangePasswordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserChangePasswordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserChangePasswordModel &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPassword, newPassword);

  @override
  String toString() {
    return 'UserChangePasswordModel(currentPassword: $currentPassword, newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class _$UserChangePasswordModelCopyWith<$Res>
    implements $UserChangePasswordModelCopyWith<$Res> {
  factory _$UserChangePasswordModelCopyWith(_UserChangePasswordModel value,
          $Res Function(_UserChangePasswordModel) _then) =
      __$UserChangePasswordModelCopyWithImpl;
  @override
  @useResult
  $Res call({String currentPassword, String newPassword});
}

/// @nodoc
class __$UserChangePasswordModelCopyWithImpl<$Res>
    implements _$UserChangePasswordModelCopyWith<$Res> {
  __$UserChangePasswordModelCopyWithImpl(this._self, this._then);

  final _UserChangePasswordModel _self;
  final $Res Function(_UserChangePasswordModel) _then;

  /// Create a copy of UserChangePasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_UserChangePasswordModel(
      currentPassword: null == currentPassword
          ? _self.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
