import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

enum MediaLocation { gallery, camera }

class ImageUtil {
  ImageUtil._privateConstructor();

  static final ImageUtil _instance = ImageUtil._privateConstructor();

  static ImageUtil get instance {
    return _instance;
  }

  static Future<List<File>> pickMultipleImages() async {
    try {
      final picker = ImagePicker();
      final images = await picker.pickMultiImage();
      return images.map((image) => File(image.path)).toList();
    } catch (error) {
      AppLogger.info('Error: $error');
      return [];
    }
  }

  static Future<MediaLocation?> showMediaOptionSheet(
    BuildContext context,
  ) async {
    final option = await showModalBottomSheet<MediaLocation>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 8.h,
            ),
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: SvgPicture.asset(
                    IconStringConstants.file,
                    width: 24.w,
                    height: 24.h,
                  ),
                  title: const Text('Gallery'),
                  onTap: () => context.pop(MediaLocation.gallery),
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    IconStringConstants.camera,
                    width: 24.w,
                    height: 24.h,
                  ),
                  title: const Text('Camera'),
                  onTap: () => context.pop(MediaLocation.camera),
                ),
              ],
            ),
          ),
        );
      },
    );

    return option;
  }

  static Future<File?> pickImage({
    required CropStyle cropStyle,
  }) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        final croppedImage = await ImageUtil.cropImage(
          filePath: pickedFile.path,
          cropStyle: cropStyle,
        );

        return croppedImage;
      }

      return null;
    } catch (error) {
      AppLogger.error('Error picking image: $error');
    }
    return null;
  }

  static Future<File?> cropImage({
    required String filePath,
    required CropStyle cropStyle,
  }) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: filePath,
      uiSettings: [
        AndroidUiSettings(
          cropStyle: cropStyle,
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.grey.shade800,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          cropStyle: cropStyle,
          title: 'Crop Image',
        ),
      ],
      compressQuality: 70,
    );
    return File(croppedFile?.path ?? filePath);
  }

  static Future<String?> uploadFile({
    required XFile file,
    required String filename,
    required String container,
    required String fileType,
  }) async {
    try {
      String? downloadUrl;

      // Create a Reference to the file
      final ref = FirebaseStorage.instance
          .ref()
          .child(container)
          .child('/$filename.$fileType');

      AppLogger.info('file path: ${file.path}');

      final metadata = SettableMetadata(
        contentType: fileType == 'pdf' ? 'application/pdf' : 'image/jpeg',
        customMetadata: {'picked-file-path': file.path},
      );

      final uploadTask = await ref.putFile(File(file.path), metadata);

      if (uploadTask.state == TaskState.success) {
        downloadUrl = await uploadTask.ref.getDownloadURL();
      }
      return downloadUrl;
    } catch (error) {
      AppLogger.error('Error uploading file: $error');
      return null;
    }
  }

  static String getFileName(File? file) {
    final path = file?.path;
    if (path != null) {
      final splitPath = path.split('/');
      return splitPath.isNotEmpty ? splitPath.last : 'No file uploaded';
    } else {
      return 'No file uploaded';
    }
  }
}
