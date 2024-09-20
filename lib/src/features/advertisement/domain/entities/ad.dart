import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/datetime_json_converter.dart';

part 'ad.freezed.dart';
part 'ad.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum AdType {
  @JsonValue('image')
  image,
  @JsonValue('video')
  video,
  @JsonValue('other')
  other,
}

@JsonEnum(fieldRename: FieldRename.snake)
enum PaymentCycle {
  @JsonValue('weekly')
  weekly,
  @JsonValue('monthly')
  monthly,
  @JsonValue('yearly')
  yearly,
}

@freezed
class Ad with _$Ad {
  const factory Ad({
    @JsonKey(name: 'ad_type') required AdType type,
    required String title,
    required String description,
    required String link,
    @JsonKey(name: 'payment_cycle') required PaymentCycle paymentCycle,
    @JsonKey(name: 'author_id') required String authorId,
    @DateTimeJsonConverter()
    @JsonKey(name: 'start_date')
    required DateTime startDate,
    @DateTimeJsonConverter()
    @JsonKey(name: 'end_date')
    required DateTime endDate,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'ad_id', includeIfNull: false) int? adId,
    @JsonKey(name: 'media') @Default([]) List<String?> mediaUrls,
  }) = _Ad;

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);
}
