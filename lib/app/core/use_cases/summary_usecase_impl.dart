import 'package:dartz/dartz.dart';
import 'package:flutter_profit_summary_card/app/core/use_cases/summary_usecase.dart';
import 'package:flutter_profit_summary_card/app/models/wealth_summary.dart';
import 'package:flutter_profit_summary_card/app/repositories/summary_repository.dart';

class SummaryUseCaseImpl implements SummaryUseCase {
  final SummaryRepository repository;

  SummaryUseCaseImpl(this.repository);

  @override
  Future<Either<Exception, List<WealthSummary>?>> consultSummaries() async {
    return await repository.consultSummaries();
  }
}
