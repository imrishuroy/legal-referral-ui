part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, failure }

class PostState extends Equatable {
  const PostState({
    required this.status,
    this.text = '',
    this.pickedFile,
    this.postType = PostType.text,
    this.post,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.files = const [],
    this.failure,
  });

  factory PostState.initial() {
    return const PostState(
      status: PostStatus.initial,
    );
  }

  final PostType postType;
  final String text;
  final List<File> files;
  final File? pickedFile;
  final Post? post;
  final int likesCount;
  final int commentsCount;
  final PostStatus status;
  final Failure? failure;

  PostState copyWith({
    PostStatus? status,
    String? text,
    List<File>? files,
    PostType? postType,
    File? filePath,
    Post? post,
    int? likesCount,
    int? commentsCount,
    Failure? failure,
  }) {
    return PostState(
      status: status ?? this.status,
      text: text ?? this.text,
      files: files ?? this.files,
      postType: postType ?? this.postType,
      post: post ?? this.post,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      pickedFile: filePath ?? pickedFile,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        text,
        postType,
        files,
        pickedFile,
        post,
        likesCount,
        commentsCount,
        failure,
      ];
}
