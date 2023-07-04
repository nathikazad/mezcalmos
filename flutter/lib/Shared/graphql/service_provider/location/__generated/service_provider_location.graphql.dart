import '../../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Mutation$updateServiceLocation {
  factory Variables$Mutation$updateServiceLocation({
    required int locationId,
    Input$service_provider_location_set_input? data,
  }) =>
      Variables$Mutation$updateServiceLocation._({
        r'locationId': locationId,
        if (data != null) r'data': data,
      });

  Variables$Mutation$updateServiceLocation._(this._$data);

  factory Variables$Mutation$updateServiceLocation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$locationId = data['locationId'];
    result$data['locationId'] = (l$locationId as int);
    if (data.containsKey('data')) {
      final l$data = data['data'];
      result$data['data'] = l$data == null
          ? null
          : Input$service_provider_location_set_input.fromJson(
              (l$data as Map<String, dynamic>));
    }
    return Variables$Mutation$updateServiceLocation._(result$data);
  }

  Map<String, dynamic> _$data;

  int get locationId => (_$data['locationId'] as int);
  Input$service_provider_location_set_input? get data =>
      (_$data['data'] as Input$service_provider_location_set_input?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$locationId = locationId;
    result$data['locationId'] = l$locationId;
    if (_$data.containsKey('data')) {
      final l$data = data;
      result$data['data'] = l$data?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$updateServiceLocation<
          Variables$Mutation$updateServiceLocation>
      get copyWith => CopyWith$Variables$Mutation$updateServiceLocation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateServiceLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$locationId = locationId;
    final lOther$locationId = other.locationId;
    if (l$locationId != lOther$locationId) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (_$data.containsKey('data') != other._$data.containsKey('data')) {
      return false;
    }
    if (l$data != lOther$data) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$locationId = locationId;
    final l$data = data;
    return Object.hashAll([
      l$locationId,
      _$data.containsKey('data') ? l$data : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateServiceLocation<TRes> {
  factory CopyWith$Variables$Mutation$updateServiceLocation(
    Variables$Mutation$updateServiceLocation instance,
    TRes Function(Variables$Mutation$updateServiceLocation) then,
  ) = _CopyWithImpl$Variables$Mutation$updateServiceLocation;

  factory CopyWith$Variables$Mutation$updateServiceLocation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateServiceLocation;

  TRes call({
    int? locationId,
    Input$service_provider_location_set_input? data,
  });
}

class _CopyWithImpl$Variables$Mutation$updateServiceLocation<TRes>
    implements CopyWith$Variables$Mutation$updateServiceLocation<TRes> {
  _CopyWithImpl$Variables$Mutation$updateServiceLocation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateServiceLocation _instance;

  final TRes Function(Variables$Mutation$updateServiceLocation) _then;

  static const _undefined = {};

  TRes call({
    Object? locationId = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateServiceLocation._({
        ..._instance._$data,
        if (locationId != _undefined && locationId != null)
          'locationId': (locationId as int),
        if (data != _undefined)
          'data': (data as Input$service_provider_location_set_input?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateServiceLocation<TRes>
    implements CopyWith$Variables$Mutation$updateServiceLocation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateServiceLocation(this._res);

  TRes _res;

  call({
    int? locationId,
    Input$service_provider_location_set_input? data,
  }) =>
      _res;
}

class Mutation$updateServiceLocation {
  Mutation$updateServiceLocation({
    this.update_service_provider_location_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateServiceLocation.fromJson(Map<String, dynamic> json) {
    final l$update_service_provider_location_by_pk =
        json['update_service_provider_location_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateServiceLocation(
      update_service_provider_location_by_pk:
          l$update_service_provider_location_by_pk == null
              ? null
              : Mutation$updateServiceLocation$update_service_provider_location_by_pk
                  .fromJson((l$update_service_provider_location_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateServiceLocation$update_service_provider_location_by_pk?
      update_service_provider_location_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_service_provider_location_by_pk =
        update_service_provider_location_by_pk;
    _resultData['update_service_provider_location_by_pk'] =
        l$update_service_provider_location_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_service_provider_location_by_pk =
        update_service_provider_location_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_service_provider_location_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateServiceLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_service_provider_location_by_pk =
        update_service_provider_location_by_pk;
    final lOther$update_service_provider_location_by_pk =
        other.update_service_provider_location_by_pk;
    if (l$update_service_provider_location_by_pk !=
        lOther$update_service_provider_location_by_pk) {
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

extension UtilityExtension$Mutation$updateServiceLocation
    on Mutation$updateServiceLocation {
  CopyWith$Mutation$updateServiceLocation<Mutation$updateServiceLocation>
      get copyWith => CopyWith$Mutation$updateServiceLocation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateServiceLocation<TRes> {
  factory CopyWith$Mutation$updateServiceLocation(
    Mutation$updateServiceLocation instance,
    TRes Function(Mutation$updateServiceLocation) then,
  ) = _CopyWithImpl$Mutation$updateServiceLocation;

  factory CopyWith$Mutation$updateServiceLocation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateServiceLocation;

  TRes call({
    Mutation$updateServiceLocation$update_service_provider_location_by_pk?
        update_service_provider_location_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateServiceLocation$update_service_provider_location_by_pk<
      TRes> get update_service_provider_location_by_pk;
}

class _CopyWithImpl$Mutation$updateServiceLocation<TRes>
    implements CopyWith$Mutation$updateServiceLocation<TRes> {
  _CopyWithImpl$Mutation$updateServiceLocation(
    this._instance,
    this._then,
  );

  final Mutation$updateServiceLocation _instance;

  final TRes Function(Mutation$updateServiceLocation) _then;

  static const _undefined = {};

  TRes call({
    Object? update_service_provider_location_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateServiceLocation(
        update_service_provider_location_by_pk:
            update_service_provider_location_by_pk == _undefined
                ? _instance.update_service_provider_location_by_pk
                : (update_service_provider_location_by_pk
                    as Mutation$updateServiceLocation$update_service_provider_location_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateServiceLocation$update_service_provider_location_by_pk<
      TRes> get update_service_provider_location_by_pk {
    final local$update_service_provider_location_by_pk =
        _instance.update_service_provider_location_by_pk;
    return local$update_service_provider_location_by_pk == null
        ? CopyWith$Mutation$updateServiceLocation$update_service_provider_location_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateServiceLocation$update_service_provider_location_by_pk(
            local$update_service_provider_location_by_pk,
            (e) => call(update_service_provider_location_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateServiceLocation<TRes>
    implements CopyWith$Mutation$updateServiceLocation<TRes> {
  _CopyWithStubImpl$Mutation$updateServiceLocation(this._res);

  TRes _res;

  call({
    Mutation$updateServiceLocation$update_service_provider_location_by_pk?
        update_service_provider_location_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateServiceLocation$update_service_provider_location_by_pk<
          TRes>
      get update_service_provider_location_by_pk =>
          CopyWith$Mutation$updateServiceLocation$update_service_provider_location_by_pk
              .stub(_res);
}

const documentNodeMutationupdateServiceLocation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateServiceLocation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'locationId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'data')),
        type: NamedTypeNode(
          name: NameNode(value: 'service_provider_location_set_input'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_service_provider_location_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'locationId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'data')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gps'),
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
Mutation$updateServiceLocation _parserFn$Mutation$updateServiceLocation(
        Map<String, dynamic> data) =>
    Mutation$updateServiceLocation.fromJson(data);
typedef OnMutationCompleted$Mutation$updateServiceLocation = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateServiceLocation?,
);

class Options$Mutation$updateServiceLocation
    extends graphql.MutationOptions<Mutation$updateServiceLocation> {
  Options$Mutation$updateServiceLocation({
    String? operationName,
    required Variables$Mutation$updateServiceLocation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateServiceLocation? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateServiceLocation>? update,
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
                        : _parserFn$Mutation$updateServiceLocation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateServiceLocation,
          parserFn: _parserFn$Mutation$updateServiceLocation,
        );

  final OnMutationCompleted$Mutation$updateServiceLocation?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateServiceLocation
    extends graphql.WatchQueryOptions<Mutation$updateServiceLocation> {
  WatchOptions$Mutation$updateServiceLocation({
    String? operationName,
    required Variables$Mutation$updateServiceLocation variables,
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
          document: documentNodeMutationupdateServiceLocation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateServiceLocation,
        );
}

extension ClientExtension$Mutation$updateServiceLocation
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateServiceLocation>>
      mutate$updateServiceLocation(
              Options$Mutation$updateServiceLocation options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateServiceLocation>
      watchMutation$updateServiceLocation(
              WatchOptions$Mutation$updateServiceLocation options) =>
          this.watchMutation(options);
}

class Mutation$updateServiceLocation$update_service_provider_location_by_pk {
  Mutation$updateServiceLocation$update_service_provider_location_by_pk({
    required this.address,
    required this.gps,
    required this.id,
    required this.$__typename,
  });

  factory Mutation$updateServiceLocation$update_service_provider_location_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$address = json['address'];
    final l$gps = json['gps'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$updateServiceLocation$update_service_provider_location_by_pk(
      address: (l$address as String),
      gps: geographyFromJson(l$gps),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String address;

  final Geography gps;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$address = address;
    _resultData['address'] = l$address;
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$address = address;
    final l$gps = gps;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$address,
      l$gps,
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateServiceLocation$update_service_provider_location_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
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

extension UtilityExtension$Mutation$updateServiceLocation$update_service_provider_location_by_pk
    on Mutation$updateServiceLocation$update_service_provider_location_by_pk {
  CopyWith$Mutation$updateServiceLocation$update_service_provider_location_by_pk<
          Mutation$updateServiceLocation$update_service_provider_location_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateServiceLocation$update_service_provider_location_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateServiceLocation$update_service_provider_location_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateServiceLocation$update_service_provider_location_by_pk(
    Mutation$updateServiceLocation$update_service_provider_location_by_pk
        instance,
    TRes Function(
            Mutation$updateServiceLocation$update_service_provider_location_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateServiceLocation$update_service_provider_location_by_pk;

  factory CopyWith$Mutation$updateServiceLocation$update_service_provider_location_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateServiceLocation$update_service_provider_location_by_pk;

  TRes call({
    String? address,
    Geography? gps,
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateServiceLocation$update_service_provider_location_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateServiceLocation$update_service_provider_location_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateServiceLocation$update_service_provider_location_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateServiceLocation$update_service_provider_location_by_pk
      _instance;

  final TRes Function(
          Mutation$updateServiceLocation$update_service_provider_location_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? address = _undefined,
    Object? gps = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateServiceLocation$update_service_provider_location_by_pk(
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateServiceLocation$update_service_provider_location_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateServiceLocation$update_service_provider_location_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateServiceLocation$update_service_provider_location_by_pk(
      this._res);

  TRes _res;

  call({
    String? address,
    Geography? gps,
    int? id,
    String? $__typename,
  }) =>
      _res;
}
