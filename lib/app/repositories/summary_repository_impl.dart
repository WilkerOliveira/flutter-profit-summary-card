import 'package:dartz/dartz.dart';
import 'package:flutter_profit_summary_card/app/exceptions/generic_exception.dart';
import 'package:flutter_profit_summary_card/app/models/wealth_summary.dart';
import 'package:flutter_profit_summary_card/app/repositories/summary_repository.dart';
import 'package:flutter_profit_summary_card/app/services/graphqi_service.dart';

class SummaryRepositoryImpl implements SummaryRepository {
  final GraphQIService service;

  SummaryRepositoryImpl(this.service);

  @override
  Future<Either<Exception, List<WealthSummary>?>> consultSummaries() async {
    try {
      var response = await service.consultSummaries();

      return response.fold((exception) => Left(exception), (result) {
        List<WealthSummary>? summaries = result
            ?.map(
              (e) => WealthSummary.fromJson(e),
            )
            .toList();

        return Right(summaries);
      });
    } catch (e) {
      return Left(GenericException());
    }
  }
}
