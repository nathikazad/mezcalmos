import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$updateTranslationValue {
  factory Variables$Mutation$updateTranslationValue({
    required Input$translation_value_pk_columns_input arguments,
    required Input$translation_value_set_input data,
  }) =>
      Variables$Mutation$updateTranslationValue._({
        r'arguments': arguments,
        r'data': data,
      });

  Variables$Mutation$updateTranslationValue._(this._$data);

  factory Variables$Mutation$updateTranslationValue.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$arguments = data['arguments'];
    result$data['arguments'] =
        Input$translation_value_pk_columns_input.fromJson(
            (l$arguments as Map<String, dynamic>));
    final l$data = data['data'];
    result$data['data'] = Input$translation_value_set_input.fromJson(
        (l$data as Map<String, dynamic>));
    return Variables$Mutation$updateTranslationValue._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$translation_value_pk_columns_input get arguments =>
      (_$data['arguments'] as Input$translation_value_pk_columns_input);
  Input$translation_value_set_input get data =>
      (_$data['data'] as Input$translation_value_set_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$arguments = arguments;
    result$data['arguments'] = l$arguments.toJson();
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateTranslationValue<
          Variables$Mutation$updateTranslationValue>
      get copyWith => CopyWith$Variables$Mutation$updateTranslationValue(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateTranslationValue) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$arguments = arguments;
    final lOther$arguments = other.arguments;
    if (l$arguments != lOther$arguments) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$arguments = arguments;
    final l$data = data;
    return Object.hashAll([
      l$arguments,
      l$data,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateTranslationValue<TRes> {
  factory CopyWith$Variables$Mutation$updateTranslationValue(
    Variables$Mutation$updateTranslationValue instance,
    TRes Function(Variables$Mutation$updateTranslationValue) then,
  ) = _CopyWithImpl$Variables$Mutation$updateTranslationValue;

  factory CopyWith$Variables$Mutation$updateTranslationValue.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateTranslationValue;

  TRes call({
    Input$translation_value_pk_columns_input? arguments,
    Input$translation_value_set_input? data,
  });
}

class _CopyWithImpl$Variables$Mutation$updateTranslationValue<TRes>
    implements CopyWith$Variables$Mutation$updateTranslationValue<TRes> {
  _CopyWithImpl$Variables$Mutation$updateTranslationValue(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateTranslationValue _instance;

  final TRes Function(Variables$Mutation$updateTranslationValue) _then;

  static const _undefined = {};

  TRes call({
    Object? arguments = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateTranslationValue._({
        ..._instance._$data,
        if (arguments != _undefined && arguments != null)
          'arguments': (arguments as Input$translation_value_pk_columns_input),
        if (data != _undefined && data != null)
          'data': (data as Input$translation_value_set_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateTranslationValue<TRes>
    implements CopyWith$Variables$Mutation$updateTranslationValue<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateTranslationValue(this._res);

  TRes _res;

  call({
    Input$translation_value_pk_columns_input? arguments,
    Input$translation_value_set_input? data,
  }) =>
      _res;
}

class Mutation$updateTranslationValue {
  Mutation$updateTranslationValue({
    this.update_translation_value_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateTranslationValue.fromJson(Map<String, dynamic> json) {
    final l$update_translation_value_by_pk =
        json['update_translation_value_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateTranslationValue(
      update_translation_value_by_pk: l$update_translation_value_by_pk == null
          ? null
          : Mutation$updateTranslationValue$update_translation_value_by_pk
              .fromJson(
                  (l$update_translation_value_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateTranslationValue$update_translation_value_by_pk?
      update_translation_value_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_translation_value_by_pk = update_translation_value_by_pk;
    _resultData['update_translation_value_by_pk'] =
        l$update_translation_value_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_translation_value_by_pk = update_translation_value_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_translation_value_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateTranslationValue) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_translation_value_by_pk = update_translation_value_by_pk;
    final lOther$update_translation_value_by_pk =
        other.update_translation_value_by_pk;
    if (l$update_translation_value_by_pk !=
        lOther$update_translation_value_by_pk) {
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

extension UtilityExtension$Mutation$updateTranslationValue
    on Mutation$updateTranslationValue {
  CopyWith$Mutation$updateTranslationValue<Mutation$updateTranslationValue>
      get copyWith => CopyWith$Mutation$updateTranslationValue(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateTranslationValue<TRes> {
  factory CopyWith$Mutation$updateTranslationValue(
    Mutation$updateTranslationValue instance,
    TRes Function(Mutation$updateTranslationValue) then,
  ) = _CopyWithImpl$Mutation$updateTranslationValue;

  factory CopyWith$Mutation$updateTranslationValue.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateTranslationValue;

  TRes call({
    Mutation$updateTranslationValue$update_translation_value_by_pk?
        update_translation_value_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateTranslationValue$update_translation_value_by_pk<TRes>
      get update_translation_value_by_pk;
}

class _CopyWithImpl$Mutation$updateTranslationValue<TRes>
    implements CopyWith$Mutation$updateTranslationValue<TRes> {
  _CopyWithImpl$Mutation$updateTranslationValue(
    this._instance,
    this._then,
  );

  final Mutation$updateTranslationValue _instance;

  final TRes Function(Mutation$updateTranslationValue) _then;

  static const _undefined = {};

  TRes call({
    Object? update_translation_value_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateTranslationValue(
        update_translation_value_by_pk: update_translation_value_by_pk ==
                _undefined
            ? _instance.update_translation_value_by_pk
            : (update_translation_value_by_pk
                as Mutation$updateTranslationValue$update_translation_value_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateTranslationValue$update_translation_value_by_pk<TRes>
      get update_translation_value_by_pk {
    final local$update_translation_value_by_pk =
        _instance.update_translation_value_by_pk;
    return local$update_translation_value_by_pk == null
        ? CopyWith$Mutation$updateTranslationValue$update_translation_value_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateTranslationValue$update_translation_value_by_pk(
            local$update_translation_value_by_pk,
            (e) => call(update_translation_value_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateTranslationValue<TRes>
    implements CopyWith$Mutation$updateTranslationValue<TRes> {
  _CopyWithStubImpl$Mutation$updateTranslationValue(this._res);

  TRes _res;

  call({
    Mutation$updateTranslationValue$update_translation_value_by_pk?
        update_translation_value_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateTranslationValue$update_translation_value_by_pk<TRes>
      get update_translation_value_by_pk =>
          CopyWith$Mutation$updateTranslationValue$update_translation_value_by_pk
              .stub(_res);
}

const documentNodeMutationupdateTranslationValue = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateTranslationValue'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'arguments')),
        type: NamedTypeNode(
          name: NameNode(value: 'translation_value_pk_columns_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'data')),
        type: NamedTypeNode(
          name: NameNode(value: 'translation_value_set_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_translation_value_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: VariableNode(name: NameNode(value: 'arguments')),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'data')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'value'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'language_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'translation_id'),
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
Mutation$updateTranslationValue _parserFn$Mutation$updateTranslationValue(
        Map<String, dynamic> data) =>
    Mutation$updateTranslationValue.fromJson(data);
typedef OnMutationCompleted$Mutation$updateTranslationValue = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateTranslationValue?,
);

class Options$Mutation$updateTranslationValue
    extends graphql.MutationOptions<Mutation$updateTranslationValue> {
  Options$Mutation$updateTranslationValue({
    String? operationName,
    required Variables$Mutation$updateTranslationValue variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateTranslationValue? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateTranslationValue>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$updateTranslationValue(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateTranslationValue,
          parserFn: _parserFn$Mutation$updateTranslationValue,
        );

  final OnMutationCompleted$Mutation$updateTranslationValue?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateTranslationValue
    extends graphql.WatchQueryOptions<Mutation$updateTranslationValue> {
  WatchOptions$Mutation$updateTranslationValue({
    String? operationName,
    required Variables$Mutation$updateTranslationValue variables,
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
          document: documentNodeMutationupdateTranslationValue,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateTranslationValue,
        );
}

extension ClientExtension$Mutation$updateTranslationValue
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateTranslationValue>>
      mutate$updateTranslationValue(
              Options$Mutation$updateTranslationValue options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateTranslationValue>
      watchMutation$updateTranslationValue(
              WatchOptions$Mutation$updateTranslationValue options) =>
          this.watchMutation(options);
}

class Mutation$updateTranslationValue$update_translation_value_by_pk {
  Mutation$updateTranslationValue$update_translation_value_by_pk({
    required this.value,
    required this.language_id,
    required this.translation_id,
    required this.$__typename,
  });

  factory Mutation$updateTranslationValue$update_translation_value_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$value = json['value'];
    final l$language_id = json['language_id'];
    final l$translation_id = json['translation_id'];
    final l$$__typename = json['__typename'];
    return Mutation$updateTranslationValue$update_translation_value_by_pk(
      value: (l$value as String),
      language_id: (l$language_id as String),
      translation_id: (l$translation_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String value;

  final String language_id;

  final int translation_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$value = value;
    _resultData['value'] = l$value;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$translation_id = translation_id;
    _resultData['translation_id'] = l$translation_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$value = value;
    final l$language_id = language_id;
    final l$translation_id = translation_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$value,
      l$language_id,
      l$translation_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateTranslationValue$update_translation_value_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$translation_id = translation_id;
    final lOther$translation_id = other.translation_id;
    if (l$translation_id != lOther$translation_id) {
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

extension UtilityExtension$Mutation$updateTranslationValue$update_translation_value_by_pk
    on Mutation$updateTranslationValue$update_translation_value_by_pk {
  CopyWith$Mutation$updateTranslationValue$update_translation_value_by_pk<
          Mutation$updateTranslationValue$update_translation_value_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateTranslationValue$update_translation_value_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateTranslationValue$update_translation_value_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateTranslationValue$update_translation_value_by_pk(
    Mutation$updateTranslationValue$update_translation_value_by_pk instance,
    TRes Function(
            Mutation$updateTranslationValue$update_translation_value_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateTranslationValue$update_translation_value_by_pk;

  factory CopyWith$Mutation$updateTranslationValue$update_translation_value_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateTranslationValue$update_translation_value_by_pk;

  TRes call({
    String? value,
    String? language_id,
    int? translation_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateTranslationValue$update_translation_value_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateTranslationValue$update_translation_value_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateTranslationValue$update_translation_value_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateTranslationValue$update_translation_value_by_pk
      _instance;

  final TRes Function(
      Mutation$updateTranslationValue$update_translation_value_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? value = _undefined,
    Object? language_id = _undefined,
    Object? translation_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateTranslationValue$update_translation_value_by_pk(
        value: value == _undefined || value == null
            ? _instance.value
            : (value as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        translation_id: translation_id == _undefined || translation_id == null
            ? _instance.translation_id
            : (translation_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateTranslationValue$update_translation_value_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateTranslationValue$update_translation_value_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateTranslationValue$update_translation_value_by_pk(
      this._res);

  TRes _res;

  call({
    String? value,
    String? language_id,
    int? translation_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$insertTranslationValue {
  factory Variables$Mutation$insertTranslationValue(
          {required Input$translation_insert_input data}) =>
      Variables$Mutation$insertTranslationValue._({
        r'data': data,
      });

  Variables$Mutation$insertTranslationValue._(this._$data);

  factory Variables$Mutation$insertTranslationValue.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$data = data['data'];
    result$data['data'] = Input$translation_insert_input.fromJson(
        (l$data as Map<String, dynamic>));
    return Variables$Mutation$insertTranslationValue._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$translation_insert_input get data =>
      (_$data['data'] as Input$translation_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$insertTranslationValue<
          Variables$Mutation$insertTranslationValue>
      get copyWith => CopyWith$Variables$Mutation$insertTranslationValue(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$insertTranslationValue) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$data = data;
    return Object.hashAll([l$data]);
  }
}

abstract class CopyWith$Variables$Mutation$insertTranslationValue<TRes> {
  factory CopyWith$Variables$Mutation$insertTranslationValue(
    Variables$Mutation$insertTranslationValue instance,
    TRes Function(Variables$Mutation$insertTranslationValue) then,
  ) = _CopyWithImpl$Variables$Mutation$insertTranslationValue;

  factory CopyWith$Variables$Mutation$insertTranslationValue.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$insertTranslationValue;

  TRes call({Input$translation_insert_input? data});
}

class _CopyWithImpl$Variables$Mutation$insertTranslationValue<TRes>
    implements CopyWith$Variables$Mutation$insertTranslationValue<TRes> {
  _CopyWithImpl$Variables$Mutation$insertTranslationValue(
    this._instance,
    this._then,
  );

  final Variables$Mutation$insertTranslationValue _instance;

  final TRes Function(Variables$Mutation$insertTranslationValue) _then;

  static const _undefined = {};

  TRes call({Object? data = _undefined}) =>
      _then(Variables$Mutation$insertTranslationValue._({
        ..._instance._$data,
        if (data != _undefined && data != null)
          'data': (data as Input$translation_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$insertTranslationValue<TRes>
    implements CopyWith$Variables$Mutation$insertTranslationValue<TRes> {
  _CopyWithStubImpl$Variables$Mutation$insertTranslationValue(this._res);

  TRes _res;

  call({Input$translation_insert_input? data}) => _res;
}

class Mutation$insertTranslationValue {
  Mutation$insertTranslationValue({
    this.insert_translation_one,
    required this.$__typename,
  });

  factory Mutation$insertTranslationValue.fromJson(Map<String, dynamic> json) {
    final l$insert_translation_one = json['insert_translation_one'];
    final l$$__typename = json['__typename'];
    return Mutation$insertTranslationValue(
      insert_translation_one: l$insert_translation_one == null
          ? null
          : Mutation$insertTranslationValue$insert_translation_one.fromJson(
              (l$insert_translation_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$insertTranslationValue$insert_translation_one?
      insert_translation_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_translation_one = insert_translation_one;
    _resultData['insert_translation_one'] = l$insert_translation_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_translation_one = insert_translation_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_translation_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$insertTranslationValue) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_translation_one = insert_translation_one;
    final lOther$insert_translation_one = other.insert_translation_one;
    if (l$insert_translation_one != lOther$insert_translation_one) {
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

extension UtilityExtension$Mutation$insertTranslationValue
    on Mutation$insertTranslationValue {
  CopyWith$Mutation$insertTranslationValue<Mutation$insertTranslationValue>
      get copyWith => CopyWith$Mutation$insertTranslationValue(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$insertTranslationValue<TRes> {
  factory CopyWith$Mutation$insertTranslationValue(
    Mutation$insertTranslationValue instance,
    TRes Function(Mutation$insertTranslationValue) then,
  ) = _CopyWithImpl$Mutation$insertTranslationValue;

  factory CopyWith$Mutation$insertTranslationValue.stub(TRes res) =
      _CopyWithStubImpl$Mutation$insertTranslationValue;

  TRes call({
    Mutation$insertTranslationValue$insert_translation_one?
        insert_translation_one,
    String? $__typename,
  });
  CopyWith$Mutation$insertTranslationValue$insert_translation_one<TRes>
      get insert_translation_one;
}

class _CopyWithImpl$Mutation$insertTranslationValue<TRes>
    implements CopyWith$Mutation$insertTranslationValue<TRes> {
  _CopyWithImpl$Mutation$insertTranslationValue(
    this._instance,
    this._then,
  );

  final Mutation$insertTranslationValue _instance;

  final TRes Function(Mutation$insertTranslationValue) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_translation_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$insertTranslationValue(
        insert_translation_one: insert_translation_one == _undefined
            ? _instance.insert_translation_one
            : (insert_translation_one
                as Mutation$insertTranslationValue$insert_translation_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$insertTranslationValue$insert_translation_one<TRes>
      get insert_translation_one {
    final local$insert_translation_one = _instance.insert_translation_one;
    return local$insert_translation_one == null
        ? CopyWith$Mutation$insertTranslationValue$insert_translation_one.stub(
            _then(_instance))
        : CopyWith$Mutation$insertTranslationValue$insert_translation_one(
            local$insert_translation_one,
            (e) => call(insert_translation_one: e));
  }
}

class _CopyWithStubImpl$Mutation$insertTranslationValue<TRes>
    implements CopyWith$Mutation$insertTranslationValue<TRes> {
  _CopyWithStubImpl$Mutation$insertTranslationValue(this._res);

  TRes _res;

  call({
    Mutation$insertTranslationValue$insert_translation_one?
        insert_translation_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$insertTranslationValue$insert_translation_one<TRes>
      get insert_translation_one =>
          CopyWith$Mutation$insertTranslationValue$insert_translation_one.stub(
              _res);
}

const documentNodeMutationinsertTranslationValue = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'insertTranslationValue'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'data')),
        type: NamedTypeNode(
          name: NameNode(value: 'translation_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_translation_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'data')),
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
Mutation$insertTranslationValue _parserFn$Mutation$insertTranslationValue(
        Map<String, dynamic> data) =>
    Mutation$insertTranslationValue.fromJson(data);
typedef OnMutationCompleted$Mutation$insertTranslationValue = FutureOr<void>
    Function(
  dynamic,
  Mutation$insertTranslationValue?,
);

class Options$Mutation$insertTranslationValue
    extends graphql.MutationOptions<Mutation$insertTranslationValue> {
  Options$Mutation$insertTranslationValue({
    String? operationName,
    required Variables$Mutation$insertTranslationValue variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$insertTranslationValue? onCompleted,
    graphql.OnMutationUpdate<Mutation$insertTranslationValue>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$insertTranslationValue(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationinsertTranslationValue,
          parserFn: _parserFn$Mutation$insertTranslationValue,
        );

  final OnMutationCompleted$Mutation$insertTranslationValue?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$insertTranslationValue
    extends graphql.WatchQueryOptions<Mutation$insertTranslationValue> {
  WatchOptions$Mutation$insertTranslationValue({
    String? operationName,
    required Variables$Mutation$insertTranslationValue variables,
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
          document: documentNodeMutationinsertTranslationValue,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$insertTranslationValue,
        );
}

extension ClientExtension$Mutation$insertTranslationValue
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$insertTranslationValue>>
      mutate$insertTranslationValue(
              Options$Mutation$insertTranslationValue options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$insertTranslationValue>
      watchMutation$insertTranslationValue(
              WatchOptions$Mutation$insertTranslationValue options) =>
          this.watchMutation(options);
}

class Mutation$insertTranslationValue$insert_translation_one {
  Mutation$insertTranslationValue$insert_translation_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$insertTranslationValue$insert_translation_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$insertTranslationValue$insert_translation_one(
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
    if (!(other is Mutation$insertTranslationValue$insert_translation_one) ||
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

extension UtilityExtension$Mutation$insertTranslationValue$insert_translation_one
    on Mutation$insertTranslationValue$insert_translation_one {
  CopyWith$Mutation$insertTranslationValue$insert_translation_one<
          Mutation$insertTranslationValue$insert_translation_one>
      get copyWith =>
          CopyWith$Mutation$insertTranslationValue$insert_translation_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$insertTranslationValue$insert_translation_one<
    TRes> {
  factory CopyWith$Mutation$insertTranslationValue$insert_translation_one(
    Mutation$insertTranslationValue$insert_translation_one instance,
    TRes Function(Mutation$insertTranslationValue$insert_translation_one) then,
  ) = _CopyWithImpl$Mutation$insertTranslationValue$insert_translation_one;

  factory CopyWith$Mutation$insertTranslationValue$insert_translation_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$insertTranslationValue$insert_translation_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$insertTranslationValue$insert_translation_one<TRes>
    implements
        CopyWith$Mutation$insertTranslationValue$insert_translation_one<TRes> {
  _CopyWithImpl$Mutation$insertTranslationValue$insert_translation_one(
    this._instance,
    this._then,
  );

  final Mutation$insertTranslationValue$insert_translation_one _instance;

  final TRes Function(Mutation$insertTranslationValue$insert_translation_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$insertTranslationValue$insert_translation_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$insertTranslationValue$insert_translation_one<
        TRes>
    implements
        CopyWith$Mutation$insertTranslationValue$insert_translation_one<TRes> {
  _CopyWithStubImpl$Mutation$insertTranslationValue$insert_translation_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}
