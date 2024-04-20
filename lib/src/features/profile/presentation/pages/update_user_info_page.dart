import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_loading_indicator.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_snackbar.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/profile/data/data.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class UpdateUserInfoPage extends StatefulWidget {
  const UpdateUserInfoPage({
    required this.user,
    super.key,
  });

  final UserProfile? user;

  static const String name = 'UpdateUserInfoPage';

  @override
  State<UpdateUserInfoPage> createState() => _UpdateUserInfoPageState();
}

class _UpdateUserInfoPageState extends State<UpdateUserInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _profileBloc = getIt<ProfileBloc>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _averageBillingPerClientController = TextEditingController();
  final _caseResolutionRateController = TextEditingController();
  final _aboutController = TextEditingController();

  @override
  void initState() {
    final user = widget.user;
    _firstNameController.text = user?.firstName ?? '';
    _lastNameController.text = user?.lastName ?? '';

    _averageBillingPerClientController.text =
        user?.averageBillingPerClient != null
            ? user!.averageBillingPerClient.toString()
            : '';

    _caseResolutionRateController.text = user?.caseResolutionRate != null
        ? user!.caseResolutionRate.toString()
        : '';

    _aboutController.text = widget.user?.about ?? '';

    AppLogger.info('firstName: ${_firstNameController.text}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Info'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        listener: (context, state) {
          if (state.profileStatus == ProfileStatus.success) {
            context.pop();
          } else if (state.profileStatus == ProfileStatus.failure) {
            CustomSnackbar.showToast(
              context,
              title: 'Error',
              description: state.failure!.message,
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return state.profileStatus == ProfileStatus.loading
              ? const CustomLoadingIndicator()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 12.h),
                            CustomTextField(
                              controller: _firstNameController,
                              hintText: 'First Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'First Name is required';
                                }
                                return null;
                              },
                              labelText: 'First Name',
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _lastNameController,
                              hintText: 'Last Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Last Name is required';
                                }
                                return null;
                              },
                              labelText: 'Last Name',
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _averageBillingPerClientController,
                              hintText: 'Average Billing Per Client',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Average Billing Per '
                                      'Client is required';
                                }
                                return null;
                              },
                              labelText: 'Average Billing Per Client',
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _caseResolutionRateController,
                              hintText: 'Case Resolution Rate in %',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Case Resolution Rate is required';
                                } else if (int.tryParse(value) == null) {
                                  return 'Case Resolution Rate must '
                                      'be a number';
                                } else if (int.tryParse(value)! > 100) {
                                  return 'Case Resolution Rate must '
                                      'be less than 100';
                                }

                                return null;
                              },
                              labelText: 'Case Resolution Rate',
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _aboutController,
                              hintText: 'About',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'About is required';
                                }
                                return null;
                              },
                              labelText: 'About',
                              maxLines: 2,
                            ),
                            SizedBox(height: 24.h),
                            CustomElevatedButton(
                              onTap: _updateUserInfo,
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

  void _updateUserInfo() {
    if (_formKey.currentState!.validate()) {
      final uploadUserInfoReq = UploadUserInfoReq(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        averageBillingPerClient:
            int.tryParse(_averageBillingPerClientController.text) ?? 1,
        caseResolutionRate:
            int.tryParse(_caseResolutionRateController.text) ?? 1,
        about: _aboutController.text,
      );
      _profileBloc.add(
        UserInfoUpdated(
          uploadUserInfoReq: uploadUserInfoReq,
        ),
      );
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _averageBillingPerClientController.dispose();
    _caseResolutionRateController.dispose();
    _aboutController.dispose();
    super.dispose();
  }
}
