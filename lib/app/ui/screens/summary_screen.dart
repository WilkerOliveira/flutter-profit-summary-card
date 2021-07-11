import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_card_styles.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_colors.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_dimens.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_strings.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_text_styles.dart';
import 'package:flutter_profit_summary_card/app/controllers/summary_controller.dart';
import 'package:flutter_profit_summary_card/app/ui/widgets/app_outline_button.dart';
import 'package:flutter_profit_summary_card/app/common/extensions/double_extensions.dart';
import 'package:flutter_profit_summary_card/app/ui/widgets/popup_home_widget.dart';
import 'package:flutter_profit_summary_card/app/ui/widgets/shimmer_value.dart';
import 'package:flutter_profit_summary_card/app/ui/widgets/summary_row_item_widget.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState
    extends ModularState<SummaryScreen, SummaryController> {
  @override
  void initState() {
    super.initState();
    controller.currentContext = context;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller.loadSummaries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SizedBox(
            height: AppDimens.cardHeight,
            child: Card(
              shape: AppCardStyles.defaultCardBorder(),
              margin: EdgeInsets.all(AppDimens.cardMargin),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  AppDimens.cardPaddingLeft,
                  AppDimens.cardPaddingTop,
                  0, //had to do this because of PopupHomeWidget
                  AppDimens.cardPaddingBotton,
                ),
                child: Observer(
                  builder: (_) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _header(),
                      Spacer(),
                      Center(
                        child: Text(
                          AppStrings.totalInvested,
                          style: AppTextStyles.defaultTextStyle(
                            fontSize: AppDimens.labelDefaultSize,
                            color: AppColors.labelDefaultColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.simpleSpaceHeight,
                      ),
                      Center(
                        child: this.controller.isLoading
                            ? ShimmerValue()
                            : Text(
                                "${AppStrings.currentSimbol} ${controller.currentSummary?.total.formatToCurrency()}",
                                style: AppTextStyles.defaultTextStyle(
                                  fontSize: AppDimens.labelTotalSize,
                                  color: AppColors.labelBlueColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                      ),
                      Spacer(),
                      SummaryRowItemWidget(
                        isLoading: this.controller.isLoading,
                        text: AppStrings.profitability,
                        value:
                            "${controller.currentSummary?.profitability.formatToCurrency(fractionDigits: 3)}%",
                      ),
                      Spacer(),
                      SummaryRowItemWidget(
                        isLoading: this.controller.isLoading,
                        text: AppStrings.cdi,
                        value:
                            "${controller.currentSummary?.cdi.formatToCurrency()}%",
                      ),
                      Spacer(),
                      SummaryRowItemWidget(
                        isLoading: this.controller.isLoading,
                        text: AppStrings.gainMonth,
                        value:
                            "${AppStrings.currentSimbol} ${controller.currentSummary?.gain.formatToCurrency()}",
                      ),
                      Spacer(),
                      Divider(
                        color: AppColors.dividerColor,
                        height: AppDimens.dividerHeight,
                      ),
                      SizedBox(
                        height: AppDimens.defaultSpaceHeight,
                      ),
                      _buttons()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.yourSummary,
            style: AppTextStyles.defaultTextStyle(
              fontSize: AppDimens.labelSummarySize,
              color: AppColors.labelBlueColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          PopupHomeWidget(
            onItemPopupSelected: this.controller.onPopupItemSelected,
          ),
        ],
      );

  Widget _buttons() => Padding(
        padding: EdgeInsets.only(right: AppDimens.cardPaddingRight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppOutlineButton(
              key: Key("btnBack"),
              onPressed: this.controller.backSummary,
              text: AppStrings.back,
              showButton: !this.controller.isFirstSummary,
            ),
            AppOutlineButton(
              key: Key("btnNex"),
              onPressed: this.controller.currentSummary?.hasHistory == true
                  ? this.controller.getNextSummary
                  : null,
              text: AppStrings.seeMore,
            ),
          ],
        ),
      );
}
