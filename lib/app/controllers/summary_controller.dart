import 'package:flutter_profit_summary_card/app/common/resources/app_strings.dart';
import 'package:flutter_profit_summary_card/app/controllers/base/base_controller.dart';
import 'package:flutter_profit_summary_card/app/core/use_cases/summary_usecase.dart';
import 'package:flutter_profit_summary_card/app/models/wealth_summary.dart';
import 'package:mobx/mobx.dart';

part 'summary_controller.g.dart';

class SummaryController = _SummaryBaseController with _$SummaryController;

abstract class _SummaryBaseController extends BaseController with Store {
  final SummaryUseCase useCase;
  int _index = -1;
  List<WealthSummary>? _summaries;

  @observable
  WealthSummary? currentSummary;

  @observable
  bool isFirstSummary = true;

  _SummaryBaseController(this.useCase);

  Future<void> loadSummaries() async {
    try {
      setState(ViewState.Busy);
      var summaries = await useCase.consultSummaries();

      summaries.fold((failure) {
        super.showWarningMessage(AppStrings.oopsException);
      }, (summaries) {
        _summaries = summaries;
        getNextSummary();
      });
    } finally {
      setState(ViewState.Idle);
    }
  }

  @action
  void getNextSummary() {
    if (this._summaries != null && this._summaries!.length > this._index) {
      this._index++;
      _updateCurrentSummary();
    }
  }

  void onPopupItemSelected() {
    this._index = 0;
    _updateCurrentSummary();
  }

  @action
  void backSummary() {
    if (this._index > 0) {
      this._index--;
      _updateCurrentSummary();
    }
  }

  void _updateCurrentSummary() {
    this.currentSummary = this._summaries?[this._index];
    this.isFirstSummary = this._index <= 0;
  }
}
