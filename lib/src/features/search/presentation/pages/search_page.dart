import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/search/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const String name = 'Searchpage';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchBloc = getIt<SearchBloc>();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      bloc: _searchBloc,
      listener: (context, state) {
        if (state.status == SearchStatus.failure) {
          ToastUtil.showToast(
            context,
            title: 'Error',
            description: state.failure?.message ?? 'Something went wrong',
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: SearchAppBar(
            searchController: _searchController,
            onChanged: (value) {
              if (value != null) {
                if (state.selectedSearchType == SearchType.posts) {
                  _searchBloc.add(
                    PostSearched(
                      query: value,
                    ),
                  );
                } else {
                  _searchBloc.add(
                    UserSearched(
                      query: value,
                    ),
                  );
                }
              }
              return null;
            },
            onSubmitted: (value) {
              if (value != null) {
                SharedPrefs.addSearchQueryHistory(query: value);
                if (state.selectedSearchType == SearchType.posts) {
                  _searchBloc.add(
                    PostSearched(
                      query: value,
                    ),
                  );
                } else {
                  _searchBloc.add(
                    UserSearched(
                      query: value,
                    ),
                  );
                }
              }
              return null;
            },
            appBarHeight: kToolbarHeight + 64.h,
            bottom: SizedBox(
              height: 50.h,
              child: ListView.builder(
                itemCount: SearchType.values.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 8.w,
                    ),
                    child: CustomChip(
                      label: _capitalizeFirstLetter(
                        SearchType.values[index].toString().split('.').last,
                      ),
                      isSelected:
                          SearchType.values[index] == state.selectedSearchType,
                      onTap: () {
                        _searchBloc.add(
                          SearchTypeSelected(
                            searchType: SearchType.values[index],
                            query: _searchController.text,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          body: SearchResults(
            searchBloc: _searchBloc,
            searchController: _searchController,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

String _capitalizeFirstLetter(String word) {
  if (word.isEmpty) {
    return word;
  }
  return word[0].toUpperCase() + word.substring(1);
}
