import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

part 'advertisement_event.dart';
part 'advertisement_state.dart';

@injectable
class AdvertisementBloc extends Bloc<AdvertisementEvent, AdvertisementState> {
  AdvertisementBloc() : super(AdvertisementState.initial()) {
    on<AdSelected>((event, emit) async {
      emit(state.copyWith(advertiseType: AdvertiseType.loading));
      if (event.advertiseType == AdvertiseType.image) {
        final multipleImage = await ImageUtil.pickMultipleImages();
        emit(
          state.copyWith(
            advertiseType: AdvertiseType.success,
            fileType: multipleImage,
          ),
        );
      } else {
        final pickedVideo = <File>[];
        final file = await FilePickerUtil.pickVideo();
        pickedVideo.add(file!);

        emit(
          state.copyWith(
            advertiseType: AdvertiseType.success,
            fileType: pickedVideo,
          ),
        );
      }
    });

    on<FileRemoved>((event, emit) {
      emit(state.copyWith(fileType: [], advertiseType: AdvertiseType.success));
    });
  }
}
