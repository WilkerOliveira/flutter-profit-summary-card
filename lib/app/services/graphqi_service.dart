import 'package:dartz/dartz.dart';
import 'package:flutter_profit_summary_card/app/exceptions/service_exception.dart';

abstract class GraphQIService {
  Future<Either<ServiceException, List<dynamic>?>> consultSummaries();
}
