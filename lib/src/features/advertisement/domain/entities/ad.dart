import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/datetime_json_converter.dart';

// {
//     "ad_id": 1,
//     "ad_type": "image",
//     "title": "This is first ad post",
//     "description": "This a description",
//     "link": "https://google.com",
//     "media": [
//         "https://legalreferral-post-images.s3.ap-south-1.amazonaws.com/20240713_001606_01c5edf5.jpg",
//         "https://legalreferral-post-images.s3.ap-south-1.amazonaws.com/20240713_001609_b3ae1c59.jpg"
//     ],
//     "payment_cycle": "monthly",
//     "author_id": "DlQrTA39q7aI8twLglKknFmWDMF2",
//     "start_date": "2024-07-12T05:30:00+05:30",
//     "end_date": "2024-07-13T05:30:00+05:30",
//     "created_at": "2024-07-13T00:16:10.518611+05:30"
// }

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
