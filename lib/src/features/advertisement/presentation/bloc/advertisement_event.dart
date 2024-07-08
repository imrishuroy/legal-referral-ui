part of 'advertisement_bloc.dart';

abstract class AdvertisementEvent extends Equatable {
  const AdvertisementEvent();

  @override
  List<Object> get props => [];
}

class AdSelected extends AdvertisementEvent {
  const AdSelected({
    required this.advertiseType,
  });
  final AdvertiseType advertiseType;
  @override
  List<Object> get props => [advertiseType];
}

class FileRemoved extends AdvertisementEvent {}
