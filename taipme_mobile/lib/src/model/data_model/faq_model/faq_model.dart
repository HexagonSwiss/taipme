import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_model.freezed.dart';
part 'faq_model.g.dart';

// COULD BE SEPARATED INTO TWO MODELS, COMPONENT AND DATA
// COMPONENT MODEL WOULD HAVE THE ISEXPANDED PROPERTY
// BUT THIS IS SO SMALL IT COULD BE OVERKILL

@freezed
class FaqModel with _$FaqModel {
  const factory FaqModel({
    required int idFaq,
    required String domFaq,
    required String risFaq,
    DateTime? datFaq,
    String? codStaFaq,
    @Default(false) bool isExpanded,
  }) = _FaqModel;

  factory FaqModel.fromJson(Map<String, Object?> json) =>
      _$FaqModelFromJson(json);
}
