import '../../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$addOption {
  factory Variables$Mutation$addOption(
          {required Input$restaurant_option_insert_input option}) =>
      Variables$Mutation$addOption._({
        r'option': option,
      });

  Variables$Mutation$addOption._(this._$data);

  factory Variables$Mutation$addOption.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$option = data['option'];
    result$data['option'] = Input$restaurant_option_insert_input.fromJson(
        (l$option as Map<String, dynamic>));
    return Variables$Mutation$addOption._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$restaurant_option_insert_input get option =>
      (_$data['option'] as Input$restaurant_option_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$option = option;
    result$data['option'] = l$option.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$addOption<Variables$Mutation$addOption>
      get copyWith => CopyWith$Variables$Mutation$addOption(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addOption) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$option = option;
    final lOther$option = other.option;
    if (l$option != lOther$option) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$option = option;
    return Object.hashAll([l$option]);
  }
}

abstract class CopyWith$Variables$Mutation$addOption<TRes> {
  factory CopyWith$Variables$Mutation$addOption(
    Variables$Mutation$addOption instance,
    TRes Function(Variables$Mutation$addOption) then,
  ) = _CopyWithImpl$Variables$Mutation$addOption;

  factory CopyWith$Variables$Mutation$addOption.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addOption;

  TRes call({Input$restaurant_option_insert_input? option});
}

class _CopyWithImpl$Variables$Mutation$addOption<TRes>
    implements CopyWith$Variables$Mutation$addOption<TRes> {
  _CopyWithImpl$Variables$Mutation$addOption(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addOption _instance;

  final TRes Function(Variables$Mutation$addOption) _then;

  static const _undefined = {};

  TRes call({Object? option = _undefined}) =>
      _then(Variables$Mutation$addOption._({
        ..._instance._$data,
        if (option != _undefined && option != null)
          'option': (option as Input$restaurant_option_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addOption<TRes>
    implements CopyWith$Variables$Mutation$addOption<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addOption(this._res);

  TRes _res;

  call({Input$restaurant_option_insert_input? option}) => _res;
}

class Mutation$addOption {
  Mutation$addOption({
    this.insert_restaurant_option_one,
    required this.$__typename,
  });

  factory Mutation$addOption.fromJson(Map<String, dynamic> json) {
    final l$insert_restaurant_option_one = json['insert_restaurant_option_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addOption(
      insert_restaurant_option_one: l$insert_restaurant_option_one == null
          ? null
          : Mutation$addOption$insert_restaurant_option_one.fromJson(
              (l$insert_restaurant_option_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addOption$insert_restaurant_option_one?
      insert_restaurant_option_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_restaurant_option_one = insert_restaurant_option_one;
    _resultData['insert_restaurant_option_one'] =
        l$insert_restaurant_option_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_restaurant_option_one = insert_restaurant_option_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_restaurant_option_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addOption) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_restaurant_option_one = insert_restaurant_option_one;
    final lOther$insert_restaurant_option_one =
        other.insert_restaurant_option_one;
    if (l$insert_restaurant_option_one != lOther$insert_restaurant_option_one) {
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

extension UtilityExtension$Mutation$addOption on Mutation$addOption {
  CopyWith$Mutation$addOption<Mutation$addOption> get copyWith =>
      CopyWith$Mutation$addOption(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$addOption<TRes> {
  factory CopyWith$Mutation$addOption(
    Mutation$addOption instance,
    TRes Function(Mutation$addOption) then,
  ) = _CopyWithImpl$Mutation$addOption;

  factory CopyWith$Mutation$addOption.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addOption;

  TRes call({
    Mutation$addOption$insert_restaurant_option_one?
        insert_restaurant_option_one,
    String? $__typename,
  });
  CopyWith$Mutation$addOption$insert_restaurant_option_one<TRes>
      get insert_restaurant_option_one;
}

class _CopyWithImpl$Mutation$addOption<TRes>
    implements CopyWith$Mutation$addOption<TRes> {
  _CopyWithImpl$Mutation$addOption(
    this._instance,
    this._then,
  );

  final Mutation$addOption _instance;

  final TRes Function(Mutation$addOption) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_restaurant_option_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addOption(
        insert_restaurant_option_one: insert_restaurant_option_one == _undefined
            ? _instance.insert_restaurant_option_one
            : (insert_restaurant_option_one
                as Mutation$addOption$insert_restaurant_option_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addOption$insert_restaurant_option_one<TRes>
      get insert_restaurant_option_one {
    final local$insert_restaurant_option_one =
        _instance.insert_restaurant_option_one;
    return local$insert_restaurant_option_one == null
        ? CopyWith$Mutation$addOption$insert_restaurant_option_one.stub(
            _then(_instance))
        : CopyWith$Mutation$addOption$insert_restaurant_option_one(
            local$insert_restaurant_option_one,
            (e) => call(insert_restaurant_option_one: e));
  }
}

class _CopyWithStubImpl$Mutation$addOption<TRes>
    implements CopyWith$Mutation$addOption<TRes> {
  _CopyWithStubImpl$Mutation$addOption(this._res);

  TRes _res;

  call({
    Mutation$addOption$insert_restaurant_option_one?
        insert_restaurant_option_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addOption$insert_restaurant_option_one<TRes>
      get insert_restaurant_option_one =>
          CopyWith$Mutation$addOption$insert_restaurant_option_one.stub(_res);
}

const documentNodeMutationaddOption = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addOption'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'option')),
        type: NamedTypeNode(
          name: NameNode(value: 'restaurant_option_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_restaurant_option_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'option')),
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
Mutation$addOption _parserFn$Mutation$addOption(Map<String, dynamic> data) =>
    Mutation$addOption.fromJson(data);
typedef OnMutationCompleted$Mutation$addOption = FutureOr<void> Function(
  dynamic,
  Mutation$addOption?,
);

class Options$Mutation$addOption
    extends graphql.MutationOptions<Mutation$addOption> {
  Options$Mutation$addOption({
    String? operationName,
    required Variables$Mutation$addOption variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addOption? onCompleted,
    graphql.OnMutationUpdate<Mutation$addOption>? update,
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
                    data == null ? null : _parserFn$Mutation$addOption(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddOption,
          parserFn: _parserFn$Mutation$addOption,
        );

  final OnMutationCompleted$Mutation$addOption? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addOption
    extends graphql.WatchQueryOptions<Mutation$addOption> {
  WatchOptions$Mutation$addOption({
    String? operationName,
    required Variables$Mutation$addOption variables,
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
          document: documentNodeMutationaddOption,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addOption,
        );
}

extension ClientExtension$Mutation$addOption on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addOption>> mutate$addOption(
          Options$Mutation$addOption options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$addOption> watchMutation$addOption(
          WatchOptions$Mutation$addOption options) =>
      this.watchMutation(options);
}

class Mutation$addOption$insert_restaurant_option_one {
  Mutation$addOption$insert_restaurant_option_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$addOption$insert_restaurant_option_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$addOption$insert_restaurant_option_one(
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
    if (!(other is Mutation$addOption$insert_restaurant_option_one) ||
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

extension UtilityExtension$Mutation$addOption$insert_restaurant_option_one
    on Mutation$addOption$insert_restaurant_option_one {
  CopyWith$Mutation$addOption$insert_restaurant_option_one<
          Mutation$addOption$insert_restaurant_option_one>
      get copyWith => CopyWith$Mutation$addOption$insert_restaurant_option_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addOption$insert_restaurant_option_one<TRes> {
  factory CopyWith$Mutation$addOption$insert_restaurant_option_one(
    Mutation$addOption$insert_restaurant_option_one instance,
    TRes Function(Mutation$addOption$insert_restaurant_option_one) then,
  ) = _CopyWithImpl$Mutation$addOption$insert_restaurant_option_one;

  factory CopyWith$Mutation$addOption$insert_restaurant_option_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addOption$insert_restaurant_option_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addOption$insert_restaurant_option_one<TRes>
    implements CopyWith$Mutation$addOption$insert_restaurant_option_one<TRes> {
  _CopyWithImpl$Mutation$addOption$insert_restaurant_option_one(
    this._instance,
    this._then,
  );

  final Mutation$addOption$insert_restaurant_option_one _instance;

  final TRes Function(Mutation$addOption$insert_restaurant_option_one) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addOption$insert_restaurant_option_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addOption$insert_restaurant_option_one<TRes>
    implements CopyWith$Mutation$addOption$insert_restaurant_option_one<TRes> {
  _CopyWithStubImpl$Mutation$addOption$insert_restaurant_option_one(this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}
