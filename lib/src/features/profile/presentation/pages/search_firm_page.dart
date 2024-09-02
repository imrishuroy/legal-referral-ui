import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class SearchFirmPage extends StatefulWidget {
  const SearchFirmPage({super.key});

  static const String name = 'SearchFirmPage';

  @override
  State<SearchFirmPage> createState() => _SearchFirmPageState();
}

class _SearchFirmPageState extends State<SearchFirmPage> {
  final _searchController = TextEditingController();
  final _profileBloc = getIt<ProfileBloc>();

  @override
  void initState() {
    _profileBloc.add(
      const FirmSearched(
        query: '',
        limit: 10,
        offset: 1,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Firm'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          children: [
            CustomTextField(
              controller: _searchController,
              hintText: 'Search Firm',
              labelText: 'Search Firm',
              showLabel: false,
              onChanged: (value) {
                if (value != null && value.isNotEmpty && value.length > 2) {
                  _profileBloc.add(
                    FirmSearched(
                      query: value,
                      limit: 10,
                      offset: 1,
                    ),
                  );
                } else if (value != null && value.isEmpty) {
                  _profileBloc.add(
                    const FirmSearched(
                      query: '',
                      limit: 10,
                      offset: 1,
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            BlocConsumer<ProfileBloc, ProfileState>(
              bloc: _profileBloc,
              listener: (context, state) {
                if (state.companyStatus == CompanyStatus.failure) {
                  ToastUtil.showToast(
                    context,
                    title: 'Error',
                    description: state.failure?.message ?? 'An error occurred',
                    type: ToastificationType.error,
                  );
                }
              },
              builder: (context, state) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.firms.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final firm = state.firms[index];
                      return GestureDetector(
                        onTap: () => context.pop(firm),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(firm?.name ?? 'N/A'),
                          leading: CustomAvatar(imageUrl: firm?.logoUrl),
                          subtitle: Text(firm?.orgType ?? 'N/A'),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
