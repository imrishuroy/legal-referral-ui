import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/practice_area_constants.dart';
import 'package:legal_referral_ui/src/core/constants/state_constant.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class CreateReferralPage extends StatefulWidget {
  const CreateReferralPage({super.key});
  static const String name = 'CreateReferralPage';

  @override
  State<CreateReferralPage> createState() => _CreateReferralPageState();
}

class _CreateReferralPageState extends State<CreateReferralPage> {
  final _authBloc = getIt<AuthBloc>();
  final _referralBloc = getIt<ReferralBloc>();
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _caseDescriptionController = TextEditingController();
  final _practiceAreaController = TextEditingController();
  final _practiceLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Referral',
          style: textTheme.headlineLarge,
        ),
      ),
      body: BlocConsumer<ReferralBloc, ReferralState>(
        bloc: _referralBloc,
        listener: (context, state) {
          if (state.status == ReferralStatus.success) {
            //context.pop();
          } else if (state.status == ReferralStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          if (state.status == ReferralStatus.loading) {
            return const CustomLoadingIndicator();
          }

          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    color: LegalReferralColors.backgroundWhite255,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _titleController,
                          hintText: 'Enter the Title for Referral',
                          labelText: 'Title',
                          validator: Validator.validateReferralTitle,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomAutoComplete(
                          options: PracticeAreaConstants.allPracticeAreas,
                          hintText: 'Select practice area',
                          labelText: 'Preferred Practice area',
                          textEditingController: _practiceAreaController,
                          validator: Validator.validatePracticeArea,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomAutoComplete(
                          options: StateConstants.statesList,
                          hintText: 'Select practice location',
                          labelText: 'Preferred Practice location',
                          textEditingController: _practiceLocationController,
                          validator: Validator.validatePracticeLocation,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomTextField(
                          keyboardType: TextInputType.multiline,
                          controller: _caseDescriptionController,
                          hintText: 'Case Description',
                          labelText: 'Enter case details',
                          maxLines: 5,
                          minLines: 5,
                          validator: Validator.validateReferralDescription,
                        ),
                        CheckboxListTile(
                          value: state.referConnection,
                          checkColor: LegalReferralColors.textBlack,
                          fillColor:
                              WidgetStateProperty.all(Colors.transparent),
                          onChanged: (value) => _referralBloc.add(
                            const ReferConnectionToggled(),
                          ),
                          title: Text(
                            'Refer connections only',
                            style: textTheme.bodyLarge,
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                        ),
                        CustomOutlinedButton(
                          text: 'Select Connection',
                          onPressed: () => _showReferralSheet(
                            context: context,
                            referConnection: state.referConnection,
                          ),
                          textColor: LegalReferralColors.textBlue100,
                          borderColor: LegalReferralColors.borderBlue100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showReferralSheet({
    required BuildContext context,
    required bool referConnection,
  }) {
    if (_formKey.currentState!.validate()) {
      CustomBottomSheet.show(
        borderRadius: true,
        maxWidth: double.infinity,
        context: context,
        child: SizedBox(
          height: 624.h,
          child: ReferralConnectionsDialoag(
            addReferralReq: CreateReferral(
              title: _titleController.text,
              caseDescription: _caseDescriptionController.text,
              practiceArea: _practiceAreaController.text,
              practiceLocation: _practiceLocationController.text,
              referrerUserId: '${_authBloc.state.user?.userId}',
              referredUserIds: [],
            ),
            referConnection: referConnection,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _caseDescriptionController.dispose();
    _practiceAreaController.dispose();
    super.dispose();
  }
}
