import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/data/data.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

part 'post_event.dart';
part 'post_state.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required PostUsecase postUsecase})
      : _postUsecase = postUsecase,
        super(PostState.initial()) {
    on<PostTextChanged>(_onPostTextChanged);
    on<FilePicked>(_onFileAdded);
    on<FileRemoved>(_onFileRemoved);
    on<PostCreated>(_onPostCreated);
    on<PostFetched>(_onPostFetched);
    on<PostLiked>(_onPostLiked);
    on<PostUnliked>(_onPostUnliked);
    on<PostCommented>(_onPostCommented);
    on<PostCommentsFetched>(_onPostCommentsFetched);
    on<PostCommentLiked>(_onPostCommentLiked);
    on<PostCommentUnliked>(_onPostCommentUnliked);
    on<FeedParentCommentIdChanged>(_onFeedParentCommentIdChanged);
  }

  final PostUsecase _postUsecase;

  Future<void> _onPostTextChanged(event, emit) async {
    emit(
      state.copyWith(
        text: event.text,
      ),
    );
  }

  Future<void> _onFileAdded(FilePicked event, emit) async {
    var files = <File>[];
    emit(
      state.copyWith(
        files: files,
        postType: event.postType,
      ),
    );
    if (event.postType == PostType.image) {
      final pickedImages = await ImageUtil.pickMultipleImages();
      files = pickedImages;
    } else if (event.postType == PostType.video) {
      final pickedVideo = await FilePickerUtil.pickVideo();
      if (pickedVideo != null) {
        files = [pickedVideo];
      }
    } else if (event.postType == PostType.document) {
      final pickedDocument = await FilePickerUtil.pickDocument();
      if (pickedDocument != null) {
        files = [pickedDocument];
      }
    }

    emit(
      state.copyWith(
        files: files,
        postType: event.postType,
      ),
    );
  }

  FutureOr<void> _onFileRemoved(event, emit) async {
    final index = event.index;
    final files = List<File>.from(state.files);
    if (index != null && index < files.length) {
      files.removeAt(index);
      emit(
        state.copyWith(
          files: files,
        ),
      );
    }
  }

  FutureOr<void> _onPostCreated(event, emit) async {
    emit(
      state.copyWith(
        status: PostStatus.loading,
      ),
    );

    final response = await _postUsecase.createPost(
      post: CreatePostReq(
        ownerId: event.ownerId,
        content: event.content,
        type: _getPostType(state),
        files: state.files,
      ),
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: PostStatus.failure,
            failure: failure,
          ),
        );
      },
      (right) {
        emit(
          state.copyWith(
            status: PostStatus.success,
          ),
        );
      },
    );
  }

  FutureOr<void> _onPostFetched(event, emit) async {
    emit(
      state.copyWith(
        status: PostStatus.loading,
      ),
    );

    final response = await _postUsecase.fetchPost(
      postId: event.postId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: PostStatus.failure,
            failure: failure,
          ),
        );
      },
      (post) {
        emit(
          state.copyWith(
            status: PostStatus.success,
            post: post,
          ),
        );
      },
    );
  }

  FutureOr<void> _onPostLiked(PostLiked event, emit) async {
    emit(
      state.copyWith(
        post: state.post?.copyWith(
          isLiked: true,
          likesCount: (state.post?.likesCount ?? 0) + 1,
        ),
      ),
    );

    final response = await _postUsecase.likePost(
      likePostReq: LikePostReq(
        postId: event.postId,
        userId: event.postOwnerId,
        senderId: event.currentUserId,
      ),
    );
    // Revert the change if the API call fails
    if (response.isLeft()) {
      emit(
        state.copyWith(
          post: state.post?.copyWith(
            isLiked: false,
            likesCount: (state.post?.likesCount ?? 0) - 1,
          ),
        ),
      );
    }
  }

  FutureOr<void> _onPostUnliked(PostUnliked event, emit) async {
    emit(
      state.copyWith(
        post: state.post?.copyWith(
          isLiked: false,
          likesCount: (state.post?.likesCount ?? 0) - 1,
        ),
      ),
    );

    final response = await _postUsecase.unlikePost(
      postId: event.postId,
    );
    // Revert the change if the API call fails
    if (response.isLeft()) {
      emit(
        state.copyWith(
          post: state.post?.copyWith(
            isLiked: true,
            likesCount: (state.post?.likesCount ?? 0) + 1,
          ),
        ),
      );
    }
  }

  FutureOr<void> _onPostCommented(PostCommented event, emit) async {
    final response = await _postUsecase.commentPost(
      commentReq: event.comment,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: PostStatus.failure,
            failure: failure,
          ),
        );
      },
      (comment) {
        emit(
          state.copyWith(
            post: state.post?.copyWith(
              commentsCount: (state.post?.commentsCount ?? 0) + 1,
            ),
            comments: [comment, ...state.comments],
          ),
        );
      },
    );
  }

  FutureOr<void> _onPostCommentsFetched(PostCommentsFetched event, emit) async {
    emit(
      state.copyWith(
        status: PostStatus.loading,
      ),
    );

    final response = await _postUsecase.fetchPostComments(
      postId: event.postId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: PostStatus.failure,
            failure: failure,
          ),
        );
      },
      (comments) {
        emit(
          state.copyWith(
            status: PostStatus.success,
            comments: comments,
          ),
        );
      },
    );
  }

  FutureOr<void> _onPostCommentLiked(PostCommentLiked event, emit) async {
    // TODO: work on notifing the user that the comment has been liked ( notification )
    final response = await _postUsecase.likeComment(
      commentId: event.commentId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: PostStatus.failure,
            failure: failure,
          ),
        );
      },
      (comment) {
        final comments = List.of(state.comments);
        final commentId = event.commentId;

        final index =
            comments.indexWhere((comment) => comment?.commentId == commentId);

        if (index >= 0 && index < comments.length) {
          final comment = comments[index];

          final updatedComment = comment?.copyWith(
            likesCount: comment.isLiked
                ? comment.likesCount - 1
                : comment.likesCount + 1,
            isLiked: !comment.isLiked,
          );
          comments[index] = updatedComment;
        }

        emit(
          state.copyWith(
            status: PostStatus.success,
            comments: comments,
          ),
        );
      },
    );
  }

  FutureOr<void> _onPostCommentUnliked(PostCommentUnliked event, emit) async {
    final response = await _postUsecase.unlikeComment(
      commentId: event.commentId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: PostStatus.failure,
            failure: failure,
          ),
        );
      },
      (comment) {
        final comments = List.of(state.comments);
        final commentId = event.commentId;
        final index =
            comments.indexWhere((comment) => comment?.commentId == commentId);

        if (index >= 0 && index < comments.length) {
          final comment = comments[index];

          final updatedComment = comment?.copyWith(
            likesCount: comment.isLiked
                ? comment.likesCount - 1
                : comment.likesCount + 1,
            isLiked: !comment.isLiked,
          );
          comments[index] = updatedComment;
        }

        emit(
          state.copyWith(
            status: PostStatus.success,
            comments: comments,
          ),
        );
      },
    );
  }

  FutureOr<void> _onFeedParentCommentIdChanged(
      FeedParentCommentIdChanged event, emit) async {
    emit(
      state.copyWith(
        parentCommentId: event.parentCommentId,
      ),
    );
  }

  PostType _getPostType(PostState state) {
    if (state.files.isNotEmpty) {
      return state.postType;
    }

    final url = UrlUtil.extractLink(state.text);

    final isUrlValid = UrlUtil.isValidUrl(url);

    if (isUrlValid) {
      return PostType.link;
    }
    return PostType.text;
  }
}
