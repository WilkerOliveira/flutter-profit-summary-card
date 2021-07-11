import 'package:flutter/material.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_colors.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_dimens.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_text_styles.dart';
import 'package:flutter_profit_summary_card/app/ui/widgets/shimmer_value.dart';

class SummaryRowItemWidget extends StatelessWidget {
  final String text;
  final String value;
  final bool isLoading;

  const SummaryRowItemWidget({
    Key? key,
    required this.text,
    required this.value,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppDimens.cardPaddingRight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.text,
            style: AppTextStyles.defaultTextStyle(
              fontSize: AppDimens.labelDefaultSize,
              color: AppColors.labelDefaultColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          this.isLoading
              ? ShimmerValue()
              : Text(
                  this.value,
                  style: AppTextStyles.defaultTextStyle(
                    fontSize: AppDimens.labelDefaultTotalSize,
                    color: AppColors.labelBlueColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
        ],
      ),
    );
  }
}
