part of 'discussion_bloc.dart';

abstract class DiscussionState extends Equatable {
  const DiscussionState();  

  @override
  List<Object> get props => [];
}
class DiscussionInitial extends DiscussionState {}
