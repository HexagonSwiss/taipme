// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_message_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateMessageRequestModel {
  String get desMsg; // Message description/content
  String? get titMsg;

  /// Create a copy of CreateMessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateMessageRequestModelCopyWith<CreateMessageRequestModel> get copyWith =>
      _$CreateMessageRequestModelCopyWithImpl<CreateMessageRequestModel>(
          this as CreateMessageRequestModel, _$identity);

  /// Serializes this CreateMessageRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateMessageRequestModel &&
            (identical(other.desMsg, desMsg) || other.desMsg == desMsg) &&
            (identical(other.titMsg, titMsg) || other.titMsg == titMsg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, desMsg, titMsg);

  @override
  String toString() {
    return 'CreateMessageRequestModel(desMsg: $desMsg, titMsg: $titMsg)';
  }
}

/// @nodoc
abstract mixin class $CreateMessageRequestModelCopyWith<$Res> {
  factory $CreateMessageRequestModelCopyWith(CreateMessageRequestModel value,
          $Res Function(CreateMessageRequestModel) _then) =
      _$CreateMessageRequestModelCopyWithImpl;
  @useResult
  $Res call({String desMsg, String? titMsg});
}

/// @nodoc
class _$CreateMessageRequestModelCopyWithImpl<$Res>
    implements $CreateMessageRequestModelCopyWith<$Res> {
  _$CreateMessageRequestModelCopyWithImpl(this._self, this._then);

  final CreateMessageRequestModel _self;
  final $Res Function(CreateMessageRequestModel) _then;

  /// Create a copy of CreateMessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? desMsg = null,
    Object? titMsg = freezed,
  }) {
    return _then(_self.copyWith(
      desMsg: null == desMsg
          ? _self.desMsg
          : desMsg // ignore: cast_nullable_to_non_nullable
              as String,
      titMsg: freezed == titMsg
          ? _self.titMsg
          : titMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CreateMessageRequestModel implements CreateMessageRequestModel {
  const _CreateMessageRequestModel({required this.desMsg, this.titMsg});
  factory _CreateMessageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageRequestModelFromJson(json);

  @override
  final String desMsg;
// Message description/content
  @override
  final String? titMsg;

  /// Create a copy of CreateMessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateMessageRequestModelCopyWith<_CreateMessageRequestModel>
      get copyWith =>
          __$CreateMessageRequestModelCopyWithImpl<_CreateMessageRequestModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateMessageRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateMessageRequestModel &&
            (identical(other.desMsg, desMsg) || other.desMsg == desMsg) &&
            (identical(other.titMsg, titMsg) || other.titMsg == titMsg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, desMsg, titMsg);

  @override
  String toString() {
    return 'CreateMessageRequestModel(desMsg: $desMsg, titMsg: $titMsg)';
  }
}

/// @nodoc
abstract mixin class _$CreateMessageRequestModelCopyWith<$Res>
    implements $CreateMessageRequestModelCopyWith<$Res> {
  factory _$CreateMessageRequestModelCopyWith(_CreateMessageRequestModel value,
          $Res Function(_CreateMessageRequestModel) _then) =
      __$CreateMessageRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call({String desMsg, String? titMsg});
}

/// @nodoc
class __$CreateMessageRequestModelCopyWithImpl<$Res>
    implements _$CreateMessageRequestModelCopyWith<$Res> {
  __$CreateMessageRequestModelCopyWithImpl(this._self, this._then);

  final _CreateMessageRequestModel _self;
  final $Res Function(_CreateMessageRequestModel) _then;

  /// Create a copy of CreateMessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? desMsg = null,
    Object? titMsg = freezed,
  }) {
    return _then(_CreateMessageRequestModel(
      desMsg: null == desMsg
          ? _self.desMsg
          : desMsg // ignore: cast_nullable_to_non_nullable
              as String,
      titMsg: freezed == titMsg
          ? _self.titMsg
          : titMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
