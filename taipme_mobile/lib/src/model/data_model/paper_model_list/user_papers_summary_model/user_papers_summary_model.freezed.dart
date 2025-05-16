// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_papers_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPapersSummaryModel {
  List<PaperStatusModel> get papers;
  int get maxPapersAllowed;
  bool get canAddNewPaper;

  /// Create a copy of UserPapersSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserPapersSummaryModelCopyWith<UserPapersSummaryModel> get copyWith =>
      _$UserPapersSummaryModelCopyWithImpl<UserPapersSummaryModel>(
          this as UserPapersSummaryModel, _$identity);

  /// Serializes this UserPapersSummaryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserPapersSummaryModel &&
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
    return 'UserPapersSummaryModel(papers: $papers, maxPapersAllowed: $maxPapersAllowed, canAddNewPaper: $canAddNewPaper)';
  }
}

/// @nodoc
abstract mixin class $UserPapersSummaryModelCopyWith<$Res> {
  factory $UserPapersSummaryModelCopyWith(UserPapersSummaryModel value,
          $Res Function(UserPapersSummaryModel) _then) =
      _$UserPapersSummaryModelCopyWithImpl;
  @useResult
  $Res call(
      {List<PaperStatusModel> papers,
      int maxPapersAllowed,
      bool canAddNewPaper});
}

/// @nodoc
class _$UserPapersSummaryModelCopyWithImpl<$Res>
    implements $UserPapersSummaryModelCopyWith<$Res> {
  _$UserPapersSummaryModelCopyWithImpl(this._self, this._then);

  final UserPapersSummaryModel _self;
  final $Res Function(UserPapersSummaryModel) _then;

  /// Create a copy of UserPapersSummaryModel
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
class _UserPapersSummaryModel implements UserPapersSummaryModel {
  const _UserPapersSummaryModel(
      {required final List<PaperStatusModel> papers,
      required this.maxPapersAllowed,
      required this.canAddNewPaper})
      : _papers = papers;
  factory _UserPapersSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$UserPapersSummaryModelFromJson(json);

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

  /// Create a copy of UserPapersSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserPapersSummaryModelCopyWith<_UserPapersSummaryModel> get copyWith =>
      __$UserPapersSummaryModelCopyWithImpl<_UserPapersSummaryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserPapersSummaryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserPapersSummaryModel &&
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
    return 'UserPapersSummaryModel(papers: $papers, maxPapersAllowed: $maxPapersAllowed, canAddNewPaper: $canAddNewPaper)';
  }
}

/// @nodoc
abstract mixin class _$UserPapersSummaryModelCopyWith<$Res>
    implements $UserPapersSummaryModelCopyWith<$Res> {
  factory _$UserPapersSummaryModelCopyWith(_UserPapersSummaryModel value,
          $Res Function(_UserPapersSummaryModel) _then) =
      __$UserPapersSummaryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<PaperStatusModel> papers,
      int maxPapersAllowed,
      bool canAddNewPaper});
}

/// @nodoc
class __$UserPapersSummaryModelCopyWithImpl<$Res>
    implements _$UserPapersSummaryModelCopyWith<$Res> {
  __$UserPapersSummaryModelCopyWithImpl(this._self, this._then);

  final _UserPapersSummaryModel _self;
  final $Res Function(_UserPapersSummaryModel) _then;

  /// Create a copy of UserPapersSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? papers = null,
    Object? maxPapersAllowed = null,
    Object? canAddNewPaper = null,
  }) {
    return _then(_UserPapersSummaryModel(
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
