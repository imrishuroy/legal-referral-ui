import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';

class AddPricePage extends StatelessWidget {
  AddPricePage({super.key});
  final _desiredPrice = TextEditingController();

  final int _selectedOption = 0;

  final List<String> paymentOptions = [
    'Per hour',
    'Per hearing',
    'Contingency',
    'Hybrid',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.h,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.08),
        title: Text(
          'Pricing',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.h,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            margin: EdgeInsets.symmetric(vertical: 16.h),
            color: LegalReferralColors.containerWhite500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Text(
                  'How do you charge for your service?',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                Column(
                  children: paymentOptions.map((option) {
                    final index = paymentOptions.indexOf(option);
                    return RadioListTile<int>(
                      contentPadding: EdgeInsets.zero,
                      fillColor: MaterialStateProperty.all(
                        LegalReferralColors.buttonPrimary,
                      ),
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: LegalReferralColors.buttonPrimary,
                      title: Text(
                        option,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      value: index,
                      groupValue: _selectedOption,
                      onChanged: (value) {},
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _desiredPrice,
                  hintText: r'$ 100',
                  labelText: 'Desired price',
                ),
                SizedBox(height: 28.h),
                CustomElevatedButton(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => ));
                  },
                  text: 'Save',
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
