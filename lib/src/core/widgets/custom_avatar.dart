import 'package:flutter/material.dart';

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
            'assets/images/placeholder_image.png',
          );
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey,
      child: ClipOval(
        child: FadeInImage(
          placeholder: const AssetImage(
            'assets/images/placeholder_image.png',
          ),
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: radius * 2,
          height: radius * 2,
          fadeInDuration: const Duration(
            milliseconds: 200,
          ),
        ),
      ),
    );
  }
}
