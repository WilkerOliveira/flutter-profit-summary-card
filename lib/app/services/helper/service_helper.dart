abstract class ServiceHelper {
  static final String endpoint =
      "https://harura-fliper-test.herokuapp.com/v1/graphql";

  static final String query = r'''
  query MyQuery {
    wealthSummary {
      cdi
      gain
      hasHistory
      id
      profitability
      total
    }
  }
  ''';

  static final String header = "x-hasura-admin-secret";
  static final String token = "fliperdevtest2020";
  static final String summaryData = "wealthSummary";
}
