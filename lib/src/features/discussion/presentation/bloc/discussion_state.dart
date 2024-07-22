part of 'discussion_bloc.dart';

enum DiscussionStatus { initial, loading, success, discussionCreated, failure }

enum DiscussionAudience { anyone, connected }

class DiscussionState extends Equatable {
  const DiscussionState({
    required this.status,
    this.users = const [],
    this.selectedUsers = const [],
    this.audience = DiscussionAudience.connected,
    this.discussionInvites = const [],
    this.discussions = const [],
    this.discussionMessages = const [],
    this.parentMessage,
    this.discussionParticipants = const [],
    this.discussionUpdateToggle = false,
    this.failure,
  });

  factory DiscussionState.initial() {
    return const DiscussionState(
      status: DiscussionStatus.initial,
    );
  }

  final List<AppUser?> users;
  final List<AppUser?> selectedUsers;
  final Failure? failure;
  final DiscussionAudience audience;
  final List<DiscussionInviteRes?> discussionInvites;
  final List<Discussion?> discussions;
  final List<DiscussionMessage?> discussionMessages;
  final DiscussionMessage? parentMessage;
  final List<AppUser?> discussionParticipants;
  final bool discussionUpdateToggle;
  final DiscussionStatus status;

  DiscussionState copyWith({
    List<AppUser?>? users,
    List<AppUser?>? selectedUsers,
    Failure? failure,
    DiscussionAudience? audience,
    List<DiscussionInviteRes?>? discussionInvites,
    List<Discussion?>? discussions,
    List<DiscussionMessage?>? discussionMessages,
    DiscussionMessage? parentMessage,
    List<AppUser?>? discussionParticipants,
    bool? discussionUpdateToggle,
    DiscussionStatus? status,
  }) {
    return DiscussionState(
      users: users ?? this.users,
      selectedUsers: selectedUsers ?? this.selectedUsers,
      failure: failure ?? this.failure,
      audience: audience ?? this.audience,
      discussionInvites: discussionInvites ?? this.discussionInvites,
      discussions: discussions ?? this.discussions,
      discussionMessages: discussionMessages ?? this.discussionMessages,
      parentMessage: parentMessage,
      discussionParticipants:
          discussionParticipants ?? this.discussionParticipants,
      discussionUpdateToggle:
          discussionUpdateToggle ?? this.discussionUpdateToggle,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        users,
        selectedUsers,
        failure,
        audience,
        discussionInvites,
        discussions,
        discussionMessages,
        parentMessage,
        discussionParticipants,
        discussionUpdateToggle,
        status,
      ];
}
