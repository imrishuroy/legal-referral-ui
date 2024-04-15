part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FirmSearched extends ProfileEvent {
  const FirmSearched({
    required this.query,
    required this.limit,
    required this.offset,
  });

  final String query;
  final int limit;
  final int offset;

  @override
  List<Object> get props => [query, limit, offset];
}

class ExperienceAdded extends ProfileEvent {
  const ExperienceAdded({
    required this.addExperienceReq,
  });

  final AddExperienceReq addExperienceReq;

  @override
  List<Object> get props => [addExperienceReq];
}
