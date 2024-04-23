import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    required this.imageUrl,
    super.key,
    this.radius = 20.0,
  });
  final String? imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final image = imageUrl != null
        ? NetworkImage(imageUrl!)
        : const AssetImage(
            ImageStringsConstants.avatarPlaceholder,
          );
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey,
      child: ClipOval(
        child: FadeInImage(
          placeholder: const AssetImage(
            ImageStringsConstants.avatarPlaceholder,
          ),
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: radius * 2,
          height: radius * 2,
          fadeInDuration: const Duration(
            milliseconds: 300,
          ),
          fadeOutDuration: const Duration(
            milliseconds: 100,
          ),
        ),
      ),
    );
  }
}
