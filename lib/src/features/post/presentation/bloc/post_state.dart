part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, failure }

enum DocumentType {
  initial,
  image,
  multiImage,
  video,
  document,
}

class PostState extends Equatable {
  const PostState({
    required this.status,
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
  final List<File> files;
  final File? pickedFile;
  final PostStatus status;
  final Failure? failure;

  PostState copyWith({
    PostStatus? status,
    PostType? postType,
    List<File>? files,
    File? filePath,
    Failure? failure,
  }) {
    return PostState(
      status: status ?? this.status,
      postType: postType ?? this.postType,
      files: files ?? this.files,
      pickedFile: filePath ?? pickedFile,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        postType,
        files,
        pickedFile,
        failure,
      ];
}
