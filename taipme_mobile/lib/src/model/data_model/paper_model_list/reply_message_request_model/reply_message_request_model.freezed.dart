// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_message_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReplyMessageRequestModel {
  String get desMsg;

  /// Create a copy of ReplyMessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReplyMessageRequestModelCopyWith<ReplyMessageRequestModel> get copyWith =>
      _$ReplyMessageRequestModelCopyWithImpl<ReplyMessageRequestModel>(
          this as ReplyMessageRequestModel, _$identity);

  /// Serializes this ReplyMessageRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReplyMessageRequestModel &&
            (identical(other.desMsg, desMsg) || other.desMsg == desMsg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, desMsg);

  @override
  String toString() {
    return 'ReplyMessageRequestModel(desMsg: $desMsg)';
  }
}

/// @nodoc
abstract mixin class $ReplyMessageRequestModelCopyWith<$Res> {
  factory $ReplyMessageRequestModelCopyWith(ReplyMessageRequestModel value,
          $Res Function(ReplyMessageRequestModel) _then) =
      _$ReplyMessageRequestModelCopyWithImpl;
  @useResult
  $Res call({String desMsg});
}

/// @nodoc
class _$ReplyMessageRequestModelCopyWithImpl<$Res>
    implements $ReplyMessageRequestModelCopyWith<$Res> {
  _$ReplyMessageRequestModelCopyWithImpl(this._self, this._then);

  final ReplyMessageRequestModel _self;
  final $Res Function(ReplyMessageRequestModel) _then;

  /// Create a copy of ReplyMessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? desMsg = null,
  }) {
    return _then(_self.copyWith(
      desMsg: null == desMsg
          ? _self.desMsg
          : desMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReplyMessageRequestModel implements ReplyMessageRequestModel {
  const _ReplyMessageRequestModel({required this.desMsg});
  factory _ReplyMessageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ReplyMessageRequestModelFromJson(json);

  @override
  final String desMsg;

  /// Create a copy of ReplyMessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReplyMessageRequestModelCopyWith<_ReplyMessageRequestModel> get copyWith =>
      __$ReplyMessageRequestModelCopyWithImpl<_ReplyMessageRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReplyMessageRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReplyMessageRequestModel &&
            (identical(other.desMsg, desMsg) || other.desMsg == desMsg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, desMsg);

  @override
  String toString() {
    return 'ReplyMessageRequestModel(desMsg: $desMsg)';
  }
}

/// @nodoc
abstract mixin class _$ReplyMessageRequestModelCopyWith<$Res>
    implements $ReplyMessageRequestModelCopyWith<$Res> {
  factory _$ReplyMessageRequestModelCopyWith(_ReplyMessageRequestModel value,
          $Res Function(_ReplyMessageRequestModel) _then) =
      __$ReplyMessageRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call({String desMsg});
}

/// @nodoc
class __$ReplyMessageRequestModelCopyWithImpl<$Res>
    implements _$ReplyMessageRequestModelCopyWith<$Res> {
  __$ReplyMessageRequestModelCopyWithImpl(this._self, this._then);

  final _ReplyMessageRequestModel _self;
  final $Res Function(_ReplyMessageRequestModel) _then;

  /// Create a copy of ReplyMessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? desMsg = null,
  }) {
    return _then(_ReplyMessageRequestModel(
      desMsg: null == desMsg
          ? _self.desMsg
          : desMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
