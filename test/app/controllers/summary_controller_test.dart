import 'package:dartz/dartz.dart';
import 'package:flutter_profit_summary_card/app/controllers/summary_controller.dart';
import 'package:flutter_profit_summary_card/app/core/use_cases/summary_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/core/use_cases/summary_usecase_mock.dart';
import '../../mocks/models/wealth_summary_mock.dart';

void main() {
  SummaryController? controller;
  SummaryUseCase? useCase;

  setUp(() {
    useCase = SummaryUseCaseMock();
    controller = SummaryController(useCase!);

    when(() => useCase?.consultSummaries()).thenAnswer(
      (_) async => Future.value(
        Right(WealthSummaryMock.wealthSummaries),
      ),
    );
  });

  test('Should load a Current Summary', () async {
    await controller?.loadSummaries();

    expect(controller?.currentSummary, isNot(equals(null)));
  });

  test('Should set isFirstSummary with true', () async {
    await controller?.loadSummaries();

    expect(controller?.isFirstSummary, equals(true));
  });

  test('Should load Next Summary', () async {
    await controller?.loadSummaries();
    controller?.getNextSummary();

    expect(controller?.currentSummary?.id, equals(2));
  });

  test('Should set isFirstSummary with false', () async {
    await controller?.loadSummaries();
    controller?.getNextSummary();
    expect(controller?.isFirstSummary, equals(false));
  });

  test('Should return to First Summary', () async {
    await controller?.loadSummaries();

    controller?.onPopupItemSelected();

    expect(controller?.isFirstSummary, equals(true));
  });

  test('Should return to last summary selected', () async {
    await controller?.loadSummaries();
    expect(controller?.currentSummary?.id, equals(1));
    controller?.getNextSummary();
    expect(controller?.currentSummary?.id, equals(2));
    controller?.backSummary();
    expect(controller?.currentSummary?.id, equals(1));
  });
}
