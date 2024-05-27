import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  SearchAppBar({
    required this.searchController,
    required this.onChanged,
    required this.onSubmitted,
    required this.appBarHeight,
    this.bottom,
    super.key,
  }) : preferredSize = Size.fromHeight(appBarHeight);

  final TextEditingController searchController;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onSubmitted;
  final double appBarHeight;
  final Widget? bottom;

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  final Size preferredSize;
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              Row(
                children: [
                  CustomIconButton(
                    onTap: () => context.pop(),
                    icon: SvgPicture.asset(
                      IconStringConstants.backArrow,
                      fit: BoxFit.scaleDown,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomTextField(
                      borderColor: LegalReferralColors.borderGrey199,
                      fillColor: LegalReferralColors.containerWhite400,
                      controller: widget.searchController,
                      hintText: 'Search',
                      onChanged: widget.onChanged,
                      onSubmitted: widget.onSubmitted,
                      labelText: '',
                      showLabel: false,
                    ),
                  ),
                ],
              ),
              if (widget.bottom != null)
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: widget.bottom,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
