part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, failure }

class PostState extends Equatable {
  const PostState({
    required this.status,
    this.text = '',
    this.pickedFile,
    this.postType = PostType.text,
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
  final PostStatus status;
  final Failure? failure;

  PostState copyWith({
    PostStatus? status,
    String? text,
    List<File>? files,
    PostType? postType,
    File? filePath,
    Failure? failure,
  }) {
    return PostState(
      status: status ?? this.status,
      text: text ?? this.text,
      files: files ?? this.files,
      postType: postType ?? this.postType,
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
        failure,
      ];
}
