import 'package:dartz/dartz.dart';
import 'package:flutter_profit_summary_card/app/models/wealth_summary.dart';

abstract class SummaryRepository {
  Future<Either<Exception, List<WealthSummary>?>> consultSummaries();
}
