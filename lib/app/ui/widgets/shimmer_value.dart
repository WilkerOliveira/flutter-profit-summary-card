import 'package:flutter/material.dart';
import 'package:flutter_profit_summary_card/app/common/resources/app_dimens.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerValue extends StatelessWidget {
  const ShimmerValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        width: AppDimens.shimmerWidth,
        height: AppDimens.shimmerHeight,
        color: Colors.grey,
      ),
    );
  }
}
