import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/discussion/data/data.dart';
import 'package:legal_referral_ui/src/features/discussion/domain/domain.dart';

part 'discussion_event.dart';
part 'discussion_state.dart';

@injectable
class DiscussionBloc extends Bloc<DiscussionEvent, DiscussionState> {
  DiscussionBloc({
    required AuthBloc authBloc,
    required DiscussionUsecase discussionUsecase,
  })  : _authBloc = authBloc,
        _discussionUsecase = discussionUsecase,
        super(DiscussionState.initial()) {
    on<UserConnectionsFetched>(_onUserConnectionsFetched);
    on<UsersFetched>(_onUsersFetched);
    on<DiscussionCreated>(_onDiscussionCreated);
    on<DiscussionTopicUpdated>(_onDiscussionTopicUpdated);
    on<DiscussionAudienceSelected>(_onDiscussionAudienceSelected);
    on<AllUsersSelected>(_onAllUserSelected);
    on<UserSelected>(_onUserSelected);
    on<DiscussionInvitesFetched>(_onDiscussionInviteFetched);
    on<ActiveDiscussionFetched>(_onActiveDiscussionFetched);
    on<DiscussionMessageSent>(_onDiscussionMessageSent);
    on<DiscussionMessagesFetched>(_onDiscussionMessagesFetched);
    on<DiscussionJoined>(_onDiscussionJoined);
    on<DiscussionRejected>(_onDiscussionRejected);
    on<ParentMesssgeUpdated>(_onParentMessageUpdated);
    on<DiscussionParticipantsFetched>(_onDiscussionParticipantsFetched);
    on<DiscussionUpdateToggled>(_onDiscussionUpdateToggled);
    on<DiscussionUninvitedUsersFetched>(_onDiscussionUninvitedUsersFetched);
  }

  final AuthBloc _authBloc;
  final DiscussionUsecase _discussionUsecase;

  Future<void> _onDiscussionCreated(
    DiscussionCreated event,
    Emitter<DiscussionState> emit,
  ) async {
    emit(
      state.copyWith(
        status: DiscussionStatus.loading,
      ),
    );

    final result = await _discussionUsecase.createDiscussion(
      createDiscussionReq: event.createDiscussionReq,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: DiscussionStatus.failure,
        ),
      ),
      (discussion) => emit(
        state.copyWith(
          status: DiscussionStatus.discussionCreated,
        ),
      ),
    );
  }

  Future<void> _onDiscussionTopicUpdated(
    DiscussionTopicUpdated event,
    Emitter<DiscussionState> emit,
  ) async {
    emit(
      state.copyWith(
        status: DiscussionStatus.loading,
      ),
    );

    final result = await _discussionUsecase.updateDiscussionTopic(
      discussionId: event.discussionId,
      updateDiscussionTopicReq: event.updateDiscussionTopicReq,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: DiscussionStatus.failure,
        ),
      ),
      (discussion) => emit(
        state.copyWith(
          discussionUpdateToggle: false,
          status: DiscussionStatus.success,
        ),
      ),
    );
  }

  Future<void> _onUserConnectionsFetched(
    UserConnectionsFetched event,
    Emitter<DiscussionState> emit,
  ) async {
    emit(state.copyWith(status: DiscussionStatus.loading));

    final res = await _discussionUsecase.fetchConnectedUsers(
      userId: event.userId,
      limit: event.limit,
      offset: event.offset,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            status: DiscussionStatus.failure,
            failure: failure,
          ),
        );
      },
      (users) {
        emit(
          state.copyWith(
            users: users,
            selectedUsers: users,
            status: DiscussionStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onUsersFetched(
    UsersFetched event,
    Emitter<DiscussionState> emit,
  ) async {
    emit(state.copyWith(status: DiscussionStatus.loading));

    final res = await _discussionUsecase.fetchUsers(
      limit: event.limit,
      offset: event.offset,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            status: DiscussionStatus.failure,
            failure: failure,
          ),
        );
      },
      (users) {
        emit(
          state.copyWith(
            users: users,
            selectedUsers: users,
            status: DiscussionStatus.success,
          ),
        );
      },
    );
  }

  void _onUserSelected(
    UserSelected event,
    Emitter<DiscussionState> emit,
  ) {
    final selectedUsers = state.selectedUsers;
    final user = event.user;
    if (selectedUsers.contains(user)) {
      final updatedUsers = selectedUsers.where((u) => u != user).toList();
      emit(state.copyWith(selectedUsers: updatedUsers));
    } else {
      final updatedUsers = [...selectedUsers, user];
      emit(state.copyWith(selectedUsers: updatedUsers));
    }
  }

  void _onDiscussionAudienceSelected(
    DiscussionAudienceSelected event,
    Emitter<DiscussionState> emit,
  ) {
    emit(state.copyWith(audience: event.audience));
  }

  void _onAllUserSelected(
    AllUsersSelected event,
    Emitter<DiscussionState> emit,
  ) {
    emit(state.copyWith(selectedUsers: state.users));
  }

  Future<void> _onDiscussionInviteFetched(
    DiscussionInvitesFetched event,
    Emitter<DiscussionState> emit,
  ) async {
    emit(state.copyWith(status: DiscussionStatus.loading));

    final res = await _discussionUsecase.fetchDiscussionInvites(
      userId: event.userId,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            status: DiscussionStatus.failure,
            failure: failure,
          ),
        );
      },
      (invites) {
        emit(
          state.copyWith(
            discussionInvites: invites,
            status: DiscussionStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onActiveDiscussionFetched(
    ActiveDiscussionFetched event,
    Emitter<DiscussionState> emit,
  ) async {
    emit(state.copyWith(status: DiscussionStatus.loading));

    final res = await _discussionUsecase.fetchActiveDiscussions(
      userId: event.userId,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            status: DiscussionStatus.failure,
            failure: failure,
          ),
        );
      },
      (discussions) {
        emit(
          state.copyWith(
            discussions: discussions,
            status: DiscussionStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onDiscussionMessageSent(
    DiscussionMessageSent event,
    Emitter<DiscussionState> emit,
  ) async {
    final userId = _authBloc.state.user?.userId;
    final res = await _discussionUsecase.sendMessageToDiscussion(
      discussionMessage: event.discussionMessage.copyWith(
        senderId: userId ?? '',
        senderFirstName: _authBloc.state.user?.firstName ?? '',
        senderLastName: _authBloc.state.user?.lastName ?? '',
        senderAvatarImg: _authBloc.state.user?.avatarUrl ?? '',
      ),
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            status: DiscussionStatus.failure,
            failure: failure,
          ),
        );
      },
      (message) {
        emit(
          state.copyWith(
            discussionMessages: [...state.discussionMessages, message],
            status: DiscussionStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onDiscussionMessagesFetched(
    DiscussionMessagesFetched event,
    Emitter<DiscussionState> emit,
  ) async {
    emit(state.copyWith(status: DiscussionStatus.loading));

    final res = await _discussionUsecase.fetchDiscussionMessages(
      discussionId: event.discussionId,
      limit: event.limit,
      offset: event.offset,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            status: DiscussionStatus.failure,
            failure: failure,
          ),
        );
      },
      (messages) {
        emit(
          state.copyWith(
            discussionMessages: messages,
            status: DiscussionStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onDiscussionJoined(
    DiscussionJoined event,
    Emitter<DiscussionState> emit,
  ) async {
    emit(state.copyWith(status: DiscussionStatus.loading));

    final res = await _discussionUsecase.joinDiscussion(
      discussionId: event.discussionId,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            status: DiscussionStatus.failure,
            failure: failure,
          ),
        );
      },
      (discussion) {
        emit(
          state.copyWith(
            discussionInvites: state.discussionInvites
                .where(
                  (element) =>
                      element?.discussion.discussionId != event.discussionId,
                )
                .toList(),
            status: DiscussionStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onDiscussionRejected(
    DiscussionRejected event,
    Emitter<DiscussionState> emit,
  ) async {
    emit(state.copyWith(status: DiscussionStatus.loading));

    final res = await _discussionUsecase.rejectDiscussion(
      discussionId: event.discussionId,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            status: DiscussionStatus.failure,
            failure: failure,
          ),
        );
      },
      (discussion) {
        emit(
          state.copyWith(
            discussionInvites: state.discussionInvites
                .where(
                  (element) =>
                      element?.discussion.discussionId != event.discussionId,
                )
                .toList(),
            status: DiscussionStatus.success,
          ),
        );
      },
    );
  }

  void _onParentMessageUpdated(
    ParentMesssgeUpdated event,
    Emitter<DiscussionState> emit,
  ) {
    emit(
      state.copyWith(
        parentMessage: event.message,
      ),
    );
  }

  Future<void> _onDiscussionParticipantsFetched(
    DiscussionParticipantsFetched event,
    Emitter<DiscussionState> emit,
  ) async {
    emit(state.copyWith(status: DiscussionStatus.loading));

    final res = await _discussionUsecase.fetchDiscussionParticipants(
      discussionId: event.discussionId,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            status: DiscussionStatus.failure,
            failure: failure,
          ),
        );
      },
      (participants) {
        emit(
          state.copyWith(
            discussionParticipants: participants,
            status: DiscussionStatus.success,
          ),
        );
      },
    );
  }

  void _onDiscussionUpdateToggled(
    DiscussionUpdateToggled event,
    Emitter<DiscussionState> emit,
  ) {
    emit(
      state.copyWith(
        discussionUpdateToggle: !state.discussionUpdateToggle,
      ),
    );
  }

  Future<void> _onDiscussionUninvitedUsersFetched(
    DiscussionUninvitedUsersFetched event,
    Emitter<DiscussionState> emit,
  ) async {
    emit(state.copyWith(status: DiscussionStatus.loading));

    final res = await _discussionUsecase.fetchDiscussionUninvitedUsers(
      discussionId: event.discussionId,
    );

    res.fold(
      (failure) {
        emit(
          state.copyWith(
            status: DiscussionStatus.failure,
            failure: failure,
          ),
        );
      },
      (users) {
        emit(
          state.copyWith(
            users: users,
            status: DiscussionStatus.success,
          ),
        );
      },
    );
  }
}
