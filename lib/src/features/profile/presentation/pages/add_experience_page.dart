import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/constants/practice_area_constants.dart';
import 'package:legal_referral_ui/src/core/constants/skills_constants.dart';
import 'package:legal_referral_ui/src/core/constants/state_constant.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_dropdown.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_snackbar.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/profile/data/data.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AddExperiencePage extends StatefulWidget {
  const AddExperiencePage({super.key});

  static const String name = 'AddExperiencePage';

  @override
  State<AddExperiencePage> createState() => _AddExperiencePageState();
}

class _AddExperiencePageState extends State<AddExperiencePage> {
  final _formKey = GlobalKey<FormState>();
  final _profileBloc = getIt<ProfileBloc>();
  final _titleController = TextEditingController();
  final _firmNameController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _descriptionController = TextEditingController();
  late String? _practiceArea;
  late String? _practiceLocation;
  late DateTime? _startDate;
  late DateTime? _endDate;
  bool _current = false;
  final List<String> _skills = [];
  late int? firmId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Experience Details',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        listener: (context, state) {
          if (state.experienceStatus == ExperienceStatus.success) {
            context.pop();
          } else if (state.experienceStatus == ExperienceStatus.failure) {
            CustomSnackbar.showToast(
              context,
              title: 'Error',
              description: state.failure!.message,
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return state.experienceStatus == ExperienceStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12.h),
                            CustomTextField(
                              controller: _titleController,
                              hintText: 'Senior attorney',
                              labelText: 'Title',
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Title is required'
                                      : null,
                            ),
                            SizedBox(height: 16.h),
                            CustomDropDown(
                              items: PracticeAreaConstants.allPracticeAreas,
                              onChange: (value) {
                                if (value != null) {
                                  setState(() {
                                    _practiceArea = value;
                                  });
                                }
                              },
                              hintText: 'Practice area',
                              labelText: 'Practice area',
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Practice area is required'
                                      : null,
                            ),
                            SizedBox(height: 16.h),
                            GestureDetector(
                              onTap: () async {
                                final firm = await context
                                    .pushNamed(SearchFirmPage.name) as Firm?;

                                if (firm != null) {
                                  _firmNameController.text = firm.name;
                                  firmId = firm.firmId;
                                }
                              },
                              child: CustomTextField(
                                controller: _firmNameController,
                                hintText: 'Simon LAW firm',
                                labelText: 'Firm',
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? 'Firm name is required'
                                        : null,
                                enabled: false,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            CustomDropDown(
                              items: StateConstants.statesList,
                              onChange: (value) {
                                if (value != null) {
                                  setState(() {
                                    _practiceLocation = value;
                                  });
                                }
                              },
                              hintText: 'Practice location',
                              labelText: 'Practice location',
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Practice location is required'
                                      : null,
                            ),
                            SizedBox(height: 16.h),
                            GestureDetector(
                              onTap: () async {
                                final pickedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary:
                                              LegalReferralColors.buttonPrimary,
                                        ),
                                        dialogBackgroundColor:
                                            LegalReferralColors
                                                .primaryBackground,
                                      ),
                                      child: child!,
                                    );
                                  },
                                );

                                if (pickedDate != null) {
                                  _startDateController.text =
                                      DateTimeUtil.getFormattedDate(
                                    pickedDate,
                                  );

                                  _startDate = pickedDate;
                                }
                              },
                              child: CustomTextField(
                                controller: _startDateController,
                                hintText: 'dd/mm/yyyy',
                                labelText: 'Start date',
                                enabled: false,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? 'Start date is required'
                                        : null,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: _current,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                    side: const BorderSide(),
                                  ),
                                  checkColor: LegalReferralColors.textBlue100,
                                  activeColor: Colors.transparent,
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
                                        _current = value;
                                      });
                                    }
                                  },
                                ),
                                Text(
                                  'Currently work here',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            if (!_current) SizedBox(height: 16.h),
                            if (!_current)
                              GestureDetector(
                                onTap: () async {
                                  final pickedDate = await showDatePicker(
                                    context: context,
                                    firstDate: _startDate != null
                                        ? _startDate!
                                        : DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (context, child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary: LegalReferralColors
                                                .buttonPrimary,
                                          ),
                                          dialogBackgroundColor:
                                              LegalReferralColors
                                                  .primaryBackground,
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );

                                  if (pickedDate != null) {
                                    _endDateController.text =
                                        DateTimeUtil.getFormattedDate(
                                      pickedDate,
                                    );

                                    _endDate = pickedDate;
                                  }
                                },
                                child: CustomTextField(
                                  controller: _endDateController,
                                  hintText: 'dd/mm/yyyy',
                                  labelText: 'End date',
                                  enabled: false,
                                  validator: (value) {
                                    if (!_current &&
                                        (value == null || value.isEmpty)) {
                                      return 'End date is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            SizedBox(height: 16.h),
                            CustomDropDown(
                              items: LawyerSkillsConstants.lawyerSkills,
                              showSelectedValue: false,
                              onChange: (skill) {
                                if (skill != null) {
                                  setState(() {
                                    _skills.add(skill);
                                  });
                                }
                              },
                              hintText: 'Skills',
                              labelText: 'Skills',
                              validator: (_) => _skills.isEmpty
                                  ? 'At least one skill is required'
                                  : null,
                            ),
                            if (_skills.isNotEmpty)
                              Padding(
                                padding: EdgeInsets.only(top: 8.h),
                                child: Wrap(
                                  spacing: 8.w,
                                  runSpacing: 2.h,
                                  children: [
                                    for (final skill in _skills)
                                      Chip(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          side: const BorderSide(
                                            color: LegalReferralColors
                                                .buttonPrimary,
                                          ),
                                        ),
                                        labelPadding: EdgeInsets.only(
                                          left: 8.w,
                                          right: 8.w,
                                        ),
                                        label: Text(skill),
                                        onDeleted: () {
                                          setState(() {
                                            _skills.remove(skill);
                                          });
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _descriptionController,
                              hintText: 'Job summary',
                              maxLines: 3,
                              labelText: 'Description',
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Description is required'
                                      : null,
                            ),
                            SizedBox(height: 16.h),
                            SizedBox(height: 24.h),
                            CustomElevatedButton(
                              onTap: _addExperience,
                              text: 'Save and Proceed',
                            ),
                            SizedBox(height: 12.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  void _addExperience() {
    if (_formKey.currentState!.validate()) {
      if (!_current && _endDate == null) {
        CustomSnackbar.showToast(
          context,
          title: 'Error',
          description: 'End date is required',
          type: ToastificationType.error,
        );
        return;
      }

      if (firmId == null) {
        CustomSnackbar.showToast(
          context,
          title: 'Error',
          description: 'Firm is required',
          type: ToastificationType.error,
        );
        return;
      }

      if (!_current && _endDate!.isBefore(_startDate!)) {
        CustomSnackbar.showToast(
          context,
          title: 'Error',
          description: 'End date cannot be before start date',
          type: ToastificationType.error,
        );
        return;
      }

      final addExperienceReq = AddExperienceReq(
        title: _titleController.text,
        practiceArea: _practiceArea!,
        firmId: firmId!,
        practiceLocation: _practiceLocation!,
        startDate: _startDate!,
        endDate: _endDate!,
        current: _current,
        skills: _skills,
        description: _descriptionController.text,
      );

      _profileBloc.add(ExperienceAdded(addExperienceReq: addExperienceReq));
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _firmNameController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }
}
