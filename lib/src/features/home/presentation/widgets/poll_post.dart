import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class PollPost extends StatelessWidget {
  const PollPost({super.key});

  @override
  Widget build(BuildContext context) {
    final days = DateTime(
      poll['end_date'].year,
      poll['end_date'].month,
      poll['end_date'].day,
    )
        .difference(
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ),
        )
        .inDays;

    final bool hasVoted = poll['hasVoted'] ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Wrap(
            children: [
              Text(
                'Hey folks, can you please participate?',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: FlutterPolls(
            leadingVotedProgessColor: const Color.fromRGBO(176, 210, 242, 1),
            votedProgressColor: const Color.fromRGBO(193, 189, 193, 1),
            votedBackgroundColor: const Color.fromRGBO(234, 229, 235, 1),
            heightBetweenOptions: 20,
            heightBetweenTitleAndOptions: 30,
            votedPollOptionsRadius: const Radius.circular(50),
            pollOptionsBorderRadius: BorderRadius.circular(50),
            pollId: poll['id'].toString(),
            hasVoted: hasVoted,
            userVotedOptionId: poll['userVotedOptionId']?.toString(),
            onVoted: (PollOption pollOption, int newTotalVotes) async {
              /// Simulate HTTP request
              await Future.delayed(const Duration(seconds: 1));

              /// If HTTP status is success, return true else false
              return true;
            },
            pollEnded: days < 0,
            pollTitle: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                poll['question'],
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: LegalReferralColors.textBlue69),
              ),
            ),
            pollOptions: List<PollOption>.from(
              poll['options'].map(
                (option) => PollOption(
                  id: option['id'].toString(),
                  title: Text(
                    option['title'],
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: LegalReferralColors.textBlue69),
                  ),
                  votes: option['votes'],
                ),
              ),
            ),
            votedPercentageTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            metaWidget: Row(
              children: [
                const SizedBox(width: 6),
                const Text('•'),
                const SizedBox(width: 6),
                Text(
                  days < 0 ? 'ended' : '$days days left to vote',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

final poll = <String, dynamic>{
  'id': 1,
  'question':
      'Is Flutter the best framework for building cross-platform applications?',
  'end_date': DateTime(2024, 06, 21),
  'options': [
    {
      'id': 1,
      'title': 'Absolutely',
      'votes': 100,
    },
    {
      'id': 2,
      'title': 'Maybe',
      'votes': 10,
    },
    {
      'id': 3,
      'title': 'Meh!',
      'votes': 20,
    },
  ],
};
