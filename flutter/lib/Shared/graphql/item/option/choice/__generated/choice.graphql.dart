import '../../../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

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

class Variables$Mutation$updateChoiceById {
  factory Variables$Mutation$updateChoiceById({
    required int id,
    required Input$restaurant_choice_set_input choiceData,
  }) =>
      Variables$Mutation$updateChoiceById._({
        r'id': id,
        r'choiceData': choiceData,
      });

  Variables$Mutation$updateChoiceById._(this._$data);

  factory Variables$Mutation$updateChoiceById.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$choiceData = data['choiceData'];
    result$data['choiceData'] = Input$restaurant_choice_set_input.fromJson(
        (l$choiceData as Map<String, dynamic>));
    return Variables$Mutation$updateChoiceById._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Input$restaurant_choice_set_input get choiceData =>
      (_$data['choiceData'] as Input$restaurant_choice_set_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$choiceData = choiceData;
    result$data['choiceData'] = l$choiceData.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateChoiceById<
          Variables$Mutation$updateChoiceById>
      get copyWith => CopyWith$Variables$Mutation$updateChoiceById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateChoiceById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$choiceData = choiceData;
    final lOther$choiceData = other.choiceData;
    if (l$choiceData != lOther$choiceData) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$choiceData = choiceData;
    return Object.hashAll([
      l$id,
      l$choiceData,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateChoiceById<TRes> {
  factory CopyWith$Variables$Mutation$updateChoiceById(
    Variables$Mutation$updateChoiceById instance,
    TRes Function(Variables$Mutation$updateChoiceById) then,
  ) = _CopyWithImpl$Variables$Mutation$updateChoiceById;

  factory CopyWith$Variables$Mutation$updateChoiceById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateChoiceById;

  TRes call({
    int? id,
    Input$restaurant_choice_set_input? choiceData,
  });
}

class _CopyWithImpl$Variables$Mutation$updateChoiceById<TRes>
    implements CopyWith$Variables$Mutation$updateChoiceById<TRes> {
  _CopyWithImpl$Variables$Mutation$updateChoiceById(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateChoiceById _instance;

  final TRes Function(Variables$Mutation$updateChoiceById) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? choiceData = _undefined,
  }) =>
      _then(Variables$Mutation$updateChoiceById._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (choiceData != _undefined && choiceData != null)
          'choiceData': (choiceData as Input$restaurant_choice_set_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateChoiceById<TRes>
    implements CopyWith$Variables$Mutation$updateChoiceById<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateChoiceById(this._res);

  TRes _res;

  call({
    int? id,
    Input$restaurant_choice_set_input? choiceData,
  }) =>
      _res;
}

class Mutation$updateChoiceById {
  Mutation$updateChoiceById({
    this.update_restaurant_choice_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateChoiceById.fromJson(Map<String, dynamic> json) {
    final l$update_restaurant_choice_by_pk =
        json['update_restaurant_choice_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateChoiceById(
      update_restaurant_choice_by_pk: l$update_restaurant_choice_by_pk == null
          ? null
          : Mutation$updateChoiceById$update_restaurant_choice_by_pk.fromJson(
              (l$update_restaurant_choice_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateChoiceById$update_restaurant_choice_by_pk?
      update_restaurant_choice_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_choice_by_pk = update_restaurant_choice_by_pk;
    _resultData['update_restaurant_choice_by_pk'] =
        l$update_restaurant_choice_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_choice_by_pk = update_restaurant_choice_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_choice_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateChoiceById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_choice_by_pk = update_restaurant_choice_by_pk;
    final lOther$update_restaurant_choice_by_pk =
        other.update_restaurant_choice_by_pk;
    if (l$update_restaurant_choice_by_pk !=
        lOther$update_restaurant_choice_by_pk) {
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

extension UtilityExtension$Mutation$updateChoiceById
    on Mutation$updateChoiceById {
  CopyWith$Mutation$updateChoiceById<Mutation$updateChoiceById> get copyWith =>
      CopyWith$Mutation$updateChoiceById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$updateChoiceById<TRes> {
  factory CopyWith$Mutation$updateChoiceById(
    Mutation$updateChoiceById instance,
    TRes Function(Mutation$updateChoiceById) then,
  ) = _CopyWithImpl$Mutation$updateChoiceById;

  factory CopyWith$Mutation$updateChoiceById.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateChoiceById;

  TRes call({
    Mutation$updateChoiceById$update_restaurant_choice_by_pk?
        update_restaurant_choice_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateChoiceById$update_restaurant_choice_by_pk<TRes>
      get update_restaurant_choice_by_pk;
}

class _CopyWithImpl$Mutation$updateChoiceById<TRes>
    implements CopyWith$Mutation$updateChoiceById<TRes> {
  _CopyWithImpl$Mutation$updateChoiceById(
    this._instance,
    this._then,
  );

  final Mutation$updateChoiceById _instance;

  final TRes Function(Mutation$updateChoiceById) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_choice_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateChoiceById(
        update_restaurant_choice_by_pk: update_restaurant_choice_by_pk ==
                _undefined
            ? _instance.update_restaurant_choice_by_pk
            : (update_restaurant_choice_by_pk
                as Mutation$updateChoiceById$update_restaurant_choice_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateChoiceById$update_restaurant_choice_by_pk<TRes>
      get update_restaurant_choice_by_pk {
    final local$update_restaurant_choice_by_pk =
        _instance.update_restaurant_choice_by_pk;
    return local$update_restaurant_choice_by_pk == null
        ? CopyWith$Mutation$updateChoiceById$update_restaurant_choice_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateChoiceById$update_restaurant_choice_by_pk(
            local$update_restaurant_choice_by_pk,
            (e) => call(update_restaurant_choice_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateChoiceById<TRes>
    implements CopyWith$Mutation$updateChoiceById<TRes> {
  _CopyWithStubImpl$Mutation$updateChoiceById(this._res);

  TRes _res;

  call({
    Mutation$updateChoiceById$update_restaurant_choice_by_pk?
        update_restaurant_choice_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateChoiceById$update_restaurant_choice_by_pk<TRes>
      get update_restaurant_choice_by_pk =>
          CopyWith$Mutation$updateChoiceById$update_restaurant_choice_by_pk
              .stub(_res);
}

const documentNodeMutationupdateChoiceById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateChoiceById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'choiceData')),
        type: NamedTypeNode(
          name: NameNode(value: 'restaurant_choice_set_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_restaurant_choice_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'choiceData')),
          ),
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
            name: NameNode(value: 'cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'available'),
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
Mutation$updateChoiceById _parserFn$Mutation$updateChoiceById(
        Map<String, dynamic> data) =>
    Mutation$updateChoiceById.fromJson(data);
typedef OnMutationCompleted$Mutation$updateChoiceById = FutureOr<void> Function(
  dynamic,
  Mutation$updateChoiceById?,
);

class Options$Mutation$updateChoiceById
    extends graphql.MutationOptions<Mutation$updateChoiceById> {
  Options$Mutation$updateChoiceById({
    String? operationName,
    required Variables$Mutation$updateChoiceById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateChoiceById? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateChoiceById>? update,
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
                        : _parserFn$Mutation$updateChoiceById(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateChoiceById,
          parserFn: _parserFn$Mutation$updateChoiceById,
        );

  final OnMutationCompleted$Mutation$updateChoiceById? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateChoiceById
    extends graphql.WatchQueryOptions<Mutation$updateChoiceById> {
  WatchOptions$Mutation$updateChoiceById({
    String? operationName,
    required Variables$Mutation$updateChoiceById variables,
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
          document: documentNodeMutationupdateChoiceById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateChoiceById,
        );
}

extension ClientExtension$Mutation$updateChoiceById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateChoiceById>>
      mutate$updateChoiceById(
              Options$Mutation$updateChoiceById options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateChoiceById>
      watchMutation$updateChoiceById(
              WatchOptions$Mutation$updateChoiceById options) =>
          this.watchMutation(options);
}

class Mutation$updateChoiceById$update_restaurant_choice_by_pk {
  Mutation$updateChoiceById$update_restaurant_choice_by_pk({
    required this.id,
    required this.cost,
    required this.available,
    required this.$__typename,
  });

  factory Mutation$updateChoiceById$update_restaurant_choice_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$cost = json['cost'];
    final l$available = json['available'];
    final l$$__typename = json['__typename'];
    return Mutation$updateChoiceById$update_restaurant_choice_by_pk(
      id: (l$id as int),
      cost: MoneyFromJson(l$cost),
      available: (l$available as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final double cost;

  final bool available;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$cost = cost;
    _resultData['cost'] = MoneyToJson(l$cost);
    final l$available = available;
    _resultData['available'] = l$available;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$cost = cost;
    final l$available = available;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$cost,
      l$available,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateChoiceById$update_restaurant_choice_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
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

extension UtilityExtension$Mutation$updateChoiceById$update_restaurant_choice_by_pk
    on Mutation$updateChoiceById$update_restaurant_choice_by_pk {
  CopyWith$Mutation$updateChoiceById$update_restaurant_choice_by_pk<
          Mutation$updateChoiceById$update_restaurant_choice_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateChoiceById$update_restaurant_choice_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateChoiceById$update_restaurant_choice_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateChoiceById$update_restaurant_choice_by_pk(
    Mutation$updateChoiceById$update_restaurant_choice_by_pk instance,
    TRes Function(Mutation$updateChoiceById$update_restaurant_choice_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateChoiceById$update_restaurant_choice_by_pk;

  factory CopyWith$Mutation$updateChoiceById$update_restaurant_choice_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateChoiceById$update_restaurant_choice_by_pk;

  TRes call({
    int? id,
    double? cost,
    bool? available,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateChoiceById$update_restaurant_choice_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateChoiceById$update_restaurant_choice_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateChoiceById$update_restaurant_choice_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateChoiceById$update_restaurant_choice_by_pk _instance;

  final TRes Function(Mutation$updateChoiceById$update_restaurant_choice_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? cost = _undefined,
    Object? available = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateChoiceById$update_restaurant_choice_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateChoiceById$update_restaurant_choice_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateChoiceById$update_restaurant_choice_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateChoiceById$update_restaurant_choice_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    double? cost,
    bool? available,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$deleteChoiceById {
  factory Variables$Mutation$deleteChoiceById({required int id}) =>
      Variables$Mutation$deleteChoiceById._({
        r'id': id,
      });

  Variables$Mutation$deleteChoiceById._(this._$data);

  factory Variables$Mutation$deleteChoiceById.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Mutation$deleteChoiceById._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$deleteChoiceById<
          Variables$Mutation$deleteChoiceById>
      get copyWith => CopyWith$Variables$Mutation$deleteChoiceById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$deleteChoiceById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$deleteChoiceById<TRes> {
  factory CopyWith$Variables$Mutation$deleteChoiceById(
    Variables$Mutation$deleteChoiceById instance,
    TRes Function(Variables$Mutation$deleteChoiceById) then,
  ) = _CopyWithImpl$Variables$Mutation$deleteChoiceById;

  factory CopyWith$Variables$Mutation$deleteChoiceById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$deleteChoiceById;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Mutation$deleteChoiceById<TRes>
    implements CopyWith$Variables$Mutation$deleteChoiceById<TRes> {
  _CopyWithImpl$Variables$Mutation$deleteChoiceById(
    this._instance,
    this._then,
  );

  final Variables$Mutation$deleteChoiceById _instance;

  final TRes Function(Variables$Mutation$deleteChoiceById) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$deleteChoiceById._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$deleteChoiceById<TRes>
    implements CopyWith$Variables$Mutation$deleteChoiceById<TRes> {
  _CopyWithStubImpl$Variables$Mutation$deleteChoiceById(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Mutation$deleteChoiceById {
  Mutation$deleteChoiceById({
    this.delete_restaurant_choice_by_pk,
    required this.$__typename,
  });

  factory Mutation$deleteChoiceById.fromJson(Map<String, dynamic> json) {
    final l$delete_restaurant_choice_by_pk =
        json['delete_restaurant_choice_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteChoiceById(
      delete_restaurant_choice_by_pk: l$delete_restaurant_choice_by_pk == null
          ? null
          : Mutation$deleteChoiceById$delete_restaurant_choice_by_pk.fromJson(
              (l$delete_restaurant_choice_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$deleteChoiceById$delete_restaurant_choice_by_pk?
      delete_restaurant_choice_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_restaurant_choice_by_pk = delete_restaurant_choice_by_pk;
    _resultData['delete_restaurant_choice_by_pk'] =
        l$delete_restaurant_choice_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_restaurant_choice_by_pk = delete_restaurant_choice_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_restaurant_choice_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteChoiceById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_restaurant_choice_by_pk = delete_restaurant_choice_by_pk;
    final lOther$delete_restaurant_choice_by_pk =
        other.delete_restaurant_choice_by_pk;
    if (l$delete_restaurant_choice_by_pk !=
        lOther$delete_restaurant_choice_by_pk) {
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

extension UtilityExtension$Mutation$deleteChoiceById
    on Mutation$deleteChoiceById {
  CopyWith$Mutation$deleteChoiceById<Mutation$deleteChoiceById> get copyWith =>
      CopyWith$Mutation$deleteChoiceById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$deleteChoiceById<TRes> {
  factory CopyWith$Mutation$deleteChoiceById(
    Mutation$deleteChoiceById instance,
    TRes Function(Mutation$deleteChoiceById) then,
  ) = _CopyWithImpl$Mutation$deleteChoiceById;

  factory CopyWith$Mutation$deleteChoiceById.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteChoiceById;

  TRes call({
    Mutation$deleteChoiceById$delete_restaurant_choice_by_pk?
        delete_restaurant_choice_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk<TRes>
      get delete_restaurant_choice_by_pk;
}

class _CopyWithImpl$Mutation$deleteChoiceById<TRes>
    implements CopyWith$Mutation$deleteChoiceById<TRes> {
  _CopyWithImpl$Mutation$deleteChoiceById(
    this._instance,
    this._then,
  );

  final Mutation$deleteChoiceById _instance;

  final TRes Function(Mutation$deleteChoiceById) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_restaurant_choice_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteChoiceById(
        delete_restaurant_choice_by_pk: delete_restaurant_choice_by_pk ==
                _undefined
            ? _instance.delete_restaurant_choice_by_pk
            : (delete_restaurant_choice_by_pk
                as Mutation$deleteChoiceById$delete_restaurant_choice_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk<TRes>
      get delete_restaurant_choice_by_pk {
    final local$delete_restaurant_choice_by_pk =
        _instance.delete_restaurant_choice_by_pk;
    return local$delete_restaurant_choice_by_pk == null
        ? CopyWith$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk(
            local$delete_restaurant_choice_by_pk,
            (e) => call(delete_restaurant_choice_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteChoiceById<TRes>
    implements CopyWith$Mutation$deleteChoiceById<TRes> {
  _CopyWithStubImpl$Mutation$deleteChoiceById(this._res);

  TRes _res;

  call({
    Mutation$deleteChoiceById$delete_restaurant_choice_by_pk?
        delete_restaurant_choice_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk<TRes>
      get delete_restaurant_choice_by_pk =>
          CopyWith$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk
              .stub(_res);
}

const documentNodeMutationdeleteChoiceById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteChoiceById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delete_restaurant_choice_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
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
Mutation$deleteChoiceById _parserFn$Mutation$deleteChoiceById(
        Map<String, dynamic> data) =>
    Mutation$deleteChoiceById.fromJson(data);
typedef OnMutationCompleted$Mutation$deleteChoiceById = FutureOr<void> Function(
  dynamic,
  Mutation$deleteChoiceById?,
);

class Options$Mutation$deleteChoiceById
    extends graphql.MutationOptions<Mutation$deleteChoiceById> {
  Options$Mutation$deleteChoiceById({
    String? operationName,
    required Variables$Mutation$deleteChoiceById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteChoiceById? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteChoiceById>? update,
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
                        : _parserFn$Mutation$deleteChoiceById(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteChoiceById,
          parserFn: _parserFn$Mutation$deleteChoiceById,
        );

  final OnMutationCompleted$Mutation$deleteChoiceById? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$deleteChoiceById
    extends graphql.WatchQueryOptions<Mutation$deleteChoiceById> {
  WatchOptions$Mutation$deleteChoiceById({
    String? operationName,
    required Variables$Mutation$deleteChoiceById variables,
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
          document: documentNodeMutationdeleteChoiceById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$deleteChoiceById,
        );
}

extension ClientExtension$Mutation$deleteChoiceById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$deleteChoiceById>>
      mutate$deleteChoiceById(
              Options$Mutation$deleteChoiceById options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$deleteChoiceById>
      watchMutation$deleteChoiceById(
              WatchOptions$Mutation$deleteChoiceById options) =>
          this.watchMutation(options);
}

class Mutation$deleteChoiceById$delete_restaurant_choice_by_pk {
  Mutation$deleteChoiceById$delete_restaurant_choice_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$deleteChoiceById$delete_restaurant_choice_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteChoiceById$delete_restaurant_choice_by_pk(
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
    if (!(other is Mutation$deleteChoiceById$delete_restaurant_choice_by_pk) ||
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

extension UtilityExtension$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk
    on Mutation$deleteChoiceById$delete_restaurant_choice_by_pk {
  CopyWith$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk<
          Mutation$deleteChoiceById$delete_restaurant_choice_by_pk>
      get copyWith =>
          CopyWith$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk<
    TRes> {
  factory CopyWith$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk(
    Mutation$deleteChoiceById$delete_restaurant_choice_by_pk instance,
    TRes Function(Mutation$deleteChoiceById$delete_restaurant_choice_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk;

  factory CopyWith$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk<
        TRes>
    implements
        CopyWith$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$deleteChoiceById$delete_restaurant_choice_by_pk _instance;

  final TRes Function(Mutation$deleteChoiceById$delete_restaurant_choice_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteChoiceById$delete_restaurant_choice_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk<
        TRes>
    implements
        CopyWith$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$deleteChoiceById$delete_restaurant_choice_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getChoiceById {
  factory Variables$Query$getChoiceById({required int id}) =>
      Variables$Query$getChoiceById._({
        r'id': id,
      });

  Variables$Query$getChoiceById._(this._$data);

  factory Variables$Query$getChoiceById.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getChoiceById._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getChoiceById<Variables$Query$getChoiceById>
      get copyWith => CopyWith$Variables$Query$getChoiceById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getChoiceById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$getChoiceById<TRes> {
  factory CopyWith$Variables$Query$getChoiceById(
    Variables$Query$getChoiceById instance,
    TRes Function(Variables$Query$getChoiceById) then,
  ) = _CopyWithImpl$Variables$Query$getChoiceById;

  factory CopyWith$Variables$Query$getChoiceById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getChoiceById;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getChoiceById<TRes>
    implements CopyWith$Variables$Query$getChoiceById<TRes> {
  _CopyWithImpl$Variables$Query$getChoiceById(
    this._instance,
    this._then,
  );

  final Variables$Query$getChoiceById _instance;

  final TRes Function(Variables$Query$getChoiceById) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getChoiceById._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getChoiceById<TRes>
    implements CopyWith$Variables$Query$getChoiceById<TRes> {
  _CopyWithStubImpl$Variables$Query$getChoiceById(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getChoiceById {
  Query$getChoiceById({
    this.restaurant_choice_by_pk,
    required this.$__typename,
  });

  factory Query$getChoiceById.fromJson(Map<String, dynamic> json) {
    final l$restaurant_choice_by_pk = json['restaurant_choice_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getChoiceById(
      restaurant_choice_by_pk: l$restaurant_choice_by_pk == null
          ? null
          : Query$getChoiceById$restaurant_choice_by_pk.fromJson(
              (l$restaurant_choice_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getChoiceById$restaurant_choice_by_pk? restaurant_choice_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_choice_by_pk = restaurant_choice_by_pk;
    _resultData['restaurant_choice_by_pk'] =
        l$restaurant_choice_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_choice_by_pk = restaurant_choice_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_choice_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getChoiceById) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_choice_by_pk = restaurant_choice_by_pk;
    final lOther$restaurant_choice_by_pk = other.restaurant_choice_by_pk;
    if (l$restaurant_choice_by_pk != lOther$restaurant_choice_by_pk) {
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

extension UtilityExtension$Query$getChoiceById on Query$getChoiceById {
  CopyWith$Query$getChoiceById<Query$getChoiceById> get copyWith =>
      CopyWith$Query$getChoiceById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getChoiceById<TRes> {
  factory CopyWith$Query$getChoiceById(
    Query$getChoiceById instance,
    TRes Function(Query$getChoiceById) then,
  ) = _CopyWithImpl$Query$getChoiceById;

  factory CopyWith$Query$getChoiceById.stub(TRes res) =
      _CopyWithStubImpl$Query$getChoiceById;

  TRes call({
    Query$getChoiceById$restaurant_choice_by_pk? restaurant_choice_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getChoiceById$restaurant_choice_by_pk<TRes>
      get restaurant_choice_by_pk;
}

class _CopyWithImpl$Query$getChoiceById<TRes>
    implements CopyWith$Query$getChoiceById<TRes> {
  _CopyWithImpl$Query$getChoiceById(
    this._instance,
    this._then,
  );

  final Query$getChoiceById _instance;

  final TRes Function(Query$getChoiceById) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_choice_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getChoiceById(
        restaurant_choice_by_pk: restaurant_choice_by_pk == _undefined
            ? _instance.restaurant_choice_by_pk
            : (restaurant_choice_by_pk
                as Query$getChoiceById$restaurant_choice_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getChoiceById$restaurant_choice_by_pk<TRes>
      get restaurant_choice_by_pk {
    final local$restaurant_choice_by_pk = _instance.restaurant_choice_by_pk;
    return local$restaurant_choice_by_pk == null
        ? CopyWith$Query$getChoiceById$restaurant_choice_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getChoiceById$restaurant_choice_by_pk(
            local$restaurant_choice_by_pk,
            (e) => call(restaurant_choice_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getChoiceById<TRes>
    implements CopyWith$Query$getChoiceById<TRes> {
  _CopyWithStubImpl$Query$getChoiceById(this._res);

  TRes _res;

  call({
    Query$getChoiceById$restaurant_choice_by_pk? restaurant_choice_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getChoiceById$restaurant_choice_by_pk<TRes>
      get restaurant_choice_by_pk =>
          CopyWith$Query$getChoiceById$restaurant_choice_by_pk.stub(_res);
}

const documentNodeQuerygetChoiceById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getChoiceById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'restaurant_choice_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'available'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
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
                name: NameNode(value: 'translations'),
                alias: null,
                arguments: [],
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
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
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
Query$getChoiceById _parserFn$Query$getChoiceById(Map<String, dynamic> data) =>
    Query$getChoiceById.fromJson(data);

class Options$Query$getChoiceById
    extends graphql.QueryOptions<Query$getChoiceById> {
  Options$Query$getChoiceById({
    String? operationName,
    required Variables$Query$getChoiceById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerygetChoiceById,
          parserFn: _parserFn$Query$getChoiceById,
        );
}

class WatchOptions$Query$getChoiceById
    extends graphql.WatchQueryOptions<Query$getChoiceById> {
  WatchOptions$Query$getChoiceById({
    String? operationName,
    required Variables$Query$getChoiceById variables,
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
          document: documentNodeQuerygetChoiceById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getChoiceById,
        );
}

class FetchMoreOptions$Query$getChoiceById extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getChoiceById({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getChoiceById variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetChoiceById,
        );
}

extension ClientExtension$Query$getChoiceById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getChoiceById>> query$getChoiceById(
          Options$Query$getChoiceById options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getChoiceById> watchQuery$getChoiceById(
          WatchOptions$Query$getChoiceById options) =>
      this.watchQuery(options);
  void writeQuery$getChoiceById({
    required Query$getChoiceById data,
    required Variables$Query$getChoiceById variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetChoiceById),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getChoiceById? readQuery$getChoiceById({
    required Variables$Query$getChoiceById variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetChoiceById),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getChoiceById.fromJson(result);
  }
}

class Query$getChoiceById$restaurant_choice_by_pk {
  Query$getChoiceById$restaurant_choice_by_pk({
    required this.available,
    required this.cost,
    required this.id,
    required this.name,
    required this.$__typename,
  });

  factory Query$getChoiceById$restaurant_choice_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$available = json['available'];
    final l$cost = json['cost'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getChoiceById$restaurant_choice_by_pk(
      available: (l$available as bool),
      cost: MoneyFromJson(l$cost),
      id: (l$id as int),
      name: Query$getChoiceById$restaurant_choice_by_pk$name.fromJson(
          (l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool available;

  final double cost;

  final int id;

  final Query$getChoiceById$restaurant_choice_by_pk$name name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$available = available;
    _resultData['available'] = l$available;
    final l$cost = cost;
    _resultData['cost'] = MoneyToJson(l$cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$available = available;
    final l$cost = cost;
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$available,
      l$cost,
      l$id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getChoiceById$restaurant_choice_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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

extension UtilityExtension$Query$getChoiceById$restaurant_choice_by_pk
    on Query$getChoiceById$restaurant_choice_by_pk {
  CopyWith$Query$getChoiceById$restaurant_choice_by_pk<
          Query$getChoiceById$restaurant_choice_by_pk>
      get copyWith => CopyWith$Query$getChoiceById$restaurant_choice_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getChoiceById$restaurant_choice_by_pk<TRes> {
  factory CopyWith$Query$getChoiceById$restaurant_choice_by_pk(
    Query$getChoiceById$restaurant_choice_by_pk instance,
    TRes Function(Query$getChoiceById$restaurant_choice_by_pk) then,
  ) = _CopyWithImpl$Query$getChoiceById$restaurant_choice_by_pk;

  factory CopyWith$Query$getChoiceById$restaurant_choice_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getChoiceById$restaurant_choice_by_pk;

  TRes call({
    bool? available,
    double? cost,
    int? id,
    Query$getChoiceById$restaurant_choice_by_pk$name? name,
    String? $__typename,
  });
  CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name<TRes> get name;
}

class _CopyWithImpl$Query$getChoiceById$restaurant_choice_by_pk<TRes>
    implements CopyWith$Query$getChoiceById$restaurant_choice_by_pk<TRes> {
  _CopyWithImpl$Query$getChoiceById$restaurant_choice_by_pk(
    this._instance,
    this._then,
  );

  final Query$getChoiceById$restaurant_choice_by_pk _instance;

  final TRes Function(Query$getChoiceById$restaurant_choice_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? available = _undefined,
    Object? cost = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getChoiceById$restaurant_choice_by_pk(
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$getChoiceById$restaurant_choice_by_pk$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name<TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getChoiceById$restaurant_choice_by_pk<TRes>
    implements CopyWith$Query$getChoiceById$restaurant_choice_by_pk<TRes> {
  _CopyWithStubImpl$Query$getChoiceById$restaurant_choice_by_pk(this._res);

  TRes _res;

  call({
    bool? available,
    double? cost,
    int? id,
    Query$getChoiceById$restaurant_choice_by_pk$name? name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name<TRes> get name =>
      CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name.stub(_res);
}

class Query$getChoiceById$restaurant_choice_by_pk$name {
  Query$getChoiceById$restaurant_choice_by_pk$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getChoiceById$restaurant_choice_by_pk$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getChoiceById$restaurant_choice_by_pk$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getChoiceById$restaurant_choice_by_pk$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<Query$getChoiceById$restaurant_choice_by_pk$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      Object.hashAll(l$translations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getChoiceById$restaurant_choice_by_pk$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$translations = translations;
    final lOther$translations = other.translations;
    if (l$translations.length != lOther$translations.length) {
      return false;
    }
    for (int i = 0; i < l$translations.length; i++) {
      final l$translations$entry = l$translations[i];
      final lOther$translations$entry = lOther$translations[i];
      if (l$translations$entry != lOther$translations$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getChoiceById$restaurant_choice_by_pk$name
    on Query$getChoiceById$restaurant_choice_by_pk$name {
  CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name<
          Query$getChoiceById$restaurant_choice_by_pk$name>
      get copyWith => CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name<TRes> {
  factory CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name(
    Query$getChoiceById$restaurant_choice_by_pk$name instance,
    TRes Function(Query$getChoiceById$restaurant_choice_by_pk$name) then,
  ) = _CopyWithImpl$Query$getChoiceById$restaurant_choice_by_pk$name;

  factory CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getChoiceById$restaurant_choice_by_pk$name;

  TRes call({
    int? id,
    List<Query$getChoiceById$restaurant_choice_by_pk$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getChoiceById$restaurant_choice_by_pk$name$translations> Function(
              Iterable<
                  CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name$translations<
                      Query$getChoiceById$restaurant_choice_by_pk$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getChoiceById$restaurant_choice_by_pk$name<TRes>
    implements CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name<TRes> {
  _CopyWithImpl$Query$getChoiceById$restaurant_choice_by_pk$name(
    this._instance,
    this._then,
  );

  final Query$getChoiceById$restaurant_choice_by_pk$name _instance;

  final TRes Function(Query$getChoiceById$restaurant_choice_by_pk$name) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getChoiceById$restaurant_choice_by_pk$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getChoiceById$restaurant_choice_by_pk$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getChoiceById$restaurant_choice_by_pk$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name$translations<
                          Query$getChoiceById$restaurant_choice_by_pk$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getChoiceById$restaurant_choice_by_pk$name<TRes>
    implements CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name<TRes> {
  _CopyWithStubImpl$Query$getChoiceById$restaurant_choice_by_pk$name(this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getChoiceById$restaurant_choice_by_pk$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getChoiceById$restaurant_choice_by_pk$name$translations {
  Query$getChoiceById$restaurant_choice_by_pk$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getChoiceById$restaurant_choice_by_pk$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getChoiceById$restaurant_choice_by_pk$name$translations(
      language_id: (l$language_id as String),
      value: (l$value as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String language_id;

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$language_id = language_id;
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$language_id,
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
            is Query$getChoiceById$restaurant_choice_by_pk$name$translations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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

extension UtilityExtension$Query$getChoiceById$restaurant_choice_by_pk$name$translations
    on Query$getChoiceById$restaurant_choice_by_pk$name$translations {
  CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name$translations<
          Query$getChoiceById$restaurant_choice_by_pk$name$translations>
      get copyWith =>
          CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name$translations<
    TRes> {
  factory CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name$translations(
    Query$getChoiceById$restaurant_choice_by_pk$name$translations instance,
    TRes Function(Query$getChoiceById$restaurant_choice_by_pk$name$translations)
        then,
  ) = _CopyWithImpl$Query$getChoiceById$restaurant_choice_by_pk$name$translations;

  factory CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getChoiceById$restaurant_choice_by_pk$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getChoiceById$restaurant_choice_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name$translations<
            TRes> {
  _CopyWithImpl$Query$getChoiceById$restaurant_choice_by_pk$name$translations(
    this._instance,
    this._then,
  );

  final Query$getChoiceById$restaurant_choice_by_pk$name$translations _instance;

  final TRes Function(
      Query$getChoiceById$restaurant_choice_by_pk$name$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getChoiceById$restaurant_choice_by_pk$name$translations(
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        value: value == _undefined || value == null
            ? _instance.value
            : (value as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getChoiceById$restaurant_choice_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$getChoiceById$restaurant_choice_by_pk$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getChoiceById$restaurant_choice_by_pk$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}
