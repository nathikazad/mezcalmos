import 'package:graphql/client.dart';
import 'package:gql/ast.dart';

class HasuraHelper {
  late final GraphQLClient graphQLClient;

  HasuraHelper() {
    final Link _link = HttpLink(
      'https://mezcalmos.hasura.app/v1/graphql',
      defaultHeaders: {
        // 'Authorization': 'Bearer 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',
        "x-hasura-admin-secret":
            "BGnr9cpGF42t09PccsyzeJADS1UPmZ4I_QiSY4mmPMTYcsgn5m2BrkPFR4r6gs3KEzMGOXwukjBwhWQ26_ikpMw"
      },
    );
    this.graphQLClient = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
    ;
  }

  Future<QueryResult> get(
      DocumentNode documentNode, Map<String, dynamic> variables) {
    final QueryOptions options =
        QueryOptions(document: documentNode, variables: variables);

    return this.graphQLClient.query(options);
  }
}
