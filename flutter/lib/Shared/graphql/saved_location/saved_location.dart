// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/saved_location/__generated/saved_location.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

final HasuraDb hasuraDb = Get.find<HasuraDb>();

/// Fetch all Customer's SavedLocations.
///
/// [customer_id] is the user's hasuraId
Future<List<SavedLocation>> get_customer_locations(
    {required int customer_id}) async {
  final Query$get_customer_locations? _customer_saved_locations =
      hasuraDb.graphQLClient.readQuery$get_customer_locations(
          variables:
              Variables$Query$get_customer_locations(customer_id: customer_id));

  final List<SavedLocation> locations = _customer_saved_locations
          ?.customer_saved_location
          .map(
            (Query$get_customer_locations$customer_saved_location location) =>
                SavedLocation(
              name: location.name,
              defaultLocation: location.$default,
              id: location.id,
              location: LocModel.Location(
                location.location_text,
                location.location_gps.toLocationData(),
              ),
            ),
          )
          .toList() ??
      [];

  return locations;
}

Stream<List<SavedLocation>?> listen_on_customer_locations(
    {required int customer_id}) {
  return hasuraDb.graphQLClient
      .subscribe$listen_on_saved_locations(
    Options$Subscription$listen_on_saved_locations(
      variables: Variables$Subscription$listen_on_saved_locations(
          customer_id: customer_id),
    ),
  )
      .map<List<SavedLocation>?>(
          (QueryResult<Subscription$listen_on_saved_locations> locations_res) {
    if (locations_res.hasException) {
      mezDbgPrint(
          "[+] listen_on_customer_locations :: exception :: ${locations_res.exception}");
      return null;
    } else {
      final List<SavedLocation> ls = [];
      locations_res.parsedData?.customer_saved_location.forEach(
          (Subscription$listen_on_saved_locations$customer_saved_location
              location) {
        ls.add(
          SavedLocation(
            name: location.name,
            defaultLocation: location.$default,
            id: location.id,
            location: LocModel.Location(
              location.location_text,
              location.location_gps.toLocationData(),
            ),
          ),
        );
      });
      return ls;
    }
  });
}

/// Get one Customer's specific SavedLocation using a location's pk.
Future<SavedLocation?> get_saved_location({required int location_id}) async {
  final Query$get_saved_location_by_id$customer_saved_location_by_pk?
      _saved_location = hasuraDb.graphQLClient
          .readQuery$get_saved_location_by_id(
              variables: Variables$Query$get_saved_location_by_id(
                  location_id: location_id))
          ?.customer_saved_location_by_pk;

  return _saved_location != null
      ? SavedLocation(
          id: location_id,
          defaultLocation: _saved_location.$default,
          name: _saved_location.name,
          location: LocModel.Location(
            _saved_location.location_text,
            _saved_location.location_gps.toLocationData(),
          ),
        )
      : null;
}

/// Update a Customer's specific SavedLocation using it's pk.
Future<ServerResponse> update_saved_location(
    {required SavedLocation saved_location}) async {
  if (saved_location.id != null) {
    final Geography? _location_gps =
        saved_location.location.position.toGeography();
    if (_location_gps != null) {
      final QueryResult<Mutation$update_saved_location> _location_update =
          await hasuraDb.graphQLClient.mutate$update_saved_location(
        Options$Mutation$update_saved_location(
          variables: Variables$Mutation$update_saved_location(
            location_id: Input$customer_saved_location_pk_columns_input(
                id: saved_location.id!),
            $default: saved_location.defaultLocation,
            address: saved_location.location.address,
            name: saved_location.name,
            gps: _location_gps,
          ),
        ),
      );

      if (_location_update.hasException) {
        return ServerResponse(
          ResponseStatus.Error,
          errorMessage:
              "QueryResult has errors ${_location_update.exception?.toString()}",
        );
      }
      return ServerResponse(ResponseStatus.Success);
    }
  }

  return ServerResponse(
    ResponseStatus.Error,
    errorMessage:
        "Error : saved_location.location.position is null or id given is null!",
  );
}

/// delete a specific Customer's SavedLocation using the location's pk.
Future<ServerResponse> delete_saved_location(
    {required int saved_location_id}) async {
  final QueryResult<Mutation$delete_saved_location> _location_delete =
      await hasuraDb.graphQLClient.mutate$delete_saved_location(
    Options$Mutation$delete_saved_location(
      variables: Variables$Mutation$delete_saved_location(
        location_id: saved_location_id,
      ),
    ),
  );

  if (_location_delete.hasException) {
    return ServerResponse(
      ResponseStatus.Error,
      errorMessage:
          "QueryResult has errors ${_location_delete.exception?.toString()}",
    );
  }
  return ServerResponse(ResponseStatus.Success);
}

/// Add a new Customer's SavedLocation Entry.
///
/// [customer_id] is the user's hasuraId
Future<ServerResponse> add_saved_location(
    {required SavedLocation saved_location, required int customer_id}) async {
  final Geography? _location_gps = Geography(
      saved_location.location.latitude, saved_location.location.longitude);
  if (_location_gps != null) {
    final QueryResult<Mutation$add_saved_location> _location_add =
        await hasuraDb.graphQLClient.mutate$add_saved_location(
      Options$Mutation$add_saved_location(
        variables: Variables$Mutation$add_saved_location(
          saved_location: Input$customer_saved_location_insert_input(
            customer_id: customer_id,
            $default: saved_location.defaultLocation,
            location_gps: _location_gps,
            location_text: saved_location.location.address,
            name: saved_location.name,
          ),
        ),
      ),
    );

    if (_location_add.hasException) {
      return ServerResponse(
        ResponseStatus.Error,
        errorMessage:
            "QueryResult has errors ${_location_add.exception?.toString()}",
      );
    }
    return ServerResponse(ResponseStatus.Success);
  }
  return ServerResponse(
    ResponseStatus.Error,
    errorMessage: "Error : saved_location.location.position is null!",
  );
}
