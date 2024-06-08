import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/file_size_calulate.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:path/path.dart' as path;

class DocPost extends StatelessWidget {
  const DocPost({
    required this.file,
    super.key,
  });

  final File file;

  @override
  Widget build(BuildContext context) {
    final fileName = path.basename(file.path);
    final fileSize = formatBytes(file.lengthSync(), 2);
    return Card(
      elevation: 2,
      child: ListTile(
        horizontalTitleGap: 10,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        minVerticalPadding: 4,
        minLeadingWidth: 10,
        visualDensity: VisualDensity.standard,
        title: Text(
          fileName,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Text(
          fileSize,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.grey),
        ),
        leading: SvgPicture.asset(
          IconStringConstants.pdfIcon,
        ),
        trailing: SvgButton(
          width: 20,
          height: 20,
          imagePath: IconStringConstants.cross2,
          onPressed: () {},
        ),
      ),
    );
  }
}
