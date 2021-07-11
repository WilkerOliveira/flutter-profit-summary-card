import 'package:flutter/material.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_colors.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_dimens.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_strings.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_text_styles.dart';

class PopupHomeWidget extends StatelessWidget {
  final Function onItemPopupSelected;
  const PopupHomeWidget({
    Key? key,
    required this.onItemPopupSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: PopupMenuButton(
        onSelected: (value) {
          this.onItemPopupSelected();
        },
        icon: Icon(
          Icons.more_vert,
          color: AppColors.moreIconColor,
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Center(
                child: Text(
              AppStrings.home,
              style: AppTextStyles.defaultTextStyle(
                fontSize: AppDimens.labelDefaultSize,
                color: AppColors.labelBlueColor,
                fontWeight: FontWeight.w500,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
