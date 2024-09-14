import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/features/saved_posts/domain/domain.dart';

part 'saved_posts_event.dart';
part 'saved_posts_state.dart';

@injectable
class SavedPostsBloc extends Bloc<SavedPostsEvent, SavedPostsState> {
  SavedPostsBloc({
    required SavedPostsUsecase savedPostsUsecase,
  })  : _savedPostsUsecase = savedPostsUsecase,
        super(SavedPostsState.initial()) {
    on<PostSaved>(_onPostSaved);
    on<PostUnsaved>(_onPostUnsaved);
    on<SavedPostsFetched>(_onSavedPostsFetched);
  }

  final SavedPostsUsecase _savedPostsUsecase;

  Future<void> _onPostSaved(
    PostSaved event,
    Emitter<SavedPostsState> emit,
  ) async {
    final result = await _savedPostsUsecase.savePost(
      userId: event.userId,
      postId: event.postId,
    );
    result.fold((failure) {
      emit(
        state.copyWith(
          status: SavedPostStatus.failure,
          failure: failure,
        ),
      );
    }, (_) {
      emit(
        state.copyWith(
          status: SavedPostStatus.success,
        ),
      );
    });
  }

  Future<void> _onPostUnsaved(
    PostUnsaved event,
    Emitter<SavedPostsState> emit,
  ) async {
    final result = await _savedPostsUsecase.unsavePost(
      savedPostId: event.savedPostId,
    );
    result.fold((failure) {
      emit(
        state.copyWith(
          status: SavedPostStatus.failure,
          failure: failure,
        ),
      );
    }, (_) {
      emit(
        state.copyWith(
          actionsStatus: SavedPostActionsStatus.success,
          savedPosts: List.from(state.savedPosts)
            ..removeWhere(
              (element) => element.savedPostId == event.savedPostId,
            ),
        ),
      );
    });
  }

  Future<void> _onSavedPostsFetched(
    SavedPostsFetched event,
    Emitter<SavedPostsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: SavedPostStatus.loading,
      ),
    );
    final result = await _savedPostsUsecase.fetchSavedPosts(
      userId: event.userId,
    );
    result.fold((failure) {
      emit(
        state.copyWith(
          status: SavedPostStatus.failure,
          failure: failure,
        ),
      );
    }, (savedPosts) {
      emit(
        state.copyWith(
          status: SavedPostStatus.success,
          savedPosts: savedPosts,
        ),
      );
    });
  }
}
