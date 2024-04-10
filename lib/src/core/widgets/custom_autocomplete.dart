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
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.h,
                color: LegalReferralColors.textBlack,
              ),
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
                  controller: controller,
                  focusNode: focusNode,
                  validator: validator,
                  onFieldSubmitted: (String value) {
                    onFieldSubmitted();
                    textEditingController.text = value;
                  },
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
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
                  return const Iterable<String>.empty();
                }
                final startWithQuery = <String>[];
                final containsQuery = <String>[];

                for (final country in CountriesConstant.countries) {
                  final countryLowerCase = country.toLowerCase();
                  if (countryLowerCase.startsWith(searchQuery)) {
                    startWithQuery.add(country);
                  } else if (countryLowerCase.contains(searchQuery)) {
                    containsQuery.add(country);
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
                      width: constraints.maxWidth,
                      child: ListView.builder(
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(options.elementAt(index)),
                            onTap: () {
                              onSelected(options.elementAt(index));
                            },
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
