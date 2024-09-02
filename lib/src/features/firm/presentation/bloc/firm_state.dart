part of 'firm_bloc.dart';

enum FirmStatus { initial, loading, success, error, firmAdded }

class FirmState extends Equatable {
  const FirmState({
    required this.myFirms,
    required this.socialMedias,
    required this.status,
    this.pickedFile,
    this.failure,
  });

  factory FirmState.initial() {
    return const FirmState(
      myFirms: [],
      socialMedias: [],
      status: FirmStatus.initial,
    );
  }

  final List<Firm> myFirms;
  final List<SocialMedia> socialMedias;
  final File? pickedFile;
  final FirmStatus status;
  final Failure? failure;

  FirmState copyWith({
    List<Firm>? myFirms,
    List<SocialMedia>? socialMedias,
    File? pickedFile,
    FirmStatus? status,
    Failure? failure,
  }) {
    return FirmState(
      myFirms: myFirms ?? this.myFirms,
      socialMedias: socialMedias ?? this.socialMedias,
      pickedFile: pickedFile ?? this.pickedFile,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        myFirms,
        socialMedias,
        pickedFile,
        status,
        failure,
      ];
}
