part of 'advertisement_bloc.dart';

enum AdvertiseType { image, video, success, loading }

class AdvertisementState extends Equatable {
  const AdvertisementState({
    required this.advertiseType,
    this.fileType = const [],
  });
  factory AdvertisementState.initial() => const AdvertisementState(
        advertiseType: AdvertiseType.image,
      );
  final AdvertiseType advertiseType;
  final List<File> fileType;

  @override
  List<Object?> get props => [advertiseType, fileType];
  AdvertisementState copyWith({
    AdvertiseType? advertiseType,
    List<File>? fileType,
  }) {
    return AdvertisementState(
      advertiseType: advertiseType ?? this.advertiseType,
      fileType: fileType ?? this.fileType,
    );
  }
}
