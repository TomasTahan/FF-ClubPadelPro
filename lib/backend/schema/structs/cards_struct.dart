// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardsStruct extends BaseStruct {
  CardsStruct({
    String? token,
    String? last4,
    String? type,
  })  : _token = token,
        _last4 = last4,
        _type = type;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;
  bool hasToken() => _token != null;

  // "last4" field.
  String? _last4;
  String get last4 => _last4 ?? '';
  set last4(String? val) => _last4 = val;
  bool hasLast4() => _last4 != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  static CardsStruct fromMap(Map<String, dynamic> data) => CardsStruct(
        token: data['token'] as String?,
        last4: data['last4'] as String?,
        type: data['type'] as String?,
      );

  static CardsStruct? maybeFromMap(dynamic data) =>
      data is Map ? CardsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'token': _token,
        'last4': _last4,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'last4': serializeParam(
          _last4,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static CardsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CardsStruct(
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        last4: deserializeParam(
          data['last4'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CardsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CardsStruct &&
        token == other.token &&
        last4 == other.last4 &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([token, last4, type]);
}

CardsStruct createCardsStruct({
  String? token,
  String? last4,
  String? type,
}) =>
    CardsStruct(
      token: token,
      last4: last4,
      type: type,
    );
