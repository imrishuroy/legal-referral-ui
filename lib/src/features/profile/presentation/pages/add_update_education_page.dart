import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/skills_constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AddUpdateEducationPageArgs {
  AddUpdateEducationPageArgs({
    required this.profileBloc,
    this.education,
  });
  final ProfileBloc profileBloc;
  final Education? education;
}

class AddUpdateEducationPage extends StatefulWidget {
  const AddUpdateEducationPage({
    required this.args,
    super.key,
  });

  final AddUpdateEducationPageArgs args;

  static const String name = 'AddEducationPage';

  @override
  State<AddUpdateEducationPage> createState() => _AddUpdateEducationPageState();
}

class _AddUpdateEducationPageState extends State<AddUpdateEducationPage> {
  final _formKey = GlobalKey<FormState>();
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
  void initState() {
    if (widget.args.education != null) {
      final education = widget.args.education!;

      _schoolController.text = education.school ?? '';
      _degreeController.text = education.degree ?? '';

      _fieldOfStudyController.text = education.fieldOfStudy ?? '';
      _startDateController.text = education.startDate != null
          ? DateTimeUtil.getFormattedDate(
              education.startDate!,
            )
          : '';
      _startDate = education.startDate;
      _endDateController.text = education.endDate != null
          ? DateTimeUtil.getFormattedDate(
              education.endDate!,
            )
          : '';

      _endDate = education.endDate;
      _current = education.current;
      _gradeController.text = education.grade ?? '';
      _achievementsController.text = education.achievements ?? '';
      _skills.addAll(education.skills);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileBloc = widget.args.profileBloc;
    final education = widget.args.education;
    return Scaffold(
      appBar: AppBar(
        elevation: 2.h,
        title: Text(
          education?.educationId == null ? 'Add Education' : 'Update Education',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: profileBloc,
        listener: (context, state) {
          if (state.educationStatus == EducationStatus.success) {
            context.pop();
          } else if (state.educationStatus == EducationStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure!.message,
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return state.educationStatus == EducationStatus.loading
              ? const CustomLoadingIndicator()
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Degree is required';
                                }
                                return null;
                              },
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
                                    if (value != null) {
                                      setState(() {
                                        _current = value;
                                        _endDateController.clear();
                                        _endDate = null;
                                      });
                                    }
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
                                        ? _startDate!.add(
                                            const Duration(days: 1),
                                          )
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
                              onChange: (skill) {
                                if (skill != null) {
                                  if (!_skills.contains(skill)) {
                                    setState(() {
                                      _skills.add(skill);
                                    });
                                  }
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
                            if (education?.educationId != null)
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    final educationId = education?.educationId;

                                    if (educationId != null) {
                                      profileBloc.add(
                                        EducationDeleted(
                                          educationId: educationId,
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    'Delete Education',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(height: 24.h),
                            CustomElevatedButton(
                              onTap: () => _addEducation(
                                profileBloc: profileBloc,
                              ),
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

  void _addEducation({required ProfileBloc profileBloc}) {
    if (_formKey.currentState!.validate()) {
      if (!_current && _endDate == null) {
        ToastUtil.showToast(
          context,
          title: 'Error',
          description: 'End date is required',
          type: ToastificationType.error,
        );
        return;
      }

      if (!_current &&
          (_endDate!.isBefore(_startDate!) || _endDate == _startDate)) {
        ToastUtil.showToast(
          context,
          title: 'Error',
          description: 'End date cannot be before start date',
          type: ToastificationType.error,
        );
        return;
      }

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

      final educationId = widget.args.education?.educationId;

      if (educationId != null) {
        profileBloc.add(
          EducationUpdated(
            educationId: educationId,
            education: education,
          ),
        );
      } else {
        profileBloc.add(
          EducationAdded(education: education),
        );
      }
    }
  }

  @override
  void dispose() {
    _schoolController.dispose();
    _degreeController.dispose();
    _fieldOfStudyController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _gradeController.dispose();
    _achievementsController.dispose();
    super.dispose();
  }
}
