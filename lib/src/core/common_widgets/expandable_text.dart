import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({
    required this.text,
    super.key,
    this.style,
    this.padding,
  });
  final String text;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _expanded = false;
  bool _isOverflowing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkOverflow());
  }

  void _checkOverflow() {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: context.size!.width);

    if (textPainter.didExceedMaxLines) {
      setState(() {
        _isOverflowing = true;
      });
    }
  }

  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
            child: Text(
              widget.text,
              style: widget.style ?? theme.bodyLarge,
              maxLines: _expanded ? null : 2,
              overflow:
                  _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ),
          if (_isOverflowing)
            GestureDetector(
              onTap: _toggleExpanded,
              child: Text(
                _expanded ? 'See less' : 'Read more...',
                style: theme.bodyLarge
                    ?.copyWith(color: LegalReferralColors.textBlue100),
              ),
            ),
        ],
      ),
    );
  }
}
