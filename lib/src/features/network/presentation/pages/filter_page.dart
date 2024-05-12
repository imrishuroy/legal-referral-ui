import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late List filterTypeList = [];
  bool isFilteredValue = false;
  int selectedIndex = 0;
  late List<Map<String, dynamic>> data;
  @override
  void initState() {
    data = filterData;
    filterTypeList = data[0]['filter_type'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.grey[100],
        title: const Text('Filter by'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 8),
        color: LegalReferralColors.containerWhite500,
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: List<Widget>.generate(
                        data.length,
                        (index) => Column(
                          children: [
                            SizedBox(
                              height: 60,
                              child: ListTile(
                                contentPadding: const EdgeInsets.only(left: 8),
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                selectedColor: Colors.transparent,
                                visualDensity: VisualDensity.compact,
                                title: Row(
                                  children: [
                                    Text(
                                      data[index]['filter_by'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: selectedIndex == index
                                                ? LegalReferralColors
                                                    .textBlue100
                                                : LegalReferralColors.textBlack,
                                          ),
                                    ),
                                    if (isFilteredValue) ...[
                                      SizedBox(width: 4.w),
                                      const FilterLabel(
                                        foregroundColor: LegalReferralColors
                                            .containerWhite500,
                                        backgroundColor: LegalReferralColors
                                            .containerBlue100,
                                        appliedFilter: '4',
                                      ),
                                    ],
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    filterTypeList = data[index]['filter_type'];
                                  });
                                },
                              ),
                            ),
                            const Divider(
                              height: 4,
                              indent: 0,
                              endIndent: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    width: 1,
                  ),
                  Flexible(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Column(
                        children: List<Widget>.generate(
                          filterTypeList.length,
                          (index) => Column(
                            children: [
                              SizedBox(
                                height: 60,
                                child: CheckboxListTile(
                                  contentPadding:
                                      const EdgeInsets.only(right: 4),
                                  title: Text(
                                    filterTypeList[index],
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  value: isFilteredValue,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isFilteredValue = value!;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                ),
                              ),
                              const Divider(
                                height: 4,
                                endIndent: 0,
                                indent: 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 2,
                    child: Center(
                      child: CustomTextButton(
                        fontSize: 16.h,
                        fontWeight: FontWeight.w600,
                        textColor: LegalReferralColors.textGrey500,
                        text: 'Clear All',
                        onPressed: () {
                          setState(() {
                            isFilteredValue
                                ? isFilteredValue = false
                                : isFilteredValue = true;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: CustomElevatedButton(
                      text: 'Apply Filters',
                      onTap: () {},
                      borderRadius: 88,
                      height: 46,
                      child: isFilteredValue
                          ? const FilterLabel(
                              backgroundColor:
                                  LegalReferralColors.containerWhite500,
                              appliedFilter: '2',
                              foregroundColor:
                                  LegalReferralColors.containerBlue100,
                            )
                          : null,
                    ),
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

class FilterLabel extends StatelessWidget {
  const FilterLabel({
    super.key,
    this.appliedFilter,
    this.backgroundColor,
    this.foregroundColor,
  });
  final String? appliedFilter;
  final Color? backgroundColor;
  final Color? foregroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: backgroundColor,
      ),
      child: Text(
        textAlign: TextAlign.center,
        '$appliedFilter',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: foregroundColor,
            ),
      ),
    );
  }
}

List<Map<String, dynamic>> filterData = [
  {
    'filter_by': 'Practice Area',
    'filter_type': [
      'Real Estate Law',
      'Tax Law',
      'Trusts and Estates Law',
      'Healthcare Law',
      'Biotechnology Law',
      'International Law',
      'Intellectual Property Law',
      'Entertainment Law',
      'Agricultural Law',
    ],
  },
  {
    'filter_by': 'Practice Location',
    'filter_type': [
      'Alaska',
      'Arizona',
      'Arkansas',
      'California',
      'Colorado',
      'Connecticut',
      'Delaware',
      'Florida',
      'Georgia',
      'Hawaii',
      'Idaho',
      'Illinois',
      'Indiana',
      'Iowa',
      'Kansas',
    ],
  },
  {
    'filter_by': 'Connection Level',
    'filter_type': [
      'Low',
      'Medium',
      'High',
    ],
  },
  {
    'filter_by': 'Price',
    'filter_type': [
      r'Under $50',
      r'$50 - $100',
      r'$100 - $200',
      r'Over $200',
    ],
  },
  {
    'filter_by': 'Rating',
    'filter_type': [
      '1 Star',
      '2 Stars',
      '3 Stars',
      '4 Stars',
      '5 Stars',
    ],
  },
];
