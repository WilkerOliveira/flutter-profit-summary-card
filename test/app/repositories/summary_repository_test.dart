import 'package:dartz/dartz.dart';
import 'package:flutter_profit_summary_card/app/exceptions/service_exception.dart';
import 'package:flutter_profit_summary_card/app/repositories/summary_repository.dart';
import 'package:flutter_profit_summary_card/app/repositories/summary_repository_impl.dart';
import 'package:flutter_profit_summary_card/app/services/graphqi_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

import '../../mocks/models/wealth_summary_mock.dart';
import '../../mocks/services/grapthqi_service_mock.dart';

void main() {
  GraphQIService? service;
  SummaryRepository? repository;

  setUp(() {
    service = GraphQIServiceMock();
    repository = SummaryRepositoryImpl(service!);

    when(() => service?.consultSummaries()).thenAnswer(
      (_) async => Future.value(
        Right(WealthSummaryMock.wealthSummariesJson),
      ),
    );
  });

  test('Should return a WealthSummary list', () async {
    var response = await repository?.consultSummaries();

    expect(response?.fold(id, id), isA<List>());
  });

  test('Should return a Service Exception', () async {
    when(() => service?.consultSummaries()).thenAnswer(
      (_) async => Future.value(
        Left(ServiceException()),
      ),
    );

    var response = await repository?.consultSummaries();

    expect(response?.fold(id, id), isA<ServiceException>());
  });
}
