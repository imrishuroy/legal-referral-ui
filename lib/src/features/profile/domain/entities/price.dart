import 'package:freezed_annotation/freezed_annotation.dart';

part 'price.freezed.dart';
part 'price.g.dart';

enum PriceServiceType {
  @JsonValue('per_hour')
  perHour,
  @JsonValue('per_hearing')
  perHearing,
  @JsonValue('contingency')
  contingency,
  @JsonValue('hybrid')
  hybrid,
}

@freezed
class Price with _$Price {
  const factory Price({
    @JsonKey(name: 'service_type') required PriceServiceType? serviceType,
    @JsonKey(name: 'per_hour_price', includeIfNull: false) double? perHourPrice,
    @JsonKey(name: 'per_hearing_price', includeIfNull: false)
    double? perHearingPrice,
    @JsonKey(name: 'contingency_price', includeIfNull: false)
    String? contingencyPrice,
    @JsonKey(name: 'hybrid_price', includeIfNull: false) String? hybridPrice,
    @JsonKey(name: 'price_id', includeToJson: false) int? priceId,
    @JsonKey(
      name: 'user_id',
      includeToJson: false,
      includeIfNull: false,
    )
    String? userId,
  }) = _Price;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}
