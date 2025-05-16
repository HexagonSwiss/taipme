// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paper_content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaperContentModel {
  MessageModel? get mainMessage;
  PaperActionFlagsModel get actionFlags;
  int get currentPaperId;
  String? get paperTitle;

  /// Create a copy of PaperContentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaperContentModelCopyWith<PaperContentModel> get copyWith =>
      _$PaperContentModelCopyWithImpl<PaperContentModel>(
          this as PaperContentModel, _$identity);

  /// Serializes this PaperContentModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaperContentModel &&
            (identical(other.mainMessage, mainMessage) ||
                other.mainMessage == mainMessage) &&
            (identical(other.actionFlags, actionFlags) ||
                other.actionFlags == actionFlags) &&
            (identical(other.currentPaperId, currentPaperId) ||
                other.currentPaperId == currentPaperId) &&
            (identical(other.paperTitle, paperTitle) ||
                other.paperTitle == paperTitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, mainMessage, actionFlags, currentPaperId, paperTitle);

  @override
  String toString() {
    return 'PaperContentModel(mainMessage: $mainMessage, actionFlags: $actionFlags, currentPaperId: $currentPaperId, paperTitle: $paperTitle)';
  }
}

/// @nodoc
abstract mixin class $PaperContentModelCopyWith<$Res> {
  factory $PaperContentModelCopyWith(
          PaperContentModel value, $Res Function(PaperContentModel) _then) =
      _$PaperContentModelCopyWithImpl;
  @useResult
  $Res call(
      {MessageModel? mainMessage,
      PaperActionFlagsModel actionFlags,
      int currentPaperId,
      String? paperTitle});

  $MessageModelCopyWith<$Res>? get mainMessage;
  $PaperActionFlagsModelCopyWith<$Res> get actionFlags;
}

/// @nodoc
class _$PaperContentModelCopyWithImpl<$Res>
    implements $PaperContentModelCopyWith<$Res> {
  _$PaperContentModelCopyWithImpl(this._self, this._then);

  final PaperContentModel _self;
  final $Res Function(PaperContentModel) _then;

  /// Create a copy of PaperContentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainMessage = freezed,
    Object? actionFlags = null,
    Object? currentPaperId = null,
    Object? paperTitle = freezed,
  }) {
    return _then(_self.copyWith(
      mainMessage: freezed == mainMessage
          ? _self.mainMessage
          : mainMessage // ignore: cast_nullable_to_non_nullable
              as MessageModel?,
      actionFlags: null == actionFlags
          ? _self.actionFlags
          : actionFlags // ignore: cast_nullable_to_non_nullable
              as PaperActionFlagsModel,
      currentPaperId: null == currentPaperId
          ? _self.currentPaperId
          : currentPaperId // ignore: cast_nullable_to_non_nullable
              as int,
      paperTitle: freezed == paperTitle
          ? _self.paperTitle
          : paperTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PaperContentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageModelCopyWith<$Res>? get mainMessage {
    if (_self.mainMessage == null) {
      return null;
    }

    return $MessageModelCopyWith<$Res>(_self.mainMessage!, (value) {
      return _then(_self.copyWith(mainMessage: value));
    });
  }

  /// Create a copy of PaperContentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaperActionFlagsModelCopyWith<$Res> get actionFlags {
    return $PaperActionFlagsModelCopyWith<$Res>(_self.actionFlags, (value) {
      return _then(_self.copyWith(actionFlags: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _PaperContentModel implements PaperContentModel {
  const _PaperContentModel(
      {this.mainMessage,
      required this.actionFlags,
      required this.currentPaperId,
      this.paperTitle});
  factory _PaperContentModel.fromJson(Map<String, dynamic> json) =>
      _$PaperContentModelFromJson(json);

  @override
  final MessageModel? mainMessage;
  @override
  final PaperActionFlagsModel actionFlags;
  @override
  final int currentPaperId;
  @override
  final String? paperTitle;

  /// Create a copy of PaperContentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaperContentModelCopyWith<_PaperContentModel> get copyWith =>
      __$PaperContentModelCopyWithImpl<_PaperContentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaperContentModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaperContentModel &&
            (identical(other.mainMessage, mainMessage) ||
                other.mainMessage == mainMessage) &&
            (identical(other.actionFlags, actionFlags) ||
                other.actionFlags == actionFlags) &&
            (identical(other.currentPaperId, currentPaperId) ||
                other.currentPaperId == currentPaperId) &&
            (identical(other.paperTitle, paperTitle) ||
                other.paperTitle == paperTitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, mainMessage, actionFlags, currentPaperId, paperTitle);

  @override
  String toString() {
    return 'PaperContentModel(mainMessage: $mainMessage, actionFlags: $actionFlags, currentPaperId: $currentPaperId, paperTitle: $paperTitle)';
  }
}

/// @nodoc
abstract mixin class _$PaperContentModelCopyWith<$Res>
    implements $PaperContentModelCopyWith<$Res> {
  factory _$PaperContentModelCopyWith(
          _PaperContentModel value, $Res Function(_PaperContentModel) _then) =
      __$PaperContentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {MessageModel? mainMessage,
      PaperActionFlagsModel actionFlags,
      int currentPaperId,
      String? paperTitle});

  @override
  $MessageModelCopyWith<$Res>? get mainMessage;
  @override
  $PaperActionFlagsModelCopyWith<$Res> get actionFlags;
}

/// @nodoc
class __$PaperContentModelCopyWithImpl<$Res>
    implements _$PaperContentModelCopyWith<$Res> {
  __$PaperContentModelCopyWithImpl(this._self, this._then);

  final _PaperContentModel _self;
  final $Res Function(_PaperContentModel) _then;

  /// Create a copy of PaperContentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mainMessage = freezed,
    Object? actionFlags = null,
    Object? currentPaperId = null,
    Object? paperTitle = freezed,
  }) {
    return _then(_PaperContentModel(
      mainMessage: freezed == mainMessage
          ? _self.mainMessage
          : mainMessage // ignore: cast_nullable_to_non_nullable
              as MessageModel?,
      actionFlags: null == actionFlags
          ? _self.actionFlags
          : actionFlags // ignore: cast_nullable_to_non_nullable
              as PaperActionFlagsModel,
      currentPaperId: null == currentPaperId
          ? _self.currentPaperId
          : currentPaperId // ignore: cast_nullable_to_non_nullable
              as int,
      paperTitle: freezed == paperTitle
          ? _self.paperTitle
          : paperTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PaperContentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageModelCopyWith<$Res>? get mainMessage {
    if (_self.mainMessage == null) {
      return null;
    }

    return $MessageModelCopyWith<$Res>(_self.mainMessage!, (value) {
      return _then(_self.copyWith(mainMessage: value));
    });
  }

  /// Create a copy of PaperContentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaperActionFlagsModelCopyWith<$Res> get actionFlags {
    return $PaperActionFlagsModelCopyWith<$Res>(_self.actionFlags, (value) {
      return _then(_self.copyWith(actionFlags: value));
    });
  }
}

// dart format on
