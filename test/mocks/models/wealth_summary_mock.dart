import 'package:flutter_profit_summary_card/app/models/wealth_summary.dart';

class WealthSummaryMock {
  static final WealthSummary wealthSummary = WealthSummary(
    cdi: 35.326,
    gain: 185.656,
    hasHistory: false,
    id: 1,
    profitability: 135.56,
    total: 134536.65,
  ); 

  static final Map<String, dynamic> jsonData = {
    'cdi': 35.326,
    'gain': 185.656,
    'hasHistory': false,
    'id': 1,
    'profitability': 135.56,
    'total': 134536.65
  };

  static final List<WealthSummary> wealthSummaries = [
    WealthSummary(
      cdi: 1.333,
      gain: 85.636,
      hasHistory: false,
      id: 1,
      profitability: 345.56,
      total: 4256.65,
    ),
    WealthSummary(
      cdi: 33.532,
      gain: 43.54,
      hasHistory: true,
      id: 2,
      profitability: 853.89,
      total: 4378.65,
    ),
    WealthSummary(
      cdi: 90.326,
      gain: 7.656,
      hasHistory: true,
      id: 3,
      profitability: 9.56,
      total: 643.65,
    )
  ];

  static final List<dynamic> wealthSummariesJson = [
    {
      'cdi': 1.333,
      'gain': 85.636,
      'hasHistory': false,
      'id': 1,
      'profitability': 345.56,
      'total': 4256.65
    },
    {
      'cdi': 33.532,
      'gain': 43.54,
      'hasHistory': true,
      'id': 2,
      'profitability': 853.89,
      'total': 4378.65,
    },
    {
      'cdi': 90.326,
      'gain': 7.656,
      'hasHistory': true,
      'id': 3,
      'profitability': 9.56,
      'total': 643.65,
    }
  ];
}
