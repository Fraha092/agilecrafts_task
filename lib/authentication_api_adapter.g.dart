// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_api_adapter.dart';

// **************************************************************************
// RepositoryGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, duplicate_ignore

mixin $AuthServiceLocalAdapter on LocalAdapter<AuthService> {
  static final Map<String, RelationshipMeta> _kAuthServiceRelationshipMetas =
      {};

  @override
  Map<String, RelationshipMeta> get relationshipMetas =>
      _kAuthServiceRelationshipMetas;

  @override
  AuthService deserialize(map) {
    map = transformDeserialize(map);
    return _$AuthServiceFromJson(map);
  }

  @override
  Map<String, dynamic> serialize(model, {bool withRelationships = true}) {
    final map = _$AuthServiceToJson(model);
    return transformSerialize(map, withRelationships: withRelationships);
  }
}

final _authServicesFinders = <String, dynamic>{};

// ignore: must_be_immutable
class $AuthServiceHiveLocalAdapter = HiveLocalAdapter<AuthService>
    with $AuthServiceLocalAdapter;

class $AuthServiceRemoteAdapter = RemoteAdapter<AuthService>
    with JSONServerTaskAdapter;

final internalAuthServicesRemoteAdapterProvider =
    Provider<RemoteAdapter<AuthService>>((ref) => $AuthServiceRemoteAdapter(
        $AuthServiceHiveLocalAdapter(ref),
        InternalHolder(_authServicesFinders)));

final authServicesRepositoryProvider =
    Provider<Repository<AuthService>>((ref) => Repository<AuthService>(ref));

extension AuthServiceDataRepositoryX on Repository<AuthService> {
  JSONServerTaskAdapter get jSONServerTaskAdapter =>
      remoteAdapter as JSONServerTaskAdapter;
}

extension AuthServiceRelationshipGraphNodeX
    on RelationshipGraphNode<AuthService> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthService _$AuthServiceFromJson(Map<String, dynamic> json) => AuthService(
      id: json['id'] as int?,
    );

Map<String, dynamic> _$AuthServiceToJson(AuthService instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
