part of 'ad_bloc.dart';

enum AdStatus { initial, loading, success, failure }

class AdState extends Equatable {
  const AdState({
    required this.adType,
    required this.paymentCycle,
    this.files = const [],
    this.failure,
    this.startDate,
    this.endDate,
    this.playingAds = const [],
    this.expiredAds = const [],
    this.status = AdStatus.initial,
  });

  factory AdState.initial() => const AdState(
        adType: AdType.image,
        paymentCycle: PaymentCycle.weekly,
      );

  final AdType adType;
  final PaymentCycle paymentCycle;
  final List<File> files;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<Ad?> playingAds;
  final List<Ad?> expiredAds;
  final Failure? failure;
  final AdStatus status;

  AdState copyWith({
    AdType? adType,
    PaymentCycle? paymentCycle,
    List<File>? files,
    DateTime? startDate,
    DateTime? endDate,
    List<Ad?>? playingAds,
    List<Ad?>? expiredAds,
    Failure? failure,
    AdStatus? status,
  }) {
    return AdState(
      adType: adType ?? this.adType,
      paymentCycle: paymentCycle ?? this.paymentCycle,
      files: files ?? this.files,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      playingAds: playingAds ?? this.playingAds,
      expiredAds: expiredAds ?? this.expiredAds,
      failure: failure ?? this.failure,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        adType,
        paymentCycle,
        startDate,
        endDate,
        files,
        playingAds,
        expiredAds,
        failure,
        status,
      ];
}
