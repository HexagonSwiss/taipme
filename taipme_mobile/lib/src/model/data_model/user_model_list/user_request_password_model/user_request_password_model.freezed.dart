// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_request_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRequestPasswordModel {
  String get email;

  /// Create a copy of UserRequestPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserRequestPasswordModelCopyWith<UserRequestPasswordModel> get copyWith =>
      _$UserRequestPasswordModelCopyWithImpl<UserRequestPasswordModel>(
          this as UserRequestPasswordModel, _$identity);

  /// Serializes this UserRequestPasswordModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserRequestPasswordModel &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'UserRequestPasswordModel(email: $email)';
  }
}

/// @nodoc
abstract mixin class $UserRequestPasswordModelCopyWith<$Res> {
  factory $UserRequestPasswordModelCopyWith(UserRequestPasswordModel value,
          $Res Function(UserRequestPasswordModel) _then) =
      _$UserRequestPasswordModelCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$UserRequestPasswordModelCopyWithImpl<$Res>
    implements $UserRequestPasswordModelCopyWith<$Res> {
  _$UserRequestPasswordModelCopyWithImpl(this._self, this._then);

  final UserRequestPasswordModel _self;
  final $Res Function(UserRequestPasswordModel) _then;

  /// Create a copy of UserRequestPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserRequestPasswordModel implements UserRequestPasswordModel {
  const _UserRequestPasswordModel({required this.email});
  factory _UserRequestPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$UserRequestPasswordModelFromJson(json);

  @override
  final String email;

  /// Create a copy of UserRequestPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserRequestPasswordModelCopyWith<_UserRequestPasswordModel> get copyWith =>
      __$UserRequestPasswordModelCopyWithImpl<_UserRequestPasswordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserRequestPasswordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserRequestPasswordModel &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'UserRequestPasswordModel(email: $email)';
  }
}

/// @nodoc
abstract mixin class _$UserRequestPasswordModelCopyWith<$Res>
    implements $UserRequestPasswordModelCopyWith<$Res> {
  factory _$UserRequestPasswordModelCopyWith(_UserRequestPasswordModel value,
          $Res Function(_UserRequestPasswordModel) _then) =
      __$UserRequestPasswordModelCopyWithImpl;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$UserRequestPasswordModelCopyWithImpl<$Res>
    implements _$UserRequestPasswordModelCopyWith<$Res> {
  __$UserRequestPasswordModelCopyWithImpl(this._self, this._then);

  final _UserRequestPasswordModel _self;
  final $Res Function(_UserRequestPasswordModel) _then;

  /// Create a copy of UserRequestPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(_UserRequestPasswordModel(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
