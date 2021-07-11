import 'package:flutter_profit_summary_card/app/services/helper/service_helper.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_profit_summary_card/app/exceptions/service_exception.dart';
import 'package:flutter_profit_summary_card/app/services/graphqi_service.dart';
import 'package:flutter_profit_summary_card/app/services/graphqi_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/models/wealth_summary_mock.dart';
import '../../mocks/services/grapth_client_mock.dart';

void main() {
  GraphQLClient? graphQL;
  GraphQIService? service;

  setUp(() {
    graphQL = GraphClientMock();
    service = GraphQIServiceImpl(graphQL!);

    registerFallbackValue(QueryOptions(document: gql(ServiceHelper.query)));
  });

  test('Should return a list of Summary', () async {
    when(() => graphQL?.query(any())).thenAnswer(
      (_) async => Future.value(
        QueryResult(
          data: WealthSummaryMock.jsonData,
          source: QueryResultSource.network,
        ),
      ),
    );

    var response = await service?.consultSummaries();

    expect(response, isNot(equals(null)));

    expect(response?.isRight(), equals(true));
  });

  test('Should return a Service Exception', () async {
    when(() => graphQL?.query(
          any(),
        )).thenAnswer((_) => Future.value(
          QueryResult(
            exception: OperationException(),
            data: null,
            source: QueryResultSource.network,
          ),
        ));

    var response = await service?.consultSummaries();

    expect(response?.fold(id, id), isA<ServiceException>());
  });
}
