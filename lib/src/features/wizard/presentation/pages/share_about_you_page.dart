import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_autocomplete.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_loading_indicator.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/pages/feeds_page.dart';
import 'package:legal_referral_ui/src/features/wizard/data/data.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';

class ShareAboutYouPage extends StatefulWidget {
  const ShareAboutYouPage({
    required this.wizardBloc,
    super.key,
  });

  final WizardBloc wizardBloc;

  @override
  State<ShareAboutYouPage> createState() => _ShareAboutYouPageState();
}

class _ShareAboutYouPageState extends State<ShareAboutYouPage> {
  final _addressController = TextEditingController();
  final _practiceAreaController = TextEditingController();
  final _practiceLocationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: LegalReferralColors.primaryBackground,
        title: Text(
          'Share About You',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.h,
          ),
        ),
      ),
      body: BlocConsumer<WizardBloc, WizardState>(
        bloc: widget.wizardBloc,
        listener: (context, state) {
          if (state.wizardStatus == WizardStatus.success &&
              state.wizardStep == WizardStep.aboutYou) {
            context.goNamed(FeedsPage.name);
          }
        },
        builder: (context, state) {
          return state.wizardStatus == WizardStatus.loading
              ? const CustomLoadingIndicator()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24.h),
                            Text(
                              'Personal',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.h,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _addressController,
                              hintText:
                                  'St. Thomas Street, Anchorage, Alaska, USA',
                              labelText: 'Address',
                              validator: (value) =>
                                  Validator.validateAddress(value),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'Share About Your Experience',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.h,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            CustomAutoComplete(
                              options: PracticeAreaConstants.allPracticeAreas,
                              hintText: 'Real estate, Finance etc',
                              labelText: 'Practice Area',
                              validator: (value) =>
                                  Validator.validatePracticeArea(value),
                              textEditingController: _practiceAreaController,
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _practiceLocationController,
                              hintText: 'Alaska, Florida',
                              labelText: 'Practice Location',
                              validator: (value) =>
                                  Validator.validatePracticeLocation(value),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _experienceController,
                              hintText: '4 years',
                              labelText: 'Experience',
                              validator: (value) =>
                                  Validator.validateExperience(value),
                            ),
                            SizedBox(height: 24.h),
                            CustomElevatedButton(
                              onTap: () => _save(context),
                              text: 'Save and Proceed',
                            ),
                            SizedBox(height: 58.h),
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

  void _save(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      AppLogger.info('practiceArea: ${_practiceAreaController.text}');
      final aboutYouReq = AboutYouReq(
        address: _addressController.text,
        practiceArea: _practiceAreaController.text,
        practiceLocation: _practiceLocationController.text,
        experience: _experienceController.text,
      );

      widget.wizardBloc.add(AboutYouSaved(aboutYouReq: aboutYouReq));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
    _practiceAreaController.dispose();
    _practiceLocationController.dispose();
    _experienceController.dispose();
  }
}
