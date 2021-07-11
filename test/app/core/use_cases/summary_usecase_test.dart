import 'package:dartz/dartz.dart';
import 'package:flutter_profit_summary_card/app/core/use_cases/summary_usecase.dart';
import 'package:flutter_profit_summary_card/app/core/use_cases/summary_usecase_impl.dart';
import 'package:flutter_profit_summary_card/app/exceptions/service_exception.dart';
import 'package:flutter_profit_summary_card/app/repositories/summary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/models/wealth_summary_mock.dart';
import '../../../mocks/repository/summary_repository_mock.dart';

void main() {
  SummaryUseCase? useCase;
  SummaryRepository? repository;

  setUp(() {
    repository = SummaryRepositoryMock();
    useCase = SummaryUseCaseImpl(repository!);

    when(() => repository?.consultSummaries()).thenAnswer(
      (_) async => Future.value(
        Right(WealthSummaryMock.wealthSummaries),
      ),
    );
  });

  test('Should return a WealthSummary list', () async {
    var response = await useCase?.consultSummaries();

    expect(response?.fold(id, id), isA<List>());
  });

  test('Should return a Service Exception', () async {
    when(() => repository?.consultSummaries()).thenAnswer(
      (_) async => Future.value(
        Left(ServiceException()),
      ),
    );

    var response = await useCase?.consultSummaries();

    expect(response?.fold(id, id), isA<ServiceException>());
  });
}
