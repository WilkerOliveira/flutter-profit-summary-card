import 'package:flutter_profit_summary_card/app/services/helper/service_helper.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class GraphQIConfig {
  static GraphQLClient init() {
    return GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(
        ServiceHelper.endpoint,
        defaultHeaders: {
          ServiceHelper.header: ServiceHelper.token,
        },
      ),
    );
  }
}
