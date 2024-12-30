import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';

class ActivityCommentShimmer extends StatelessWidget {
  const ActivityCommentShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: ListTile(
        contentPadding: const EdgeInsets.all(4),
        dense: true,
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 14,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 150,
                    height: 14,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            width: double.infinity,
            height: 14,
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
