import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/skills_constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_dropdown.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_snackbar.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AddEducationPage extends StatefulWidget {
  const AddEducationPage({super.key});

  static const String name = 'AddEducationPage';

  @override
  State<AddEducationPage> createState() => _AddEducationPageState();
}

class _AddEducationPageState extends State<AddEducationPage> {
  final _formKey = GlobalKey<FormState>();
  final _profileBloc = getIt<ProfileBloc>();
  final _schoolController = TextEditingController();
  final _degreeController = TextEditingController();
  final _fieldOfStudyController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _gradeController = TextEditingController();
  final _achievementsController = TextEditingController();
  late DateTime? _startDate;
  late DateTime? _endDate;
  bool _current = false;
  final List<String> _skills = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.h,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.08),
        title: Text(
          'Education Details',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        listener: (context, state) {
          if (state.educationStatus == EducationStatus.success) {
            context.pop();
          } else if (state.educationStatus == EducationStatus.failure) {
            CustomSnackbar.showToast(
              context,
              title: 'Error',
              description: state.failure!.message,
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return state.educationStatus == EducationStatus.loading
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
                              controller: _schoolController,
                              hintText: 'Boston University',
                              labelText: 'School',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'School is required';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _degreeController,
                              hintText: "Bachelor's",
                              labelText: 'Degree',
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _fieldOfStudyController,
                              hintText: 'Field of study',
                              labelText: 'Law',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Field of study is required';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.h),
                            GestureDetector(
                              onTap: () async {
                                final pickedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                  initialDate: DateTime.now(),
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
                                    setState(() {
                                      _current = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Currently pursuing',
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
                                    initialDate: DateTime.now(),
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
                            CustomTextField(
                              controller: _gradeController,
                              hintText: 'First class',
                              labelText: 'Grade',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Grade is required';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _achievementsController,
                              hintText: 'Sports, cultural',
                              labelText: 'Achievements',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Achievements are required';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.h),
                            CustomDropDown(
                              items: LawyerSkillsConstants.lawyerSkills,
                              onChange: (skills) {
                                if (skills != null) {
                                  setState(() {
                                    _skills.add(skills);
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
                            SizedBox(height: 24.h),
                            CustomElevatedButton(
                              onTap: _addEducation,
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

  void _addEducation() {
    if (_formKey.currentState!.validate()) {
      final education = Education(
        school: _schoolController.text,
        degree: _degreeController.text,
        fieldOfStudy: _fieldOfStudyController.text,
        startDate: _startDate,
        endDate: _current ? null : _endDate,
        current: _current,
        grade: _gradeController.text,
        achievements: _achievementsController.text,
        skills: _skills,
      );

      _profileBloc.add(
        EducationAdded(education: education),
      );
    }
  }
}
