import 'package:dartz/dartz.dart';
import 'package:flutter_profit_summary_card/app/exceptions/service_exception.dart';
import 'package:flutter_profit_summary_card/app/services/graphqi_service.dart';
import 'package:flutter_profit_summary_card/app/services/helper/service_helper.dart';
import 'package:graphql/client.dart';

class GraphQIServiceImpl implements GraphQIService {
  final GraphQLClient graphQLClient;
  GraphQIServiceImpl(this.graphQLClient);

  @override
  Future<Either<ServiceException, List<dynamic>?>> consultSummaries() async {
    final response = await graphQLClient
        .query(QueryOptions(document: gql(ServiceHelper.query)));

    if (response.hasException) {
      return Left(ServiceException());
    }

    return Right(response.data?[ServiceHelper.summaryData]);
  }
}
