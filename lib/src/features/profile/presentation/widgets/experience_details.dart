// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:legal_referral_ui/src/core/constants/colors.dart';
// import 'package:legal_referral_ui/src/core/constants/practice_area_constants.dart';
// import 'package:legal_referral_ui/src/core/constants/skills_constants.dart';
// import 'package:legal_referral_ui/src/core/constants/state_constant.dart';
// import 'package:legal_referral_ui/src/core/utils/utils.dart';
// import 'package:legal_referral_ui/src/core/widgets/custom_dropdown.dart';
// import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
// import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
// import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

// class ExperienceDetails extends StatefulWidget {
//   const ExperienceDetails({
//     required this.experience,
//     required this.profileBloc,
//     required this.index,
//     super.key,
//   });

//   final Experience experience;
//   final ProfileBloc profileBloc;
//   final int index;

//   @override
//   State<ExperienceDetails> createState() => _ExperienceDetailsState();
// }

// class _ExperienceDetailsState extends State<ExperienceDetails> {
//   final _titleController = TextEditingController();
//   final _companyNameController = TextEditingController();
//   final _startDateController = TextEditingController();
//   final _endDateController = TextEditingController();
//   final _descriptionController = TextEditingController();

//   @override
//   void initState() {
//     _titleController.text = widget.experience.title;
//     _companyNameController.text = widget.experience.companyName ?? '';

//     if (widget.experience.startDate != null) {
//       _startDateController.text = DateTimeUtil.getFormattedDate(
//         widget.experience.startDate!,
//       );
//     }

//     if (widget.experience.endDate != null) {
//       _endDateController.text = DateTimeUtil.getFormattedDate(
//         widget.experience.endDate!,
//       );
//     }

//     _descriptionController.text = widget.experience.description ?? '';

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 12.h),
//         CustomTextField(
//           controller: _titleController,
//           hintText: 'Senior attorney',
//           labelText: 'Title',
//           onChanged: (value) {
//             widget.profileBloc.add(
//               ExperienceTitleChanged(
//                 title: value!,
//                 index: widget.index,
//               ),
//             );
//             return null;
//           },
//           validator: (value) => value!.isEmpty ? 'Title is required' : null,
//         ),
//         SizedBox(height: 16.h),
//         CustomDropDown(
//           items: PracticeAreaConstants.allPracticeAreas,
//           onChange: (value) => widget.profileBloc.add(
//             ExperiencePracticeAreaChanged(
//               practiceArea: value!,
//               index: widget.index,
//             ),
//           ),
//           hintText: 'Practice area',
//           labelText: 'Practice area',
//           validator: (value) =>
//               value == null ? 'Practice area is required' : null,
//         ),
//         SizedBox(height: 16.h),
//         CustomTextField(
//           controller: _companyNameController,
//           hintText: 'Simon LAW firm',
//           labelText: 'Company name',
//           onChanged: (value) {
//             widget.profileBloc.add(
//               ExperienceCompanyChanged(
//                 company: value!,
//                 index: widget.index,
//               ),
//             );
//             return null;
//           },
//           validator: (value) =>
//               value!.isEmpty ? 'Company name is required' : null,
//         ),
//         SizedBox(height: 16.h),
//         CustomDropDown(
//           items: StateConstants.statesList,
//           onChange: (practiceLocation) => widget.profileBloc.add(
//             ExperiencePracticeLocationChanged(
//               practiceLocation: practiceLocation!,
//               index: widget.index,
//             ),
//           ),
//           hintText: 'Practice location',
//           labelText: 'Practice location',
//           validator: (value) =>
//               value == null ? 'Practice location is required' : null,
//         ),
//         SizedBox(height: 16.h),
//         GestureDetector(
//           onTap: () async {
//             final pickedDate = await showDatePicker(
//               context: context,
//               firstDate: DateTime(1900),
//               lastDate: DateTime.now(),
//               initialDate: widget.experience.startDate ?? DateTime.now(),
//               builder: (context, child) {
//                 return Theme(
//                   data: ThemeData.light().copyWith(
//                     colorScheme: const ColorScheme.light(
//                       primary: LegalReferralColors.buttonPrimary,
//                     ),
//                     dialogBackgroundColor:
//                         LegalReferralColors.primaryBackground,
//                   ),
//                   child: child!,
//                 );
//               },
//             );

//             if (pickedDate != null) {
//               _startDateController.text = DateTimeUtil.getFormattedDate(
//                 pickedDate,
//               );

//               widget.profileBloc.add(
//                 ExperienceStartDateChanged(
//                   startDate: pickedDate,
//                   index: widget.index,
//                 ),
//               );
//             }
//           },
//           child: CustomTextField(
//             controller: _startDateController,
//             hintText: 'dd/mm/yyyy',
//             labelText: 'Start date',
//             enabled: false,
//             validator: (value) =>
//                 value!.isEmpty ? 'Start date is required' : null,
//           ),
//         ),
//         SizedBox(height: 16.h),
//         Row(
//           children: [
//             Checkbox(
//               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//               value: widget.experience.current,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4.r),
//                 side: const BorderSide(),
//               ),
//               checkColor: LegalReferralColors.textBlue100,
//               activeColor: Colors.transparent,
//               onChanged: (value) {
//                 if (value != null) {
//                   widget.profileBloc.add(
//                     ExperienceCurrentChanged(
//                       current: value,
//                       index: widget.index,
//                     ),
//                   );
//                 }
//               },
//             ),
//             Text(
//               'Currently work here',
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//           ],
//         ),
//         if (!widget.experience.current) SizedBox(height: 16.h),
//         if (!widget.experience.current)
//           GestureDetector(
//             onTap: () async {
//               final pickedDate = await showDatePicker(
//                 context: context,
//                 firstDate: DateTime(1900),
//                 lastDate: DateTime.now(),
//                 initialDate: widget.experience.endDate,
//                 builder: (context, child) {
//                   return Theme(
//                     data: ThemeData.light().copyWith(
//                       colorScheme: const ColorScheme.light(
//                         primary: LegalReferralColors.buttonPrimary,
//                       ),
//                       dialogBackgroundColor:
//                           LegalReferralColors.primaryBackground,
//                     ),
//                     child: child!,
//                   );
//                 },
//               );

//               if (pickedDate != null) {
//                 _endDateController.text = DateTimeUtil.getFormattedDate(
//                   pickedDate,
//                 );

//                 widget.profileBloc.add(
//                   ExperienceEndDateChanged(
//                     endDate: pickedDate,
//                     index: widget.index,
//                   ),
//                 );
//               }
//             },
//             child: CustomTextField(
//               controller: _endDateController,
//               hintText: 'dd/mm/yyyy',
//               labelText: 'End date',
//               enabled: false,
//               validator: (value) =>
//                   value!.isEmpty ? 'End date is required' : null,
//             ),
//           ),
//         SizedBox(height: 16.h),
//         CustomDropDown(
//           items: LawyerSkillsConstants.lawyerSkills,
//           showSelectedValue: false,
//           onChange: (skill) {
//             if (skill != null) {
//               widget.profileBloc.add(
//                 ExperienceSkillAdded(
//                   skill: skill,
//                   index: widget.index,
//                 ),
//               );
//             }
//           },
//           hintText: 'Skills',
//           labelText: 'Skills',
//           validator: (_) => widget.experience.skills.isEmpty
//               ? 'At least one skill is required'
//               : null,
//         ),
//         if (widget.experience.skills.isNotEmpty)
//           Padding(
//             padding: EdgeInsets.only(top: 8.h),
//             child: Wrap(
//               spacing: 8.w,
//               runSpacing: 2.h,
//               children: [
//                 for (final skill in widget.experience.skills)
//                   Chip(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4.r),
//                       side: const BorderSide(
//                         color: LegalReferralColors.buttonPrimary,
//                       ),
//                     ),
//                     labelPadding: EdgeInsets.only(left: 8.w, right: 8.w),
//                     label: Text(skill),
//                     onDeleted: () => widget.profileBloc.add(
//                       ExperienceSkillRemoved(
//                         skill: skill,
//                         index: widget.index,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         SizedBox(height: 16.h),
//         CustomTextField(
//           controller: _descriptionController,
//           hintText: 'Job summary',
//           maxLines: 3,
//           labelText: 'Description',
//           onChanged: (value) {
//             widget.profileBloc.add(
//               ExperienceDescriptionChanged(
//                 description: value!,
//                 index: widget.index,
//               ),
//             );
//             return null;
//           },
//           validator: (value) =>
//               value!.isEmpty ? 'Description is required' : null,
//         ),
//         SizedBox(height: 16.h),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _companyNameController.dispose();
//     _startDateController.dispose();
//     _endDateController.dispose();
//     super.dispose();
//   }
// }
