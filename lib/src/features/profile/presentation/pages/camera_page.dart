import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_util.dart';

class CameraPageArgs {
  const CameraPageArgs({
    required this.cropStyle,
    required this.onImageCaptured,
  });

  final CropStyle cropStyle;
  final Function(String?) onImageCaptured;
}

class CameraPage extends StatelessWidget {
  const CameraPage({
    required this.args,
    super.key,
  });
  static const String name = 'CameraPage';
  final CameraPageArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      body: CameraAwesomeBuilder.awesome(
        progressIndicator: const CustomLoadingIndicator(),
        saveConfig: SaveConfig.photo(
          exifPreferences: ExifPreferences(saveGPSLocation: true),
        ),
        sensorConfig: SensorConfig.single(
          sensor: Sensor.position(SensorPosition.back),
          flashMode: FlashMode.auto,
        ),
        enablePhysicalButton: true,
        previewFit: CameraPreviewFit.contain,
        onMediaTap: (mediaCapture) {
          mediaCapture.captureRequest.when(
            single: (single) async {
              final filePath = single.file?.path;
              AppLogger.info('camera photo filePath: $filePath');
              if (filePath != null) {
                final croppedImage = await ImageUtil.cropImage(
                  filePath: filePath,
                  cropStyle: args.cropStyle,
                );
                if (croppedImage != null) {
                  args.onImageCaptured.call(croppedImage.path);
                  if (context.mounted) {
                    context.pop();
                  }
                }
              }
            },
          );
        },
        availableFilters: awesomePresetFiltersList,
      ),
    );
  }
}
