import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class SupportHelpPage extends StatelessWidget {
  SupportHelpPage({required this.title, super.key});

  final String title;
  final List<String> supportList = [
    'Frequently Asked Question',
    'Ask Us',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(title, style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        color: LegalReferralColors.backgroundWhite255,
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            title: Text(
              supportList[index],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _FrequentlyAskedQuestionPage(
                        title: supportList[index],
                      ),
                    ),
                  );
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          _AskUsPage(title: supportList[index]),
                    ),
                  );
                  break;
              }
            },
          ),
          separatorBuilder: (context, index) => Divider(
            height: 8.h,
          ),
          itemCount: supportList.length,
        ),
      ),
    );
  }
}

class _FrequentlyAskedQuestionPage extends StatefulWidget {
  const _FrequentlyAskedQuestionPage({required this.title,});

  final String title;
  @override
  State<_FrequentlyAskedQuestionPage> createState() =>
      _FrequentlyAskedQuestionPageState();
}

class _FrequentlyAskedQuestionPageState
    extends State<_FrequentlyAskedQuestionPage> {
  final List<_Item> _items = [
    _Item(
      question: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      solution: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
          ' Suspendisse ultrices augue mauris, eget'
          ' elementum massa elementum sed. Fusce '
          'gravida magna sed nunc condimentum, '
          'eget rhoncus nunc mattis. Proin eget'
          ' iaculis ipsum. Sed a lorem turpis. Donec sed'
          ' mi ut sem rutrum condimentum. Sed sollicitudin'
          ' tristique tortor at ultricies. In mattis luctus'
          ' dui et vehicula. Etiam ac malesuada ante, '
          'vel feugiat dui. Nam semper ullamcorper felis,'
          ' ac lacinia nisi pharetra et. Nulla porttitor'
          ' quam felis, eu tincidunt nisl blandit in.',
    ),
    _Item(
      question: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      solution: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
          ' Suspendisse ultrices augue mauris, eget'
          ' elementum massa elementum sed. Fusce '
          'gravida magna sed nunc condimentum, '
          'eget rhoncus nunc mattis. Proin eget'
          ' iaculis ipsum. Sed a lorem turpis. Donec sed'
          ' mi ut sem rutrum condimentum. Sed sollicitudin'
          ' tristique tortor at ultricies. In mattis luctus'
          ' dui et vehicula. Etiam ac malesuada ante, '
          'vel feugiat dui. Nam semper ullamcorper felis,'
          ' ac lacinia nisi pharetra et. Nulla porttitor'
          ' quam felis, eu tincidunt nisl blandit in.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return ExpansionTile(
            iconColor: LegalReferralColors.borderGrey400,
            collapsedIconColor: LegalReferralColors.borderGrey400,
            tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
            shape: const Border(),
            collapsedBackgroundColor: LegalReferralColors.backgroundWhite255,
            backgroundColor: LegalReferralColors.backgroundWhite255,
            title: Text(
              item.question,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Text(
                  item.solution,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: LegalReferralColors.textGrey500),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const Divider(
          height: 0,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
      ),
    );
  }
}

class _Item {
  _Item({required this.question, required this.solution});
  final String question;
  final String solution;
}

class _AskUsPage extends StatelessWidget {
  _AskUsPage({required this.title});

  final String title;
  final TextEditingController _topicCtrl = TextEditingController();
  final TextEditingController _helpCtlr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(title, style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        color: LegalReferralColors.backgroundWhite255,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(height: 8),
            CustomTextField(
              keyboardType: TextInputType.multiline,
              controller: _topicCtrl,
              hintText: 'Place holder',
              labelText: 'Topic',
              maxLines: 5,
              minLines: 5,
            ),
            const Gap(
              height: 16,
            ),
            CustomTextField(
              controller: _helpCtlr,
              hintText: 'Explain your experience',
              labelText: 'Description',
            ),
            const Gap(
              height: 16,
            ),
            CustomElevatedButton(
              text: 'Submit',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
