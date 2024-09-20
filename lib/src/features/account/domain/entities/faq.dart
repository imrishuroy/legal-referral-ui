import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

part 'faq.freezed.dart';
part 'faq.g.dart';

@freezed
class FAQ with _$FAQ {
  const factory FAQ({
    required String question,
    required String answer,
    @DateTimeJsonConverter()
    @JsonKey(name: 'created_at', includeToJson: false)
    DateTime? createdAt,
    @JsonKey(name: 'faq_id', includeToJson: false) int? id,
  }) = _FAQ;

  factory FAQ.fromJson(Map<String, dynamic> json) => _$FAQFromJson(json);
}
