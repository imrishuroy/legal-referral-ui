part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostTextChanged extends PostEvent {
  const PostTextChanged({
    required this.text,
  });

  final String text;

  @override
  List<Object> get props => [text];
}

class FilePicked extends PostEvent {
  const FilePicked({required this.postType});

  final PostType postType;

  @override
  List<Object> get props => [postType];
}

class FileRemoved extends PostEvent {
  const FileRemoved({
    this.index,
  });
  final int? index;
}

class PostCreated extends PostEvent {
  const PostCreated({
    required this.ownerId,
    required this.content,
  });

  final String ownerId;
  final String content;

  @override
  List<Object> get props => [ownerId, content];
}
