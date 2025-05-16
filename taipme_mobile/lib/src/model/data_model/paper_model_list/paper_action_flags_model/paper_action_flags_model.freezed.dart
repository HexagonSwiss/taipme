// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paper_action_flags_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaperActionFlagsModel {
  bool get canWriteNewOnThisPaper;
  bool get canReplyToMainMessage;
  bool get canReadOtherRandomMessages;
  bool get canTearMainMessage;
  bool get canReportMainMessage;

  /// Create a copy of PaperActionFlagsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaperActionFlagsModelCopyWith<PaperActionFlagsModel> get copyWith =>
      _$PaperActionFlagsModelCopyWithImpl<PaperActionFlagsModel>(
          this as PaperActionFlagsModel, _$identity);

  /// Serializes this PaperActionFlagsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaperActionFlagsModel &&
            (identical(other.canWriteNewOnThisPaper, canWriteNewOnThisPaper) ||
                other.canWriteNewOnThisPaper == canWriteNewOnThisPaper) &&
            (identical(other.canReplyToMainMessage, canReplyToMainMessage) ||
                other.canReplyToMainMessage == canReplyToMainMessage) &&
            (identical(other.canReadOtherRandomMessages,
                    canReadOtherRandomMessages) ||
                other.canReadOtherRandomMessages ==
                    canReadOtherRandomMessages) &&
            (identical(other.canTearMainMessage, canTearMainMessage) ||
                other.canTearMainMessage == canTearMainMessage) &&
            (identical(other.canReportMainMessage, canReportMainMessage) ||
                other.canReportMainMessage == canReportMainMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      canWriteNewOnThisPaper,
      canReplyToMainMessage,
      canReadOtherRandomMessages,
      canTearMainMessage,
      canReportMainMessage);

  @override
  String toString() {
    return 'PaperActionFlagsModel(canWriteNewOnThisPaper: $canWriteNewOnThisPaper, canReplyToMainMessage: $canReplyToMainMessage, canReadOtherRandomMessages: $canReadOtherRandomMessages, canTearMainMessage: $canTearMainMessage, canReportMainMessage: $canReportMainMessage)';
  }
}

/// @nodoc
abstract mixin class $PaperActionFlagsModelCopyWith<$Res> {
  factory $PaperActionFlagsModelCopyWith(PaperActionFlagsModel value,
          $Res Function(PaperActionFlagsModel) _then) =
      _$PaperActionFlagsModelCopyWithImpl;
  @useResult
  $Res call(
      {bool canWriteNewOnThisPaper,
      bool canReplyToMainMessage,
      bool canReadOtherRandomMessages,
      bool canTearMainMessage,
      bool canReportMainMessage});
}

/// @nodoc
class _$PaperActionFlagsModelCopyWithImpl<$Res>
    implements $PaperActionFlagsModelCopyWith<$Res> {
  _$PaperActionFlagsModelCopyWithImpl(this._self, this._then);

  final PaperActionFlagsModel _self;
  final $Res Function(PaperActionFlagsModel) _then;

  /// Create a copy of PaperActionFlagsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canWriteNewOnThisPaper = null,
    Object? canReplyToMainMessage = null,
    Object? canReadOtherRandomMessages = null,
    Object? canTearMainMessage = null,
    Object? canReportMainMessage = null,
  }) {
    return _then(_self.copyWith(
      canWriteNewOnThisPaper: null == canWriteNewOnThisPaper
          ? _self.canWriteNewOnThisPaper
          : canWriteNewOnThisPaper // ignore: cast_nullable_to_non_nullable
              as bool,
      canReplyToMainMessage: null == canReplyToMainMessage
          ? _self.canReplyToMainMessage
          : canReplyToMainMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      canReadOtherRandomMessages: null == canReadOtherRandomMessages
          ? _self.canReadOtherRandomMessages
          : canReadOtherRandomMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      canTearMainMessage: null == canTearMainMessage
          ? _self.canTearMainMessage
          : canTearMainMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      canReportMainMessage: null == canReportMainMessage
          ? _self.canReportMainMessage
          : canReportMainMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PaperActionFlagsModel implements PaperActionFlagsModel {
  const _PaperActionFlagsModel(
      {this.canWriteNewOnThisPaper = false,
      this.canReplyToMainMessage = false,
      this.canReadOtherRandomMessages = false,
      this.canTearMainMessage = false,
      this.canReportMainMessage = false});
  factory _PaperActionFlagsModel.fromJson(Map<String, dynamic> json) =>
      _$PaperActionFlagsModelFromJson(json);

  @override
  @JsonKey()
  final bool canWriteNewOnThisPaper;
  @override
  @JsonKey()
  final bool canReplyToMainMessage;
  @override
  @JsonKey()
  final bool canReadOtherRandomMessages;
  @override
  @JsonKey()
  final bool canTearMainMessage;
  @override
  @JsonKey()
  final bool canReportMainMessage;

  /// Create a copy of PaperActionFlagsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaperActionFlagsModelCopyWith<_PaperActionFlagsModel> get copyWith =>
      __$PaperActionFlagsModelCopyWithImpl<_PaperActionFlagsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaperActionFlagsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaperActionFlagsModel &&
            (identical(other.canWriteNewOnThisPaper, canWriteNewOnThisPaper) ||
                other.canWriteNewOnThisPaper == canWriteNewOnThisPaper) &&
            (identical(other.canReplyToMainMessage, canReplyToMainMessage) ||
                other.canReplyToMainMessage == canReplyToMainMessage) &&
            (identical(other.canReadOtherRandomMessages,
                    canReadOtherRandomMessages) ||
                other.canReadOtherRandomMessages ==
                    canReadOtherRandomMessages) &&
            (identical(other.canTearMainMessage, canTearMainMessage) ||
                other.canTearMainMessage == canTearMainMessage) &&
            (identical(other.canReportMainMessage, canReportMainMessage) ||
                other.canReportMainMessage == canReportMainMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      canWriteNewOnThisPaper,
      canReplyToMainMessage,
      canReadOtherRandomMessages,
      canTearMainMessage,
      canReportMainMessage);

  @override
  String toString() {
    return 'PaperActionFlagsModel(canWriteNewOnThisPaper: $canWriteNewOnThisPaper, canReplyToMainMessage: $canReplyToMainMessage, canReadOtherRandomMessages: $canReadOtherRandomMessages, canTearMainMessage: $canTearMainMessage, canReportMainMessage: $canReportMainMessage)';
  }
}

/// @nodoc
abstract mixin class _$PaperActionFlagsModelCopyWith<$Res>
    implements $PaperActionFlagsModelCopyWith<$Res> {
  factory _$PaperActionFlagsModelCopyWith(_PaperActionFlagsModel value,
          $Res Function(_PaperActionFlagsModel) _then) =
      __$PaperActionFlagsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool canWriteNewOnThisPaper,
      bool canReplyToMainMessage,
      bool canReadOtherRandomMessages,
      bool canTearMainMessage,
      bool canReportMainMessage});
}

/// @nodoc
class __$PaperActionFlagsModelCopyWithImpl<$Res>
    implements _$PaperActionFlagsModelCopyWith<$Res> {
  __$PaperActionFlagsModelCopyWithImpl(this._self, this._then);

  final _PaperActionFlagsModel _self;
  final $Res Function(_PaperActionFlagsModel) _then;

  /// Create a copy of PaperActionFlagsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? canWriteNewOnThisPaper = null,
    Object? canReplyToMainMessage = null,
    Object? canReadOtherRandomMessages = null,
    Object? canTearMainMessage = null,
    Object? canReportMainMessage = null,
  }) {
    return _then(_PaperActionFlagsModel(
      canWriteNewOnThisPaper: null == canWriteNewOnThisPaper
          ? _self.canWriteNewOnThisPaper
          : canWriteNewOnThisPaper // ignore: cast_nullable_to_non_nullable
              as bool,
      canReplyToMainMessage: null == canReplyToMainMessage
          ? _self.canReplyToMainMessage
          : canReplyToMainMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      canReadOtherRandomMessages: null == canReadOtherRandomMessages
          ? _self.canReadOtherRandomMessages
          : canReadOtherRandomMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      canTearMainMessage: null == canTearMainMessage
          ? _self.canTearMainMessage
          : canTearMainMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      canReportMainMessage: null == canReportMainMessage
          ? _self.canReportMainMessage
          : canReportMainMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
