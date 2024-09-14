part of 'saved_posts_bloc.dart';

enum SavedPostStatus {
  initial,
  loading,
  success,
  failure,
}

enum SavedPostActionsStatus {
  initial,
  loading,
  success,
  failure,
}

class SavedPostsState extends Equatable {
  const SavedPostsState({
    required this.status,
    required this.actionsStatus,
    this.savedPosts = const [],
    this.failure,
  });

  factory SavedPostsState.initial() {
    return const SavedPostsState(
      status: SavedPostStatus.initial,
      actionsStatus: SavedPostActionsStatus.initial,
    );
  }

  final List<SavedPost> savedPosts;
  final Failure? failure;
  final SavedPostStatus status;
  final SavedPostActionsStatus actionsStatus;

  SavedPostsState copyWith({
    List<SavedPost>? savedPosts,
    Failure? failure,
    SavedPostStatus? status,
    SavedPostActionsStatus? actionsStatus,
  }) {
    return SavedPostsState(
      savedPosts: savedPosts ?? this.savedPosts,
      failure: failure ?? this.failure,
      status: status ?? this.status,
      actionsStatus: actionsStatus ?? this.actionsStatus,
    );
  }

  @override
  List<Object?> get props => [
        savedPosts,
        failure,
        status,
        actionsStatus,
      ];
}
