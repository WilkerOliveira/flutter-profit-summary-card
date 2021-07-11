import 'package:flutter/material.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_colors.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_dimens.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_text_styles.dart';

class AppOutlineButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final bool showButton;

  const AppOutlineButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.showButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.showButton
        ? OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: this.onPressed == null
                    ? AppColors.disabledButtonColor
                    : AppColors.buttonBorderColor,
              ),
              shape: StadiumBorder(),
            ),
            onPressed: this.onPressed,
            child: Text(
              this.text,
              style: AppTextStyles.defaultTextStyle(
                fontSize: AppDimens.buttonTextSize,
                color: this.onPressed == null
                    ? AppColors.disabledButtonColor
                    : AppColors.buttonTextColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        : Container();
  }
}
