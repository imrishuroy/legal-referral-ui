import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/account/domain/domain.dart';
import 'package:legal_referral_ui/src/features/account/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AskUsPage extends StatefulWidget {
  const AskUsPage({super.key});
  static const String name = 'AskUsPage';

  @override
  State<AskUsPage> createState() => _AskUsPageState();
}

class _AskUsPageState extends State<AskUsPage> {
  final _accountBloc = getIt<AccountBloc>();

  final _formKey = GlobalKey<FormState>();
  final _topicController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Ask Us',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocConsumer<AccountBloc, AccountState>(
        bloc: _accountBloc,
        listener: (context, state) {
          if (state.status == AccountStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.error,
            );
          } else if (state.status == AccountStatus.success) {
            ToastUtil.showToast(
              context,
              title: 'Success',
              description: 'FAQ created successfully',
              type: ToastificationType.success,
            );

            context.pop();
          }
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            margin: EdgeInsets.symmetric(
              vertical: 8.h,
            ),
            color: LegalReferralColors.backgroundWhite255,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.multiline,
                    controller: _topicController,
                    hintText: 'Place holder',
                    labelText: 'Topic',
                    maxLines: 5,
                    minLines: 5,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter a topic';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    controller: _descriptionController,
                    hintText: 'Explain your experience',
                    labelText: 'Description',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomElevatedButton(
                    text: 'Submit',
                    isLoading: state.status == AccountStatus.loading,
                    onTap: _submit,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _accountBloc.add(
        FAQCreated(
          faq: FAQ(
            question: _topicController.text,
            answer: _descriptionController.text,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _topicController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
