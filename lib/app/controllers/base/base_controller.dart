import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_profit_summary_card/app/common/resources/app_colors.dart';

import 'package:mobx/mobx.dart';

part "base_controller.g.dart";

/// Represents the state of the view
enum ViewState { Idle, Busy }

class BaseController = _BaseControllerBase with _$BaseController;

abstract class _BaseControllerBase with Store {
  @protected
  BuildContext? context;

  set currentContext(BuildContext context) {
    this.context = context;
  }

  @observable
  ViewState _state = ViewState.Idle;

  ViewState get viewState => this._state;

  @computed
  bool get isLoading => this._state == ViewState.Busy;

  @protected
  bool error = false;
  @protected
  bool alert = false;

  String errorMessage = "";
  bool isEditing = false;
  bool get isError => error;
  bool get isAlert => alert;

  @action
  void setState(ViewState viewState) {
    _state = viewState;
  }

  void logError(ex) {
    print(ex.toString());
  }

  void showErrorMessage(message) {
    asuka.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

  void showWarningMessage(message) {
    asuka.showSnackBar(
      SnackBar(
        backgroundColor: Colors.yellow,
        content: Text(
          message,
          style: TextStyle(color: AppColors.snackBarTextColor),
        ),
      ),
    );
  }

  void showInfoMessage(message) {
    asuka.showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(message),
      ),
    );
  }

  void showSuccessMessage(message) {
    asuka.showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(message),
      ),
    );
  }
}
