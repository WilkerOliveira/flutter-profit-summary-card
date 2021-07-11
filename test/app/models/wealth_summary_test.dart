import 'package:flutter_profit_summary_card/app/models/wealth_summary.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/models/wealth_summary_mock.dart';

void main() {
  test("Should load WealthSummary class with JSON data", () {
    var data = WealthSummary.fromJson(WealthSummaryMock.jsonData);

    expect(data.cdi, equals(35.326));
    expect(data.hasHistory, equals(false));
    expect(data.total, equals(134536.65));
  });

  test("Should return a JSON Map from WealthSummary class", () {
    var json = WealthSummaryMock.wealthSummary.toJson();

    expect(json.length, equals(6));
    expect(json["id"], equals(1));
  });
}
