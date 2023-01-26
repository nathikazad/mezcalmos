import '../../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Mutation$updateServiceLocation {
  factory Variables$Mutation$updateServiceLocation({
    required int serviceId,
    String? serviceType,
    Input$service_provider_location_set_input? data,
  }) =>
      Variables$Mutation$updateServiceLocation._({
        r'serviceId': serviceId,
        if (serviceType != null) r'serviceType': serviceType,
        if (data != null) r'data': data,
      });

  Variables$Mutation$updateServiceLocation._(this._$data);

  factory Variables$Mutation$updateServiceLocation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceId = data['serviceId'];
    result$data['serviceId'] = (l$serviceId as int);
    if (data.containsKey('serviceType')) {
      final l$serviceType = data['serviceType'];
      result$data['serviceType'] = (l$serviceType as String?);
    }
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

  int get serviceId => (_$data['serviceId'] as int);
  String? get serviceType => (_$data['serviceType'] as String?);
  Input$service_provider_location_set_input? get data =>
      (_$data['data'] as Input$service_provider_location_set_input?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceId = serviceId;
    result$data['serviceId'] = l$serviceId;
    if (_$data.containsKey('serviceType')) {
      final l$serviceType = serviceType;
      result$data['serviceType'] = l$serviceType;
    }
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
    final l$serviceId = serviceId;
    final lOther$serviceId = other.serviceId;
    if (l$serviceId != lOther$serviceId) {
      return false;
    }
    final l$serviceType = serviceType;
    final lOther$serviceType = other.serviceType;
    if (_$data.containsKey('serviceType') !=
        other._$data.containsKey('serviceType')) {
      return false;
    }
    if (l$serviceType != lOther$serviceType) {
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
    final l$serviceId = serviceId;
    final l$serviceType = serviceType;
    final l$data = data;
    return Object.hashAll([
      l$serviceId,
      _$data.containsKey('serviceType') ? l$serviceType : const {},
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
    int? serviceId,
    String? serviceType,
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
    Object? serviceId = _undefined,
    Object? serviceType = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateServiceLocation._({
        ..._instance._$data,
        if (serviceId != _undefined && serviceId != null)
          'serviceId': (serviceId as int),
        if (serviceType != _undefined) 'serviceType': (serviceType as String?),
        if (data != _undefined)
          'data': (data as Input$service_provider_location_set_input?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateServiceLocation<TRes>
    implements CopyWith$Variables$Mutation$updateServiceLocation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateServiceLocation(this._res);

  TRes _res;

  call({
    int? serviceId,
    String? serviceType,
    Input$service_provider_location_set_input? data,
  }) =>
      _res;
}

class Mutation$updateServiceLocation {
  Mutation$updateServiceLocation({
    this.update_service_provider_location,
    required this.$__typename,
  });

  factory Mutation$updateServiceLocation.fromJson(Map<String, dynamic> json) {
    final l$update_service_provider_location =
        json['update_service_provider_location'];
    final l$$__typename = json['__typename'];
    return Mutation$updateServiceLocation(
      update_service_provider_location: l$update_service_provider_location ==
              null
          ? null
          : Mutation$updateServiceLocation$update_service_provider_location
              .fromJson(
                  (l$update_service_provider_location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateServiceLocation$update_service_provider_location?
      update_service_provider_location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_service_provider_location = update_service_provider_location;
    _resultData['update_service_provider_location'] =
        l$update_service_provider_location?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_service_provider_location = update_service_provider_location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_service_provider_location,
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
    final l$update_service_provider_location = update_service_provider_location;
    final lOther$update_service_provider_location =
        other.update_service_provider_location;
    if (l$update_service_provider_location !=
        lOther$update_service_provider_location) {
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
    Mutation$updateServiceLocation$update_service_provider_location?
        update_service_provider_location,
    String? $__typename,
  });
  CopyWith$Mutation$updateServiceLocation$update_service_provider_location<TRes>
      get update_service_provider_location;
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
    Object? update_service_provider_location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateServiceLocation(
        update_service_provider_location: update_service_provider_location ==
                _undefined
            ? _instance.update_service_provider_location
            : (update_service_provider_location
                as Mutation$updateServiceLocation$update_service_provider_location?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateServiceLocation$update_service_provider_location<TRes>
      get update_service_provider_location {
    final local$update_service_provider_location =
        _instance.update_service_provider_location;
    return local$update_service_provider_location == null
        ? CopyWith$Mutation$updateServiceLocation$update_service_provider_location
            .stub(_then(_instance))
        : CopyWith$Mutation$updateServiceLocation$update_service_provider_location(
            local$update_service_provider_location,
            (e) => call(update_service_provider_location: e));
  }
}

class _CopyWithStubImpl$Mutation$updateServiceLocation<TRes>
    implements CopyWith$Mutation$updateServiceLocation<TRes> {
  _CopyWithStubImpl$Mutation$updateServiceLocation(this._res);

  TRes _res;

  call({
    Mutation$updateServiceLocation$update_service_provider_location?
        update_service_provider_location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateServiceLocation$update_service_provider_location<TRes>
      get update_service_provider_location =>
          CopyWith$Mutation$updateServiceLocation$update_service_provider_location
              .stub(_res);
}

const documentNodeMutationupdateServiceLocation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateServiceLocation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceType')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
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
        name: NameNode(value: 'update_service_provider_location'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'serviceId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'serviceType')),
                  )
                ]),
              ),
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
            name: NameNode(value: 'returning'),
            alias: null,
            arguments: [],
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
                name: NameNode(value: 'service_provider_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'service_provider_type'),
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
            name: NameNode(value: 'affected_rows'),
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

class Mutation$updateServiceLocation$update_service_provider_location {
  Mutation$updateServiceLocation$update_service_provider_location({
    required this.returning,
    required this.affected_rows,
    required this.$__typename,
  });

  factory Mutation$updateServiceLocation$update_service_provider_location.fromJson(
      Map<String, dynamic> json) {
    final l$returning = json['returning'];
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$updateServiceLocation$update_service_provider_location(
      returning: (l$returning as List<dynamic>)
          .map((e) =>
              Mutation$updateServiceLocation$update_service_provider_location$returning
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      affected_rows: (l$affected_rows as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Mutation$updateServiceLocation$update_service_provider_location$returning>
      returning;

  final int affected_rows;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$returning = returning;
    _resultData['returning'] = l$returning.map((e) => e.toJson()).toList();
    final l$affected_rows = affected_rows;
    _resultData['affected_rows'] = l$affected_rows;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$returning = returning;
    final l$affected_rows = affected_rows;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$returning.map((v) => v)),
      l$affected_rows,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateServiceLocation$update_service_provider_location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$returning = returning;
    final lOther$returning = other.returning;
    if (l$returning.length != lOther$returning.length) {
      return false;
    }
    for (int i = 0; i < l$returning.length; i++) {
      final l$returning$entry = l$returning[i];
      final lOther$returning$entry = lOther$returning[i];
      if (l$returning$entry != lOther$returning$entry) {
        return false;
      }
    }
    final l$affected_rows = affected_rows;
    final lOther$affected_rows = other.affected_rows;
    if (l$affected_rows != lOther$affected_rows) {
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

extension UtilityExtension$Mutation$updateServiceLocation$update_service_provider_location
    on Mutation$updateServiceLocation$update_service_provider_location {
  CopyWith$Mutation$updateServiceLocation$update_service_provider_location<
          Mutation$updateServiceLocation$update_service_provider_location>
      get copyWith =>
          CopyWith$Mutation$updateServiceLocation$update_service_provider_location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateServiceLocation$update_service_provider_location<
    TRes> {
  factory CopyWith$Mutation$updateServiceLocation$update_service_provider_location(
    Mutation$updateServiceLocation$update_service_provider_location instance,
    TRes Function(
            Mutation$updateServiceLocation$update_service_provider_location)
        then,
  ) = _CopyWithImpl$Mutation$updateServiceLocation$update_service_provider_location;

  factory CopyWith$Mutation$updateServiceLocation$update_service_provider_location.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateServiceLocation$update_service_provider_location;

  TRes call({
    List<Mutation$updateServiceLocation$update_service_provider_location$returning>?
        returning,
    int? affected_rows,
    String? $__typename,
  });
  TRes returning(
      Iterable<Mutation$updateServiceLocation$update_service_provider_location$returning> Function(
              Iterable<
                  CopyWith$Mutation$updateServiceLocation$update_service_provider_location$returning<
                      Mutation$updateServiceLocation$update_service_provider_location$returning>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateServiceLocation$update_service_provider_location<
        TRes>
    implements
        CopyWith$Mutation$updateServiceLocation$update_service_provider_location<
            TRes> {
  _CopyWithImpl$Mutation$updateServiceLocation$update_service_provider_location(
    this._instance,
    this._then,
  );

  final Mutation$updateServiceLocation$update_service_provider_location
      _instance;

  final TRes Function(
      Mutation$updateServiceLocation$update_service_provider_location) _then;

  static const _undefined = {};

  TRes call({
    Object? returning = _undefined,
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateServiceLocation$update_service_provider_location(
        returning: returning == _undefined || returning == null
            ? _instance.returning
            : (returning as List<
                Mutation$updateServiceLocation$update_service_provider_location$returning>),
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes returning(
          Iterable<Mutation$updateServiceLocation$update_service_provider_location$returning> Function(
                  Iterable<
                      CopyWith$Mutation$updateServiceLocation$update_service_provider_location$returning<
                          Mutation$updateServiceLocation$update_service_provider_location$returning>>)
              _fn) =>
      call(
          returning: _fn(_instance.returning.map((e) =>
              CopyWith$Mutation$updateServiceLocation$update_service_provider_location$returning(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateServiceLocation$update_service_provider_location<
        TRes>
    implements
        CopyWith$Mutation$updateServiceLocation$update_service_provider_location<
            TRes> {
  _CopyWithStubImpl$Mutation$updateServiceLocation$update_service_provider_location(
      this._res);

  TRes _res;

  call({
    List<Mutation$updateServiceLocation$update_service_provider_location$returning>?
        returning,
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
  returning(_fn) => _res;
}

class Mutation$updateServiceLocation$update_service_provider_location$returning {
  Mutation$updateServiceLocation$update_service_provider_location$returning({
    this.address,
    required this.gps,
    required this.id,
    required this.service_provider_id,
    required this.service_provider_type,
    required this.$__typename,
  });

  factory Mutation$updateServiceLocation$update_service_provider_location$returning.fromJson(
      Map<String, dynamic> json) {
    final l$address = json['address'];
    final l$gps = json['gps'];
    final l$id = json['id'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$$__typename = json['__typename'];
    return Mutation$updateServiceLocation$update_service_provider_location$returning(
      address: (l$address as String?),
      gps: geographyFromJson(l$gps),
      id: (l$id as int),
      service_provider_id: (l$service_provider_id as int),
      service_provider_type: (l$service_provider_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? address;

  final Geography gps;

  final int id;

  final int service_provider_id;

  final String service_provider_type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$address = address;
    _resultData['address'] = l$address;
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$address = address;
    final l$gps = gps;
    final l$id = id;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$address,
      l$gps,
      l$id,
      l$service_provider_id,
      l$service_provider_type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateServiceLocation$update_service_provider_location$returning) ||
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
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
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

extension UtilityExtension$Mutation$updateServiceLocation$update_service_provider_location$returning
    on Mutation$updateServiceLocation$update_service_provider_location$returning {
  CopyWith$Mutation$updateServiceLocation$update_service_provider_location$returning<
          Mutation$updateServiceLocation$update_service_provider_location$returning>
      get copyWith =>
          CopyWith$Mutation$updateServiceLocation$update_service_provider_location$returning(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateServiceLocation$update_service_provider_location$returning<
    TRes> {
  factory CopyWith$Mutation$updateServiceLocation$update_service_provider_location$returning(
    Mutation$updateServiceLocation$update_service_provider_location$returning
        instance,
    TRes Function(
            Mutation$updateServiceLocation$update_service_provider_location$returning)
        then,
  ) = _CopyWithImpl$Mutation$updateServiceLocation$update_service_provider_location$returning;

  factory CopyWith$Mutation$updateServiceLocation$update_service_provider_location$returning.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateServiceLocation$update_service_provider_location$returning;

  TRes call({
    String? address,
    Geography? gps,
    int? id,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateServiceLocation$update_service_provider_location$returning<
        TRes>
    implements
        CopyWith$Mutation$updateServiceLocation$update_service_provider_location$returning<
            TRes> {
  _CopyWithImpl$Mutation$updateServiceLocation$update_service_provider_location$returning(
    this._instance,
    this._then,
  );

  final Mutation$updateServiceLocation$update_service_provider_location$returning
      _instance;

  final TRes Function(
          Mutation$updateServiceLocation$update_service_provider_location$returning)
      _then;

  static const _undefined = {};

  TRes call({
    Object? address = _undefined,
    Object? gps = _undefined,
    Object? id = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateServiceLocation$update_service_provider_location$returning(
        address:
            address == _undefined ? _instance.address : (address as String?),
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateServiceLocation$update_service_provider_location$returning<
        TRes>
    implements
        CopyWith$Mutation$updateServiceLocation$update_service_provider_location$returning<
            TRes> {
  _CopyWithStubImpl$Mutation$updateServiceLocation$update_service_provider_location$returning(
      this._res);

  TRes _res;

  call({
    String? address,
    Geography? gps,
    int? id,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  }) =>
      _res;
}
