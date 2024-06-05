part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}
class AddedFile extends PostEvent{}
class RemovedFile extends PostEvent{}
class Post extends PostEvent{}