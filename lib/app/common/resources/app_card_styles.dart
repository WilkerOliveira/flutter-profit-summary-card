import 'package:flutter/material.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_dimens.dart';

abstract class AppCardStyles {
  static ShapeBorder defaultCardBorder() => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimens.cardBorderRadius,
        ),
      );
}
