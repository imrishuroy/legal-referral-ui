import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc()
      : super(
          const PostState(),
        ) {
    on<AddedFile>((event, emit) async {
      final result = await FilePickerUtil.pickFile(
        allowedExtensions: [
          FileExtension.pdf,
          FileExtension.jpg,
          FileExtension.jpeg,
          FileExtension.png,
        ],
      );
      if (result.isNotEmpty) {
        if (result.first!.path.endsWith('.pdf')) {
          emit(
            state.copyWith(
              documentType: DocumentType.document,
              filePath: result.first!.path,
            ),
          );
        } else if (result.length == 1) {
          emit(
            state.copyWith(
              documentType: DocumentType.image,
              filePath: result.first!.path,
            ),
          );
        }else{
           emit(
            state.copyWith(
              documentType: DocumentType.image,
              filePath: result.first!.path,
            ),
          );
        }
      }
    });
  }
}
