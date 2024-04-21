import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    required this.items,
    required this.onChange,
    required this.hintText,
    required this.labelText,
    this.selectedValue,
    this.showSelectedValue = true,
    super.key,
    this.validator,
  });
  final List<String> items;
  final Function(String?) onChange;
  final String hintText;
  final String labelText;
  final bool showSelectedValue;
  final String? Function(String?)? validator;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField2<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: LegalReferralColors.containerWhite500,
            errorStyle: const TextStyle(color: LegalReferralColors.error),
            // hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: LegalReferralColors.textgrey300,
                ),
            // labelText: labelText,
            // labelStyle: Theme.of(context).textTheme.bodyLarge,
            // floatingLabelBehavior: FloatingLabelBehavior.never,
            // label: Text(
            //   labelText,
            //   style: Theme.of(context).textTheme.bodyLarge,
            // ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: LegalReferralColors.borderBlue300,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: LegalReferralColors.borderBlue300,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: LegalReferralColors.borderBlue300,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: LegalReferralColors.borderBlue300,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          value: selectedValue,
          hint: Text(
            hintText,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: LegalReferralColors.textgrey300,
                ),
          ),
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  alignment: Alignment.centerLeft,
                  value: item,
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          validator: validator,
          onChanged: onChange,
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down_rounded),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
            ),
            maxHeight: 250,
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 8.h,
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}
