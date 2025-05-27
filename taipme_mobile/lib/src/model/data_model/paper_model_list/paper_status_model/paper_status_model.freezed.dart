// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paper_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaperStatusModel {
  int get paperId;
  bool get hasReply;
  bool get myTurnToReply;
  bool get isUserAuthoredSlot;

  /// Create a copy of PaperStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaperStatusModelCopyWith<PaperStatusModel> get copyWith =>
      _$PaperStatusModelCopyWithImpl<PaperStatusModel>(
          this as PaperStatusModel, _$identity);

  /// Serializes this PaperStatusModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaperStatusModel &&
            (identical(other.paperId, paperId) || other.paperId == paperId) &&
            (identical(other.hasReply, hasReply) ||
                other.hasReply == hasReply) &&
            (identical(other.myTurnToReply, myTurnToReply) ||
                other.myTurnToReply == myTurnToReply) &&
            (identical(other.isUserAuthoredSlot, isUserAuthoredSlot) ||
                other.isUserAuthoredSlot == isUserAuthoredSlot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, paperId, hasReply, myTurnToReply, isUserAuthoredSlot);

  @override
  String toString() {
    return 'PaperStatusModel(paperId: $paperId, hasReply: $hasReply, myTurnToReply: $myTurnToReply, isUserAuthoredSlot: $isUserAuthoredSlot)';
  }
}

/// @nodoc
abstract mixin class $PaperStatusModelCopyWith<$Res> {
  factory $PaperStatusModelCopyWith(
          PaperStatusModel value, $Res Function(PaperStatusModel) _then) =
      _$PaperStatusModelCopyWithImpl;
  @useResult
  $Res call(
      {int paperId,
      bool hasReply,
      bool myTurnToReply,
      bool isUserAuthoredSlot});
}

/// @nodoc
class _$PaperStatusModelCopyWithImpl<$Res>
    implements $PaperStatusModelCopyWith<$Res> {
  _$PaperStatusModelCopyWithImpl(this._self, this._then);

  final PaperStatusModel _self;
  final $Res Function(PaperStatusModel) _then;

  /// Create a copy of PaperStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paperId = null,
    Object? hasReply = null,
    Object? myTurnToReply = null,
    Object? isUserAuthoredSlot = null,
  }) {
    return _then(_self.copyWith(
      paperId: null == paperId
          ? _self.paperId
          : paperId // ignore: cast_nullable_to_non_nullable
              as int,
      hasReply: null == hasReply
          ? _self.hasReply
          : hasReply // ignore: cast_nullable_to_non_nullable
              as bool,
      myTurnToReply: null == myTurnToReply
          ? _self.myTurnToReply
          : myTurnToReply // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserAuthoredSlot: null == isUserAuthoredSlot
          ? _self.isUserAuthoredSlot
          : isUserAuthoredSlot // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PaperStatusModel implements PaperStatusModel {
  const _PaperStatusModel(
      {required this.paperId,
      required this.hasReply,
      required this.myTurnToReply,
      required this.isUserAuthoredSlot});
  factory _PaperStatusModel.fromJson(Map<String, dynamic> json) =>
      _$PaperStatusModelFromJson(json);

  @override
  final int paperId;
  @override
  final bool hasReply;
  @override
  final bool myTurnToReply;
  @override
  final bool isUserAuthoredSlot;

  /// Create a copy of PaperStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaperStatusModelCopyWith<_PaperStatusModel> get copyWith =>
      __$PaperStatusModelCopyWithImpl<_PaperStatusModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaperStatusModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaperStatusModel &&
            (identical(other.paperId, paperId) || other.paperId == paperId) &&
            (identical(other.hasReply, hasReply) ||
                other.hasReply == hasReply) &&
            (identical(other.myTurnToReply, myTurnToReply) ||
                other.myTurnToReply == myTurnToReply) &&
            (identical(other.isUserAuthoredSlot, isUserAuthoredSlot) ||
                other.isUserAuthoredSlot == isUserAuthoredSlot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, paperId, hasReply, myTurnToReply, isUserAuthoredSlot);

  @override
  String toString() {
    return 'PaperStatusModel(paperId: $paperId, hasReply: $hasReply, myTurnToReply: $myTurnToReply, isUserAuthoredSlot: $isUserAuthoredSlot)';
  }
}

/// @nodoc
abstract mixin class _$PaperStatusModelCopyWith<$Res>
    implements $PaperStatusModelCopyWith<$Res> {
  factory _$PaperStatusModelCopyWith(
          _PaperStatusModel value, $Res Function(_PaperStatusModel) _then) =
      __$PaperStatusModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int paperId,
      bool hasReply,
      bool myTurnToReply,
      bool isUserAuthoredSlot});
}

/// @nodoc
class __$PaperStatusModelCopyWithImpl<$Res>
    implements _$PaperStatusModelCopyWith<$Res> {
  __$PaperStatusModelCopyWithImpl(this._self, this._then);

  final _PaperStatusModel _self;
  final $Res Function(_PaperStatusModel) _then;

  /// Create a copy of PaperStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paperId = null,
    Object? hasReply = null,
    Object? myTurnToReply = null,
    Object? isUserAuthoredSlot = null,
  }) {
    return _then(_PaperStatusModel(
      paperId: null == paperId
          ? _self.paperId
          : paperId // ignore: cast_nullable_to_non_nullable
              as int,
      hasReply: null == hasReply
          ? _self.hasReply
          : hasReply // ignore: cast_nullable_to_non_nullable
              as bool,
      myTurnToReply: null == myTurnToReply
          ? _self.myTurnToReply
          : myTurnToReply // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserAuthoredSlot: null == isUserAuthoredSlot
          ? _self.isUserAuthoredSlot
          : isUserAuthoredSlot // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
