import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HorizontalIconText extends StatelessWidget {
  const HorizontalIconText({
    required this.icon,
    required this.title,
    super.key,
  });
  final String? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SvgPicture.asset(
          icon ?? '',
        ),
        const SizedBox(width: 10),
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
