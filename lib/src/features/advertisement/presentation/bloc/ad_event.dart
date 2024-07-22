part of 'ad_bloc.dart';

abstract class AdEvent extends Equatable {
  const AdEvent();

  @override
  List<Object> get props => [];
}

class AdTypeChanged extends AdEvent {
  const AdTypeChanged({required this.adType});

  final AdType adType;

  @override
  List<Object> get props => [adType];
}

class AdFilePicked extends AdEvent {
  const AdFilePicked();

  @override
  List<Object> get props => [];
}

class PaymentCycleChanged extends AdEvent {
  const PaymentCycleChanged({required this.paymentCycle});

  final PaymentCycle paymentCycle;

  @override
  List<Object> get props => [paymentCycle];
}

class AdStartDateChanged extends AdEvent {
  const AdStartDateChanged({required this.startDate});

  final DateTime startDate;

  @override
  List<Object> get props => [startDate];
}

class AdEndDateChanged extends AdEvent {
  const AdEndDateChanged({required this.endDate});

  final DateTime endDate;

  @override
  List<Object> get props => [endDate];
}

class AdCreated extends AdEvent {
  const AdCreated({required this.ad});

  final CreateAdReq ad;

  @override
  List<Object> get props => [ad];
}

class FileRemoved extends AdEvent {
  const FileRemoved({required this.index});

  final int index;

  @override
  List<Object> get props => [index];
}

class PlayingAdsFetched extends AdEvent {
  const PlayingAdsFetched();

  @override
  List<Object> get props => [];
}

class ExpiredAdsFetched extends AdEvent {
  const ExpiredAdsFetched();

  @override
  List<Object> get props => [];
}

class AdPeriodExtended extends AdEvent {
  const AdPeriodExtended({required this.adId, required this.endDate});

  final int adId;
  final DateTime endDate;

  @override
  List<Object> get props => [adId, endDate];
}
