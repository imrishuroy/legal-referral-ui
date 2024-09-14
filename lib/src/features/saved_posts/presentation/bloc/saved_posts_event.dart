part of 'saved_posts_bloc.dart';

sealed class SavedPostsEvent extends Equatable {
  const SavedPostsEvent();

  @override
  List<Object> get props => [];
}

class PostSaved extends SavedPostsEvent {
  const PostSaved({
    required this.userId,
    required this.postId,
  });
  final String userId;
  final int postId;

  @override
  List<Object> get props => [userId, postId];
}

class PostUnsaved extends SavedPostsEvent {
  const PostUnsaved({
    required this.savedPostId,
  });
  final int savedPostId;

  @override
  List<Object> get props => [savedPostId];
}

class SavedPostsFetched extends SavedPostsEvent {
  const SavedPostsFetched({
    required this.userId,
  });
  final String userId;

  @override
  List<Object> get props => [userId];
}
