import 'package:flutter/material.dart';

class VerticalTile extends StatelessWidget {
  const VerticalTile({
    required this.leading,
    required this.trailing,
    required this.onPressed,
    super.key,
  });
  final Widget leading;
  final Widget trailing;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onPressed,
      child: Column(
        children: [leading, trailing],
      ),
    );
  }
}

class HorizontalTile extends StatelessWidget {
  const HorizontalTile({
    required this.leading,
    required this.trailing,
    required this.spacing,
    required this.onPressed,
    super.key,
  });
  final Widget leading;
  final Widget trailing;
  final double? spacing;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onPressed,
      child: Row(
        children: [
          leading,
          SizedBox(
            width: spacing,
          ),
          trailing,
        ],
      ),
    );
  }
}
