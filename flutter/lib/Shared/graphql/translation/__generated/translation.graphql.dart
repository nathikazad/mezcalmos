import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$upsertTranslationValue {
  factory Variables$Mutation$upsertTranslationValue({
    required Input$translation_value_insert_input translation_value,
    required Input$translation_value_on_conflict on_conflict,
  }) =>
      Variables$Mutation$upsertTranslationValue._({
        r'translation_value': translation_value,
        r'on_conflict': on_conflict,
      });

  Variables$Mutation$upsertTranslationValue._(this._$data);

  factory Variables$Mutation$upsertTranslationValue.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$translation_value = data['translation_value'];
    result$data['translation_value'] =
        Input$translation_value_insert_input.fromJson(
            (l$translation_value as Map<String, dynamic>));
    final l$on_conflict = data['on_conflict'];
    result$data['on_conflict'] = Input$translation_value_on_conflict.fromJson(
        (l$on_conflict as Map<String, dynamic>));
    return Variables$Mutation$upsertTranslationValue._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$translation_value_insert_input get translation_value =>
      (_$data['translation_value'] as Input$translation_value_insert_input);
  Input$translation_value_on_conflict get on_conflict =>
      (_$data['on_conflict'] as Input$translation_value_on_conflict);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$translation_value = translation_value;
    result$data['translation_value'] = l$translation_value.toJson();
    final l$on_conflict = on_conflict;
    result$data['on_conflict'] = l$on_conflict.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$upsertTranslationValue<
          Variables$Mutation$upsertTranslationValue>
      get copyWith => CopyWith$Variables$Mutation$upsertTranslationValue(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$upsertTranslationValue) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$translation_value = translation_value;
    final lOther$translation_value = other.translation_value;
    if (l$translation_value != lOther$translation_value) {
      return false;
    }
    final l$on_conflict = on_conflict;
    final lOther$on_conflict = other.on_conflict;
    if (l$on_conflict != lOther$on_conflict) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$translation_value = translation_value;
    final l$on_conflict = on_conflict;
    return Object.hashAll([
      l$translation_value,
      l$on_conflict,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$upsertTranslationValue<TRes> {
  factory CopyWith$Variables$Mutation$upsertTranslationValue(
    Variables$Mutation$upsertTranslationValue instance,
    TRes Function(Variables$Mutation$upsertTranslationValue) then,
  ) = _CopyWithImpl$Variables$Mutation$upsertTranslationValue;

  factory CopyWith$Variables$Mutation$upsertTranslationValue.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$upsertTranslationValue;

  TRes call({
    Input$translation_value_insert_input? translation_value,
    Input$translation_value_on_conflict? on_conflict,
  });
}

class _CopyWithImpl$Variables$Mutation$upsertTranslationValue<TRes>
    implements CopyWith$Variables$Mutation$upsertTranslationValue<TRes> {
  _CopyWithImpl$Variables$Mutation$upsertTranslationValue(
    this._instance,
    this._then,
  );

  final Variables$Mutation$upsertTranslationValue _instance;

  final TRes Function(Variables$Mutation$upsertTranslationValue) _then;

  static const _undefined = {};

  TRes call({
    Object? translation_value = _undefined,
    Object? on_conflict = _undefined,
  }) =>
      _then(Variables$Mutation$upsertTranslationValue._({
        ..._instance._$data,
        if (translation_value != _undefined && translation_value != null)
          'translation_value':
              (translation_value as Input$translation_value_insert_input),
        if (on_conflict != _undefined && on_conflict != null)
          'on_conflict': (on_conflict as Input$translation_value_on_conflict),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$upsertTranslationValue<TRes>
    implements CopyWith$Variables$Mutation$upsertTranslationValue<TRes> {
  _CopyWithStubImpl$Variables$Mutation$upsertTranslationValue(this._res);

  TRes _res;

  call({
    Input$translation_value_insert_input? translation_value,
    Input$translation_value_on_conflict? on_conflict,
  }) =>
      _res;
}

class Mutation$upsertTranslationValue {
  Mutation$upsertTranslationValue({
    this.insert_translation_value_one,
    required this.$__typename,
  });

  factory Mutation$upsertTranslationValue.fromJson(Map<String, dynamic> json) {
    final l$insert_translation_value_one = json['insert_translation_value_one'];
    final l$$__typename = json['__typename'];
    return Mutation$upsertTranslationValue(
      insert_translation_value_one: l$insert_translation_value_one == null
          ? null
          : Mutation$upsertTranslationValue$insert_translation_value_one
              .fromJson(
                  (l$insert_translation_value_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$upsertTranslationValue$insert_translation_value_one?
      insert_translation_value_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_translation_value_one = insert_translation_value_one;
    _resultData['insert_translation_value_one'] =
        l$insert_translation_value_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_translation_value_one = insert_translation_value_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_translation_value_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$upsertTranslationValue) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_translation_value_one = insert_translation_value_one;
    final lOther$insert_translation_value_one =
        other.insert_translation_value_one;
    if (l$insert_translation_value_one != lOther$insert_translation_value_one) {
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

extension UtilityExtension$Mutation$upsertTranslationValue
    on Mutation$upsertTranslationValue {
  CopyWith$Mutation$upsertTranslationValue<Mutation$upsertTranslationValue>
      get copyWith => CopyWith$Mutation$upsertTranslationValue(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$upsertTranslationValue<TRes> {
  factory CopyWith$Mutation$upsertTranslationValue(
    Mutation$upsertTranslationValue instance,
    TRes Function(Mutation$upsertTranslationValue) then,
  ) = _CopyWithImpl$Mutation$upsertTranslationValue;

  factory CopyWith$Mutation$upsertTranslationValue.stub(TRes res) =
      _CopyWithStubImpl$Mutation$upsertTranslationValue;

  TRes call({
    Mutation$upsertTranslationValue$insert_translation_value_one?
        insert_translation_value_one,
    String? $__typename,
  });
  CopyWith$Mutation$upsertTranslationValue$insert_translation_value_one<TRes>
      get insert_translation_value_one;
}

class _CopyWithImpl$Mutation$upsertTranslationValue<TRes>
    implements CopyWith$Mutation$upsertTranslationValue<TRes> {
  _CopyWithImpl$Mutation$upsertTranslationValue(
    this._instance,
    this._then,
  );

  final Mutation$upsertTranslationValue _instance;

  final TRes Function(Mutation$upsertTranslationValue) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_translation_value_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$upsertTranslationValue(
        insert_translation_value_one: insert_translation_value_one == _undefined
            ? _instance.insert_translation_value_one
            : (insert_translation_value_one
                as Mutation$upsertTranslationValue$insert_translation_value_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$upsertTranslationValue$insert_translation_value_one<TRes>
      get insert_translation_value_one {
    final local$insert_translation_value_one =
        _instance.insert_translation_value_one;
    return local$insert_translation_value_one == null
        ? CopyWith$Mutation$upsertTranslationValue$insert_translation_value_one
            .stub(_then(_instance))
        : CopyWith$Mutation$upsertTranslationValue$insert_translation_value_one(
            local$insert_translation_value_one,
            (e) => call(insert_translation_value_one: e));
  }
}

class _CopyWithStubImpl$Mutation$upsertTranslationValue<TRes>
    implements CopyWith$Mutation$upsertTranslationValue<TRes> {
  _CopyWithStubImpl$Mutation$upsertTranslationValue(this._res);

  TRes _res;

  call({
    Mutation$upsertTranslationValue$insert_translation_value_one?
        insert_translation_value_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$upsertTranslationValue$insert_translation_value_one<TRes>
      get insert_translation_value_one =>
          CopyWith$Mutation$upsertTranslationValue$insert_translation_value_one
              .stub(_res);
}

const documentNodeMutationupsertTranslationValue = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'upsertTranslationValue'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'translation_value')),
        type: NamedTypeNode(
          name: NameNode(value: 'translation_value_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'on_conflict')),
        type: NamedTypeNode(
          name: NameNode(value: 'translation_value_on_conflict'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_translation_value_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'translation_value')),
          ),
          ArgumentNode(
            name: NameNode(value: 'on_conflict'),
            value: VariableNode(name: NameNode(value: 'on_conflict')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
            name: NameNode(value: 'value'),
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
Mutation$upsertTranslationValue _parserFn$Mutation$upsertTranslationValue(
        Map<String, dynamic> data) =>
    Mutation$upsertTranslationValue.fromJson(data);
typedef OnMutationCompleted$Mutation$upsertTranslationValue = FutureOr<void>
    Function(
  dynamic,
  Mutation$upsertTranslationValue?,
);

class Options$Mutation$upsertTranslationValue
    extends graphql.MutationOptions<Mutation$upsertTranslationValue> {
  Options$Mutation$upsertTranslationValue({
    String? operationName,
    required Variables$Mutation$upsertTranslationValue variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$upsertTranslationValue? onCompleted,
    graphql.OnMutationUpdate<Mutation$upsertTranslationValue>? update,
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
                        : _parserFn$Mutation$upsertTranslationValue(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupsertTranslationValue,
          parserFn: _parserFn$Mutation$upsertTranslationValue,
        );

  final OnMutationCompleted$Mutation$upsertTranslationValue?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$upsertTranslationValue
    extends graphql.WatchQueryOptions<Mutation$upsertTranslationValue> {
  WatchOptions$Mutation$upsertTranslationValue({
    String? operationName,
    required Variables$Mutation$upsertTranslationValue variables,
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
          document: documentNodeMutationupsertTranslationValue,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$upsertTranslationValue,
        );
}

extension ClientExtension$Mutation$upsertTranslationValue
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$upsertTranslationValue>>
      mutate$upsertTranslationValue(
              Options$Mutation$upsertTranslationValue options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$upsertTranslationValue>
      watchMutation$upsertTranslationValue(
              WatchOptions$Mutation$upsertTranslationValue options) =>
          this.watchMutation(options);
}

class Mutation$upsertTranslationValue$insert_translation_value_one {
  Mutation$upsertTranslationValue$insert_translation_value_one({
    required this.language_id,
    required this.translation_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$upsertTranslationValue$insert_translation_value_one.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$translation_id = json['translation_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$upsertTranslationValue$insert_translation_value_one(
      language_id: (l$language_id as String),
      translation_id: (l$translation_id as int),
      value: (l$value as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String language_id;

  final int translation_id;

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$translation_id = translation_id;
    _resultData['translation_id'] = l$translation_id;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$language_id = language_id;
    final l$translation_id = translation_id;
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$language_id,
      l$translation_id,
      l$value,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$upsertTranslationValue$insert_translation_value_one) ||
        runtimeType != other.runtimeType) {
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
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

extension UtilityExtension$Mutation$upsertTranslationValue$insert_translation_value_one
    on Mutation$upsertTranslationValue$insert_translation_value_one {
  CopyWith$Mutation$upsertTranslationValue$insert_translation_value_one<
          Mutation$upsertTranslationValue$insert_translation_value_one>
      get copyWith =>
          CopyWith$Mutation$upsertTranslationValue$insert_translation_value_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$upsertTranslationValue$insert_translation_value_one<
    TRes> {
  factory CopyWith$Mutation$upsertTranslationValue$insert_translation_value_one(
    Mutation$upsertTranslationValue$insert_translation_value_one instance,
    TRes Function(Mutation$upsertTranslationValue$insert_translation_value_one)
        then,
  ) = _CopyWithImpl$Mutation$upsertTranslationValue$insert_translation_value_one;

  factory CopyWith$Mutation$upsertTranslationValue$insert_translation_value_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$upsertTranslationValue$insert_translation_value_one;

  TRes call({
    String? language_id,
    int? translation_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$upsertTranslationValue$insert_translation_value_one<
        TRes>
    implements
        CopyWith$Mutation$upsertTranslationValue$insert_translation_value_one<
            TRes> {
  _CopyWithImpl$Mutation$upsertTranslationValue$insert_translation_value_one(
    this._instance,
    this._then,
  );

  final Mutation$upsertTranslationValue$insert_translation_value_one _instance;

  final TRes Function(
      Mutation$upsertTranslationValue$insert_translation_value_one) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? translation_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$upsertTranslationValue$insert_translation_value_one(
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        translation_id: translation_id == _undefined || translation_id == null
            ? _instance.translation_id
            : (translation_id as int),
        value: value == _undefined || value == null
            ? _instance.value
            : (value as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$upsertTranslationValue$insert_translation_value_one<
        TRes>
    implements
        CopyWith$Mutation$upsertTranslationValue$insert_translation_value_one<
            TRes> {
  _CopyWithStubImpl$Mutation$upsertTranslationValue$insert_translation_value_one(
      this._res);

  TRes _res;

  call({
    String? language_id,
    int? translation_id,
    String? value,
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
