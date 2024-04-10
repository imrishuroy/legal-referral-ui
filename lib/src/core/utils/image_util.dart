import 'dart:io' as io;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

class ImageUtil {
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

      final uploadTask = await ref.putFile(io.File(file.path), metadata);

      if (uploadTask.state == TaskState.success) {
        downloadUrl = await uploadTask.ref.getDownloadURL();
      }
      return downloadUrl;
    } catch (error) {
      AppLogger.error('Error uploading file: $error');
      return null;
    }
  }
}
