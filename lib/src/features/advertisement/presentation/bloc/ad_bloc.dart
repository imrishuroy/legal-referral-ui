import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/advertisement/data/data.dart';
import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';

part 'ad_event.dart';
part 'ad_state.dart';

@injectable
class AdBloc extends Bloc<AdEvent, AdState> {
  AdBloc({
    required AdUsecase adUsecase,
  })  : _adUsecase = adUsecase,
        super(AdState.initial()) {
    on<AdTypeChanged>(_onAdTypeChanged);
    on<AdFilePicked>(_onAdFilePicked);
    on<PaymentCycleChanged>(_onPaymentCycleChanged);
    on<AdStartDateChanged>(_onAdStartDateChanged);
    on<AdEndDateChanged>(_onAdEndDateChanged);
    on<FileRemoved>(_onFileRemoved);
    on<AdCreated>(_onAdCreated);
    on<PlayingAdsFetched>(_onPlayingAdsFetched);
    on<ExpiredAdsFetched>(_onExpiredAdsFetched);
    on<AdPeriodExtended>(_onAdPeriodExtended);
  }

  final AdUsecase _adUsecase;

  Future<void> _onAdTypeChanged(
    AdTypeChanged event,
    Emitter<AdState> emit,
  ) async {
    emit(
      state.copyWith(
        adType: event.adType,
      ),
    );
  }

  Future<void> _onAdFilePicked(
    AdFilePicked event,
    Emitter<AdState> emit,
  ) async {
    if (state.adType == AdType.image) {
      final pickedImages = await ImageUtil.pickMultipleImages();
      emit(
        state.copyWith(
          files: pickedImages,
        ),
      );
    } else if (state.adType == AdType.video) {
      final pickedVideo = await FilePickerUtil.pickVideo();
      if (pickedVideo != null) {
        emit(
          state.copyWith(
            files: [pickedVideo],
          ),
        );
      }
    }
  }

  Future<void> _onPaymentCycleChanged(
    PaymentCycleChanged event,
    Emitter<AdState> emit,
  ) async {
    emit(
      state.copyWith(
        paymentCycle: event.paymentCycle,
      ),
    );
  }

  Future<void> _onFileRemoved(
    FileRemoved event,
    Emitter<AdState> emit,
  ) async {
    final index = event.index;
    final files = List<File>.from(state.files);
    if (index < files.length) {
      files.removeAt(index);
      emit(
        state.copyWith(
          files: files,
        ),
      );
    }
  }

  Future<void> _onAdStartDateChanged(
    AdStartDateChanged event,
    Emitter<AdState> emit,
  ) async {
    emit(
      state.copyWith(
        startDate: event.startDate,
      ),
    );
  }

  Future<void> _onAdEndDateChanged(
    AdEndDateChanged event,
    Emitter<AdState> emit,
  ) async {
    emit(
      state.copyWith(
        endDate: event.endDate,
      ),
    );
  }

  Future<void> _onAdCreated(
    AdCreated event,
    Emitter<AdState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AdStatus.loading,
      ),
    );
    final response = await _adUsecase.createAd(ad: event.ad);
    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: AdStatus.failure,
          ),
        );
      },
      (responseMsg) {
        emit(
          state.copyWith(
            status: AdStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onPlayingAdsFetched(
    PlayingAdsFetched event,
    Emitter<AdState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AdStatus.loading,
      ),
    );
    final response = await _adUsecase.fetchPlayingAds();
    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: AdStatus.failure,
          ),
        );
      },
      (ads) {
        emit(
          state.copyWith(
            status: AdStatus.success,
            playingAds: ads,
          ),
        );
      },
    );
  }

  Future<void> _onExpiredAdsFetched(
    ExpiredAdsFetched event,
    Emitter<AdState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AdStatus.loading,
      ),
    );
    final response = await _adUsecase.fetchExpiredAds();
    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: AdStatus.failure,
          ),
        );
      },
      (ads) {
        emit(
          state.copyWith(
            status: AdStatus.success,
            expiredAds: ads,
          ),
        );
      },
    );
  }

  Future<void> _onAdPeriodExtended(
    AdPeriodExtended event,
    Emitter<AdState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AdStatus.loading,
      ),
    );
    final response = await _adUsecase.extendAdPeriod(
      ad: ExtendAdReq(
        adId: event.adId,
        endDate: event.endDate,
      ),
    );
    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: AdStatus.failure,
          ),
        );
      },
      (ad) {
        emit(
          state.copyWith(
            status: AdStatus.success,
          ),
        );
      },
    );
  }
}
