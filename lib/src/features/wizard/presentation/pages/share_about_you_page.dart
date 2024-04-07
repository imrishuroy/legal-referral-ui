import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/home_page.dart';
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

  final _authBloc = getIt<AuthBloc>();

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
            context.goNamed(HomePage.name);
          }
        },
        builder: (context, state) {
          return state.wizardStatus == WizardStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
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
                              //  validator: (value) =>
                              // Validators.validateName(value),
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
                            CustomTextField(
                              controller: _practiceAreaController,
                              hintText: 'Real estate, Finance etc',
                              labelText: 'Practice Area',
                              //  validator: (value) =>
                              // Validators.validateName(value),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _practiceLocationController,
                              hintText: 'Alaska, Florida',
                              labelText: 'Practice Location',
                              // validator: (value) =>
                              // Validators.validateName(value),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _experienceController,
                              hintText: '4 years',
                              labelText: 'Experience',
                              // validator: (value) =>
                              // Validators.validateName(value),
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
      final userId = _authBloc.state.user?.userId;
      if (userId == null) {
        return;
      }
      final aboutYouReq = AboutYouReq(
        userId: userId,
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
