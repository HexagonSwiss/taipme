// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'papers_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PapersSummaryModel {
  List<PaperStatusModel> get papers;
  int get maxPapersAllowed;
  bool get canAddNewPaper;

  /// Create a copy of PapersSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PapersSummaryModelCopyWith<PapersSummaryModel> get copyWith =>
      _$PapersSummaryModelCopyWithImpl<PapersSummaryModel>(
          this as PapersSummaryModel, _$identity);

  /// Serializes this PapersSummaryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PapersSummaryModel &&
            const DeepCollectionEquality().equals(other.papers, papers) &&
            (identical(other.maxPapersAllowed, maxPapersAllowed) ||
                other.maxPapersAllowed == maxPapersAllowed) &&
            (identical(other.canAddNewPaper, canAddNewPaper) ||
                other.canAddNewPaper == canAddNewPaper));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(papers),
      maxPapersAllowed,
      canAddNewPaper);

  @override
  String toString() {
    return 'PapersSummaryModel(papers: $papers, maxPapersAllowed: $maxPapersAllowed, canAddNewPaper: $canAddNewPaper)';
  }
}

/// @nodoc
abstract mixin class $PapersSummaryModelCopyWith<$Res> {
  factory $PapersSummaryModelCopyWith(
          PapersSummaryModel value, $Res Function(PapersSummaryModel) _then) =
      _$PapersSummaryModelCopyWithImpl;
  @useResult
  $Res call(
      {List<PaperStatusModel> papers,
      int maxPapersAllowed,
      bool canAddNewPaper});
}

/// @nodoc
class _$PapersSummaryModelCopyWithImpl<$Res>
    implements $PapersSummaryModelCopyWith<$Res> {
  _$PapersSummaryModelCopyWithImpl(this._self, this._then);

  final PapersSummaryModel _self;
  final $Res Function(PapersSummaryModel) _then;

  /// Create a copy of PapersSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? papers = null,
    Object? maxPapersAllowed = null,
    Object? canAddNewPaper = null,
  }) {
    return _then(_self.copyWith(
      papers: null == papers
          ? _self.papers
          : papers // ignore: cast_nullable_to_non_nullable
              as List<PaperStatusModel>,
      maxPapersAllowed: null == maxPapersAllowed
          ? _self.maxPapersAllowed
          : maxPapersAllowed // ignore: cast_nullable_to_non_nullable
              as int,
      canAddNewPaper: null == canAddNewPaper
          ? _self.canAddNewPaper
          : canAddNewPaper // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PapersSummaryModel implements PapersSummaryModel {
  const _PapersSummaryModel(
      {required final List<PaperStatusModel> papers,
      required this.maxPapersAllowed,
      required this.canAddNewPaper})
      : _papers = papers;
  factory _PapersSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$PapersSummaryModelFromJson(json);

  final List<PaperStatusModel> _papers;
  @override
  List<PaperStatusModel> get papers {
    if (_papers is EqualUnmodifiableListView) return _papers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_papers);
  }

  @override
  final int maxPapersAllowed;
  @override
  final bool canAddNewPaper;

  /// Create a copy of PapersSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PapersSummaryModelCopyWith<_PapersSummaryModel> get copyWith =>
      __$PapersSummaryModelCopyWithImpl<_PapersSummaryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PapersSummaryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PapersSummaryModel &&
            const DeepCollectionEquality().equals(other._papers, _papers) &&
            (identical(other.maxPapersAllowed, maxPapersAllowed) ||
                other.maxPapersAllowed == maxPapersAllowed) &&
            (identical(other.canAddNewPaper, canAddNewPaper) ||
                other.canAddNewPaper == canAddNewPaper));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_papers),
      maxPapersAllowed,
      canAddNewPaper);

  @override
  String toString() {
    return 'PapersSummaryModel(papers: $papers, maxPapersAllowed: $maxPapersAllowed, canAddNewPaper: $canAddNewPaper)';
  }
}

/// @nodoc
abstract mixin class _$PapersSummaryModelCopyWith<$Res>
    implements $PapersSummaryModelCopyWith<$Res> {
  factory _$PapersSummaryModelCopyWith(
          _PapersSummaryModel value, $Res Function(_PapersSummaryModel) _then) =
      __$PapersSummaryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<PaperStatusModel> papers,
      int maxPapersAllowed,
      bool canAddNewPaper});
}

/// @nodoc
class __$PapersSummaryModelCopyWithImpl<$Res>
    implements _$PapersSummaryModelCopyWith<$Res> {
  __$PapersSummaryModelCopyWithImpl(this._self, this._then);

  final _PapersSummaryModel _self;
  final $Res Function(_PapersSummaryModel) _then;

  /// Create a copy of PapersSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? papers = null,
    Object? maxPapersAllowed = null,
    Object? canAddNewPaper = null,
  }) {
    return _then(_PapersSummaryModel(
      papers: null == papers
          ? _self._papers
          : papers // ignore: cast_nullable_to_non_nullable
              as List<PaperStatusModel>,
      maxPapersAllowed: null == maxPapersAllowed
          ? _self.maxPapersAllowed
          : maxPapersAllowed // ignore: cast_nullable_to_non_nullable
              as int,
      canAddNewPaper: null == canAddNewPaper
          ? _self.canAddNewPaper
          : canAddNewPaper // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
