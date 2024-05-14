import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/practice_area_constants.dart';
import 'package:legal_referral_ui/src/core/constants/state_constant.dart';

class AddReferral extends StatefulWidget {
  const AddReferral({super.key});

  @override
  State<AddReferral> createState() => _AddReferralState();
}

class _AddReferralState extends State<AddReferral> {
  final _caseDescription = TextEditingController();
  final _title = TextEditingController();
  final _practiceArea = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 4.h,
        shadowColor: Colors.grey.shade200,
        title: Text(
          'Add New Referral',
          style: textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              color: LegalReferralColors.backgroundWhite255,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _title,
                    hintText: 'Enter the Title for Referral',
                    labelText: 'Title',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomAutoComplete(
                    options: PracticeAreaConstants.allPracticeAreas,
                    hintText: 'Select practice area',
                    labelText: 'Preferred Practice area',
                    textEditingController: _practiceArea,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomAutoComplete(
                    options: StateConstants.statesList,
                    hintText: 'Select practice location',
                    labelText: 'Preferred Practice location',
                    textEditingController: _practiceArea,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    controller: _caseDescription,
                    hintText: 'Case Description',
                    labelText: 'Enter case details',
                    maxLines: 5,
                    minLines: 5,
                  ),
                  CheckboxListTile(
                    value: true,
                    checkColor: LegalReferralColors.textBlack,
                    fillColor: MaterialStateProperty.all(Colors.transparent),
                    onChanged: (value) {},
                    title: Text(
                      'Refer connections only',
                      style: textTheme.bodyLarge,
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  ),
                  CustomOutlinedButton(
                    text: 'Select Connection',
                    onPressed: () => _showReferralSheet(context),
                    textColor: LegalReferralColors.textBlue100,
                    borderColor: LegalReferralColors.borderBlue100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showReferralSheet(context) {
  final textTheme = Theme.of(context).textTheme;
  CustomBottomSheet.show(
    context: context,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20.h),
        Row(
          children: [
            Text(
              'Select Attorneys to Send Referral',
              style: textTheme.headlineSmall,
            ),
            const Spacer(),
            CustomIconButton(
              onTap: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close_rounded),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        const Divider(
          height: 1,
        ),
        CheckboxListTile(
          value: true,
          checkColor: LegalReferralColors.textBlack,
          fillColor: MaterialStateProperty.all(Colors.transparent),
          onChanged: (value) {},
          title: Text(
            'Select all',
            style: textTheme.bodyLarge,
          ),
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        ),
        const Divider(),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 30,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: const CircularCheckBox(),
                      // CustomAvatar(
                      //   imageUrl: null,
                      //   radius: 24.r,
                      // ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'Name',
                      style: textTheme.titleMedium,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomElevatedButton(
          text: 'Post referral',
          onTap: () {},
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    ),
  );
}

class CircularCheckBox extends StatelessWidget {
  const CircularCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: LegalReferralColors.containerBlue79,
      radius: 24.r,
      child: const Icon(
        Icons.done_rounded,
        color: Colors.white,
      ),
    );
  }
}
