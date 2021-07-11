class WealthSummary {
  double cdi = 0.0;
  double gain = 0.0;
  bool hasHistory = false;
  int id = 0;
  double profitability = 0.0;
  double total = 0.0;

  WealthSummary({
    required this.cdi,
    required this.gain,
    required this.hasHistory,
    required this.id,
    required this.profitability,
    required this.total,
  });

  WealthSummary.fromJson(Map<String, dynamic> json) {
    cdi = json['cdi'].toDouble();
    gain = json['gain'].toDouble();
    hasHistory = json['hasHistory'];
    id = json['id'];
    profitability = json['profitability'].toDouble();
    total = json['total'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cdi'] = this.cdi;
    data['gain'] = this.gain;
    data['hasHistory'] = this.hasHistory;
    data['id'] = this.id;
    data['profitability'] = this.profitability;
    data['total'] = this.total;
    return data;
  }
}
