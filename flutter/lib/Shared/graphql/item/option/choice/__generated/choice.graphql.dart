import '../../../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$addChoice {
  factory Variables$Mutation$addChoice(
          {required Input$restaurant_choice_insert_input choice}) =>
      Variables$Mutation$addChoice._({
        r'choice': choice,
      });

  Variables$Mutation$addChoice._(this._$data);

  factory Variables$Mutation$addChoice.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$choice = data['choice'];
    result$data['choice'] = Input$restaurant_choice_insert_input.fromJson(
        (l$choice as Map<String, dynamic>));
    return Variables$Mutation$addChoice._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$restaurant_choice_insert_input get choice =>
      (_$data['choice'] as Input$restaurant_choice_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$choice = choice;
    result$data['choice'] = l$choice.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$addChoice<Variables$Mutation$addChoice>
      get copyWith => CopyWith$Variables$Mutation$addChoice(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addChoice) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$choice = choice;
    final lOther$choice = other.choice;
    if (l$choice != lOther$choice) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$choice = choice;
    return Object.hashAll([l$choice]);
  }
}

abstract class CopyWith$Variables$Mutation$addChoice<TRes> {
  factory CopyWith$Variables$Mutation$addChoice(
    Variables$Mutation$addChoice instance,
    TRes Function(Variables$Mutation$addChoice) then,
  ) = _CopyWithImpl$Variables$Mutation$addChoice;

  factory CopyWith$Variables$Mutation$addChoice.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addChoice;

  TRes call({Input$restaurant_choice_insert_input? choice});
}

class _CopyWithImpl$Variables$Mutation$addChoice<TRes>
    implements CopyWith$Variables$Mutation$addChoice<TRes> {
  _CopyWithImpl$Variables$Mutation$addChoice(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addChoice _instance;

  final TRes Function(Variables$Mutation$addChoice) _then;

  static const _undefined = {};

  TRes call({Object? choice = _undefined}) =>
      _then(Variables$Mutation$addChoice._({
        ..._instance._$data,
        if (choice != _undefined && choice != null)
          'choice': (choice as Input$restaurant_choice_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addChoice<TRes>
    implements CopyWith$Variables$Mutation$addChoice<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addChoice(this._res);

  TRes _res;

  call({Input$restaurant_choice_insert_input? choice}) => _res;
}

class Mutation$addChoice {
  Mutation$addChoice({
    this.insert_restaurant_choice_one,
    required this.$__typename,
  });

  factory Mutation$addChoice.fromJson(Map<String, dynamic> json) {
    final l$insert_restaurant_choice_one = json['insert_restaurant_choice_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addChoice(
      insert_restaurant_choice_one: l$insert_restaurant_choice_one == null
          ? null
          : Mutation$addChoice$insert_restaurant_choice_one.fromJson(
              (l$insert_restaurant_choice_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addChoice$insert_restaurant_choice_one?
      insert_restaurant_choice_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_restaurant_choice_one = insert_restaurant_choice_one;
    _resultData['insert_restaurant_choice_one'] =
        l$insert_restaurant_choice_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_restaurant_choice_one = insert_restaurant_choice_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_restaurant_choice_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addChoice) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_restaurant_choice_one = insert_restaurant_choice_one;
    final lOther$insert_restaurant_choice_one =
        other.insert_restaurant_choice_one;
    if (l$insert_restaurant_choice_one != lOther$insert_restaurant_choice_one) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$addChoice on Mutation$addChoice {
  CopyWith$Mutation$addChoice<Mutation$addChoice> get copyWith =>
      CopyWith$Mutation$addChoice(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$addChoice<TRes> {
  factory CopyWith$Mutation$addChoice(
    Mutation$addChoice instance,
    TRes Function(Mutation$addChoice) then,
  ) = _CopyWithImpl$Mutation$addChoice;

  factory CopyWith$Mutation$addChoice.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addChoice;

  TRes call({
    Mutation$addChoice$insert_restaurant_choice_one?
        insert_restaurant_choice_one,
    String? $__typename,
  });
  CopyWith$Mutation$addChoice$insert_restaurant_choice_one<TRes>
      get insert_restaurant_choice_one;
}

class _CopyWithImpl$Mutation$addChoice<TRes>
    implements CopyWith$Mutation$addChoice<TRes> {
  _CopyWithImpl$Mutation$addChoice(
    this._instance,
    this._then,
  );

  final Mutation$addChoice _instance;

  final TRes Function(Mutation$addChoice) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_restaurant_choice_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addChoice(
        insert_restaurant_choice_one: insert_restaurant_choice_one == _undefined
            ? _instance.insert_restaurant_choice_one
            : (insert_restaurant_choice_one
                as Mutation$addChoice$insert_restaurant_choice_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addChoice$insert_restaurant_choice_one<TRes>
      get insert_restaurant_choice_one {
    final local$insert_restaurant_choice_one =
        _instance.insert_restaurant_choice_one;
    return local$insert_restaurant_choice_one == null
        ? CopyWith$Mutation$addChoice$insert_restaurant_choice_one.stub(
            _then(_instance))
        : CopyWith$Mutation$addChoice$insert_restaurant_choice_one(
            local$insert_restaurant_choice_one,
            (e) => call(insert_restaurant_choice_one: e));
  }
}

class _CopyWithStubImpl$Mutation$addChoice<TRes>
    implements CopyWith$Mutation$addChoice<TRes> {
  _CopyWithStubImpl$Mutation$addChoice(this._res);

  TRes _res;

  call({
    Mutation$addChoice$insert_restaurant_choice_one?
        insert_restaurant_choice_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addChoice$insert_restaurant_choice_one<TRes>
      get insert_restaurant_choice_one =>
          CopyWith$Mutation$addChoice$insert_restaurant_choice_one.stub(_res);
}

const documentNodeMutationaddChoice = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addChoice'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'choice')),
        type: NamedTypeNode(
          name: NameNode(value: 'restaurant_choice_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_restaurant_choice_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'choice')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      
    ]),
  ),
]);
Mutation$addChoice _parserFn$Mutation$addChoice(Map<String, dynamic> data) =>
    Mutation$addChoice.fromJson(data);
typedef OnMutationCompleted$Mutation$addChoice = FutureOr<void> Function(
  dynamic,
  Mutation$addChoice?,
);

class Options$Mutation$addChoice
    extends graphql.MutationOptions<Mutation$addChoice> {
  Options$Mutation$addChoice({
    String? operationName,
    required Variables$Mutation$addChoice variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addChoice? onCompleted,
    graphql.OnMutationUpdate<Mutation$addChoice>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$addChoice(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddChoice,
          parserFn: _parserFn$Mutation$addChoice,
        );

  final OnMutationCompleted$Mutation$addChoice? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addChoice
    extends graphql.WatchQueryOptions<Mutation$addChoice> {
  WatchOptions$Mutation$addChoice({
    String? operationName,
    required Variables$Mutation$addChoice variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeMutationaddChoice,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addChoice,
        );
}

extension ClientExtension$Mutation$addChoice on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addChoice>> mutate$addChoice(
          Options$Mutation$addChoice options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$addChoice> watchMutation$addChoice(
          WatchOptions$Mutation$addChoice options) =>
      this.watchMutation(options);
}

class Mutation$addChoice$insert_restaurant_choice_one {
  Mutation$addChoice$insert_restaurant_choice_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$addChoice$insert_restaurant_choice_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$addChoice$insert_restaurant_choice_one(
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addChoice$insert_restaurant_choice_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$addChoice$insert_restaurant_choice_one
    on Mutation$addChoice$insert_restaurant_choice_one {
  CopyWith$Mutation$addChoice$insert_restaurant_choice_one<
          Mutation$addChoice$insert_restaurant_choice_one>
      get copyWith => CopyWith$Mutation$addChoice$insert_restaurant_choice_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addChoice$insert_restaurant_choice_one<TRes> {
  factory CopyWith$Mutation$addChoice$insert_restaurant_choice_one(
    Mutation$addChoice$insert_restaurant_choice_one instance,
    TRes Function(Mutation$addChoice$insert_restaurant_choice_one) then,
  ) = _CopyWithImpl$Mutation$addChoice$insert_restaurant_choice_one;

  factory CopyWith$Mutation$addChoice$insert_restaurant_choice_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addChoice$insert_restaurant_choice_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addChoice$insert_restaurant_choice_one<TRes>
    implements CopyWith$Mutation$addChoice$insert_restaurant_choice_one<TRes> {
  _CopyWithImpl$Mutation$addChoice$insert_restaurant_choice_one(
    this._instance,
    this._then,
  );

  final Mutation$addChoice$insert_restaurant_choice_one _instance;

  final TRes Function(Mutation$addChoice$insert_restaurant_choice_one) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addChoice$insert_restaurant_choice_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addChoice$insert_restaurant_choice_one<TRes>
    implements CopyWith$Mutation$addChoice$insert_restaurant_choice_one<TRes> {
  _CopyWithStubImpl$Mutation$addChoice$insert_restaurant_choice_one(this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}
