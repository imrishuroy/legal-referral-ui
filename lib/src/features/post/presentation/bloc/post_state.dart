part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, failure }

enum LikedUsersStatus { initial, loading, success, failure }

enum CommentStatus { initial, loading, success, failure }

class PostState extends Equatable {
  const PostState({
    required this.status,
    this.postType = PostType.text,
    this.text = '',
    this.files = const [],
    this.pickedFile,
    this.post,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.comments = const [],
    this.parentCommentId,
    this.postLikedUsers = const [],
    this.likedUsersStatus = LikedUsersStatus.initial,
    this.commentStatus = CommentStatus.initial,
    this.failure,
  });

  factory PostState.initial() {
    return const PostState(
      status: PostStatus.initial,
    );
  }

  final PostStatus status;
  final PostType postType;
  final String text;
  final Post? post;
  final List<File> files;
  final File? pickedFile;
  final int likesCount;
  final int commentsCount;
  final List<Comment?> comments;
  final int? parentCommentId;
  final List<AppUser?> postLikedUsers;
  final LikedUsersStatus likedUsersStatus;
  final CommentStatus commentStatus;

  final Failure? failure;

  PostState copyWith({
    PostStatus? status,
    PostType? postType,
    String? text,
    List<File>? files,
    File? filePath,
    Post? post,
    int? likesCount,
    int? commentsCount,
    List<Comment?>? comments,
    int? parentCommentId,
    List<AppUser?>? postLikedUsers,
    LikedUsersStatus? likedUsersStatus,
    CommentStatus? commentStatus,
    Failure? failure,
  }) {
    return PostState(
      status: status ?? this.status,
      postType: postType ?? this.postType,
      text: text ?? this.text,
      files: files ?? this.files,
      pickedFile: filePath ?? pickedFile,
      post: post ?? this.post,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      comments: comments ?? this.comments,
      parentCommentId: parentCommentId ?? this.parentCommentId,
      postLikedUsers: postLikedUsers ?? this.postLikedUsers,
      likedUsersStatus: likedUsersStatus ?? this.likedUsersStatus,
      commentStatus: commentStatus ?? this.commentStatus,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        postType,
        text,
        files,
        pickedFile,
        post,
        likesCount,
        commentsCount,
        comments,
        parentCommentId,
        postLikedUsers,
        likedUsersStatus,
        commentStatus,
        failure,
      ];
}
