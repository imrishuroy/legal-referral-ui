import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/firm/data/data.dart';
import 'package:legal_referral_ui/src/features/firm/domain/domain.dart';
import 'package:legal_referral_ui/src/features/firm/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AddEditLawFirmPageArgs {
  AddEditLawFirmPageArgs({
    required this.firmBloc,
    this.firm,
  });
  final FirmBloc firmBloc;
  final Firm? firm;
}

class AddEditLawFirmPage extends StatefulWidget {
  const AddEditLawFirmPage({
    required this.args,
    super.key,
  });

  final AddEditLawFirmPageArgs args;

  static const String name = 'AddLawFirmPage';

  @override
  State<AddEditLawFirmPage> createState() => _AddEditLawFirmPageState();
}

class _AddEditLawFirmPageState extends State<AddEditLawFirmPage> {
  final _formKey = GlobalKey<FormState>();
  final _authBloc = getIt<AuthBloc>();
  final _firmBloc = getIt<FirmBloc>();

  final _nameController = TextEditingController();
  final _websiteController = TextEditingController();
  final _orgTypeController = TextEditingController();
  final _locationController = TextEditingController();
  final _aboutController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.args.firm?.name ?? '';
    _websiteController.text = widget.args.firm?.website ?? '';
    _orgTypeController.text = widget.args.firm?.orgType ?? '';
    _locationController.text = widget.args.firm?.location ?? '';
    _aboutController.text = widget.args.firm?.about ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Firm Page'),
      ),
      body: BlocConsumer<FirmBloc, FirmState>(
        bloc: _firmBloc,
        listener: (context, state) {
          if (state.status == FirmStatus.firmAdded) {
            context.pop();
          } else if (state.status == FirmStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          if (state.status == FirmStatus.loading) {
            return const CustomLoadingIndicator();
          }
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Firm Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Add File',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    UploadFileContainer(
                      onTap: () => _firmBloc.add(
                        FirmLogoFileSelected(),
                      ),
                      hintText: 'Choose file(.png, .jpeg, jpg)\n2 MB max',
                    ),
                    if (state.pickedFile != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const Text(
                            'UPLOADED FILES',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: LegalReferralColors.textGrey500,
                            ),
                          ),
                          if (state.pickedFile != null)
                            SizedBox(
                              height: 12.h,
                            ),
                          if (state.pickedFile != null)
                            Container(
                              color: LegalReferralColors.containerWhite500,
                              height: ImageUtil.getFileName(state.pickedFile)
                                          .length >
                                      50
                                  ? 120.h
                                  : 70.h,
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      IconStringConstants.file,
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        ImageUtil.getFileName(
                                          state.pickedFile,
                                        ),
                                        style: TextStyle(
                                          fontSize: 14.h,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              LegalReferralColors.textGrey500,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const Spacer(),
                                    if (state.pickedFile != null)
                                      CustomIconButton(
                                        onTap: () => _firmBloc.add(
                                          FirmLogoFileDeleted(),
                                        ),
                                        icon: SvgPicture.asset(
                                          IconStringConstants.deleteIcon,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    const SizedBox(height: 16),
                    CustomDropDown(
                      items: PracticeAreaConstants.allPracticeAreas,
                      onChange: (value) {
                        _orgTypeController.text = value ?? '';
                      },
                      selectedValue: _orgTypeController.text.isEmpty
                          ? null
                          : _orgTypeController.text,
                      hintText: 'Select type',
                      labelText: 'Organization Type',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a type';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      controller: _locationController,
                      hintText: 'Arizona',
                      labelText: 'Location',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a location';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      controller: _websiteController,
                      hintText: 'https://',
                      labelText: 'Website',
                      validator: Validator.validateURL,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      controller: _aboutController,
                      hintText: 'Share more about your firm',
                      labelText: 'About',
                      minLines: 5,
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter something about your firm';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Social Media Links',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    FirmSocialMedias(
                      firmBloc: _firmBloc,
                    ),
                    TextButton.icon(
                      onPressed: () => _firmBloc.add(
                        SocialMediaFieldAdded(),
                      ),
                      style: TextButton.styleFrom(
                        iconColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                        ),
                      ),
                      label: const Text(
                        'Add Social Media',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      icon: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomElevatedButton(
                      text: 'Add Firm',
                      onTap: () => _addFirm(state: state),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _addFirm({required FirmState state}) {
    if (_formKey.currentState!.validate()) {
      final userId = _authBloc.state.user?.userId;
      if (userId == null) {
        return;
      }
      final file = state.pickedFile;

      if (file == null) {
        ToastUtil.showToast(
          context,
          title: 'Error',
          description: 'Please select a file',
          type: ToastificationType.warning,
        );

        return;
      }

      final addFirm = AddFirmReq(
        name: _nameController.text,
        ownerUserId: userId,
        orgType: _orgTypeController.text,
        file: file,
        location: _locationController.text,
        website: _websiteController.text,
        about: _aboutController.text,
      );

      _firmBloc.add(FirmAdded(firm: addFirm));
    }
  }
}
