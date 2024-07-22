import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/widgets/ad_type_card.dart';
import 'package:toastification/toastification.dart';

class CreateAdPage extends StatefulWidget {
  const CreateAdPage({super.key});

  static const name = 'CreateAdPage';

  @override
  State<CreateAdPage> createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  final _adBloc = getIt<AdBloc>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Ad Start',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<AdBloc, AdState>(
          bloc: _adBloc,
          builder: (context, state) {
            final uploadHintText =
                state.adType == AdType.image ? 'Update Image' : 'Upload Video';
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(height: 8),
                  Container(
                    padding: EdgeInsets.only(left: 16.w),
                    color: LegalReferralColors.containerWhite500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select advertisement type',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(
                          height: 270.h,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              AdTypeCard(
                                onPressed: () => _adBloc.add(
                                  const AdTypeChanged(adType: AdType.image),
                                ),
                                adTitle: 'Advertise with image',
                                isSelected: state.adType == AdType.image,
                              ),
                              const Gap(width: 8),
                              AdTypeCard(
                                onPressed: () => _adBloc.add(
                                  const AdTypeChanged(adType: AdType.video),
                                ),
                                adTitle: 'Adverise with Video',
                                isSelected: state.adType == AdType.video,
                              ),
                              const Gap(width: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(height: 8),
                  Container(
                    color: LegalReferralColors.containerWhite500,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: _titleController,
                          hintText: 'Give title for your ad',
                          labelText: 'Title',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Title is required';
                            }
                            return null;
                          },
                        ),
                        const Gap(
                          height: 16,
                        ),
                        CustomTextField(
                          keyboardType: TextInputType.multiline,
                          controller: _descriptionController,
                          hintText: 'Write your ad',
                          labelText: 'Description',
                          maxLines: 5,
                          minLines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Description is required';
                            }
                            return null;
                          },
                        ),
                        const Gap(
                          height: 16,
                        ),
                        CustomTextField(
                          controller: _linkController,
                          hintText: 'http://',
                          labelText: 'Link',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Link is required';
                            }
                            return null;
                          },
                        ),
                        const Gap(
                          height: 16,
                        ),
                        Text(
                          'Add File',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Gap(height: 8),
                        GestureDetector(
                          onTap: () => _adBloc.add(
                            const AdFilePicked(),
                          ),
                          child: Container(
                            height: 150.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: LegalReferralColors.containerWhite500,
                              border: Border.all(
                                color: LegalReferralColors.borderBlue300,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child: SvgPicture.asset(
                                    IconStringConstants.uploadIcon,
                                  ),
                                ),
                                Text(
                                  '$uploadHintText\n25 MB max',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.h,
                                    fontWeight: FontWeight.w400,
                                    color: LegalReferralColors.textGrey400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        for (int index = 0; index < state.files.length; index++)
                          ListTile(
                            title: Text(
                              state.files[index].path.split('/').last,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            trailing: SvgButton(
                              height: 24.h,
                              width: 24.w,
                              imagePath: IconStringConstants.deleteIcon,
                              onPressed: () {
                                _adBloc.add(FileRemoved(index: index));
                              },
                            ),
                          ),
                        const Gap(
                          height: 16,
                        ),
                        CustomElevatedButton(
                          text: 'Preview',
                          onTap: _previewAd,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _previewAd() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_adBloc.state.files.isEmpty) {
        ToastUtil.showToast(
          context,
          title: 'Error',
          description: 'Please select a file',
          type: ToastificationType.warning,
        );
        return;
      }

      context.pushNamed(
        PreviewAdPage.name,
        extra: PreviewAdPageArgs(
          title: _titleController.text,
          description: _descriptionController.text,
          link: _linkController.text,
          adBloc: _adBloc,
        ),
      );
    }
  }
}
