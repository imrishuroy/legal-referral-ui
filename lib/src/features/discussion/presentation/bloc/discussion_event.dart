part of 'discussion_bloc.dart';

abstract class DiscussionEvent extends Equatable {
  const DiscussionEvent();

  @override
  List<Object> get props => [];
}

class UserConnectionsFetched extends DiscussionEvent {
  const UserConnectionsFetched({
    required this.userId,
    required this.limit,
    required this.offset,
  });

  final String userId;
  final int limit;
  final int offset;

  @override
  List<Object> get props => [userId, limit, offset];
}

class UsersFetched extends DiscussionEvent {
  const UsersFetched({
    required this.userId,
    required this.limit,
    required this.offset,
  });

  final String userId;
  final int limit;
  final int offset;

  @override
  List<Object> get props => [userId, limit, offset];
}

class DiscussionCreated extends DiscussionEvent {
  const DiscussionCreated({
    required this.createDiscussionReq,
  });
  final CreateDiscussionReq createDiscussionReq;

  @override
  List<Object> get props => [createDiscussionReq];
}

class UserSelected extends DiscussionEvent {
  const UserSelected({
    required this.user,
  });
  final AppUser user;

  @override
  List<Object> get props => [user];
}

class DiscussionAudienceSelected extends DiscussionEvent {
  const DiscussionAudienceSelected({
    required this.audience,
  });
  final DiscussionAudience audience;

  @override
  List<Object> get props => [audience];
}

class AllUsersSelected extends DiscussionEvent {}

class DiscussionInvitesFetched extends DiscussionEvent {
  const DiscussionInvitesFetched({
    required this.userId,
  });

  final String userId;

  @override
  List<Object> get props => [userId];
}

class ActiveDiscussionFetched extends DiscussionEvent {
  const ActiveDiscussionFetched({
    required this.userId,
  });

  final String userId;

  @override
  List<Object> get props => [userId];
}

class DiscussionMessagesFetched extends DiscussionEvent {
  const DiscussionMessagesFetched({
    required this.discussionId,
    required this.limit,
    required this.offset,
  });

  final int discussionId;
  final int limit;
  final int offset;

  @override
  List<Object> get props => [discussionId, limit, offset];
}

class DiscussionMessageSent extends DiscussionEvent {
  const DiscussionMessageSent({
    required this.discussionMessage,
  });

  final DiscussionMessage discussionMessage;

  @override
  List<Object> get props => [discussionMessage];
}

class DiscussionJoined extends DiscussionEvent {
  const DiscussionJoined({
    required this.discussionId,
  });

  final int discussionId;

  @override
  List<Object> get props => [discussionId];
}

class DiscussionRejected extends DiscussionEvent {
  const DiscussionRejected({
    required this.discussionId,
  });

  final int discussionId;

  @override
  List<Object> get props => [discussionId];
}

class ParentMesssgeUpdated extends DiscussionEvent {
  const ParentMesssgeUpdated({
    required this.message,
  });

  final DiscussionMessage message;

  @override
  List<Object> get props => [message];
}

class DiscussionParticipantsFetched extends DiscussionEvent {
  const DiscussionParticipantsFetched({
    required this.discussionId,
  });

  final int discussionId;

  @override
  List<Object> get props => [discussionId];
}
