import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class CustomAutoComplete extends StatelessWidget {
  const CustomAutoComplete({
    required this.options,
    required this.hintText,
    required this.labelText,
    required this.textEditingController,
    super.key,
    this.validator,
  });

  final String labelText;
  final String hintText;
  final List<String> options;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labelText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 8.h),
            Autocomplete<String>(
              fieldViewBuilder: (
                BuildContext context,
                TextEditingController controller,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted,
              ) {
                return TextFormField(
                  cursorColor: LegalReferralColors.borderBlue300,
                  controller: controller,
                  focusNode: focusNode,
                  validator: validator,
                  onFieldSubmitted: (String value) {
                    onFieldSubmitted();
                    textEditingController.text = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.h,
                      color: LegalReferralColors.textgrey300,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: LegalReferralColors.borderBlue300,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: LegalReferralColors.borderBlue300,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: LegalReferralColors.borderBlue300,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: LegalReferralColors.borderBlue300,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: LegalReferralColors.borderBlue300,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    filled: true,
                    fillColor: LegalReferralColors.containerWhite500,
                  ),
                );
              },
              optionsBuilder: (TextEditingValue textEditingValue) async {
                final searchQuery = textEditingValue.text.toLowerCase();
                if (searchQuery == '') {
                  return options;
                }
                final startWithQuery = <String>[];
                final containsQuery = <String>[];

                for (final option in options) {
                  final optionLowerCase = option.toLowerCase();
                  if (optionLowerCase.startsWith(searchQuery)) {
                    startWithQuery.add(option);
                  } else if (optionLowerCase.contains(searchQuery)) {
                    containsQuery.add(option);
                  }
                }
                return [...startWithQuery, ...containsQuery];
              },
              onSelected: (String selection) {
                textEditingController.text = selection;
              },
              optionsViewBuilder: (
                BuildContext context,
                AutocompleteOnSelected<String> onSelected,
                Iterable<String> options,
              ) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4,
                    child: SizedBox(
                      height: 250,
                      width: constraints.maxWidth,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(options.elementAt(index)),
                            onTap: () {
                              onSelected(options.elementAt(index));
                            },
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
