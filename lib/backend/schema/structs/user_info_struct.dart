// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInfoStruct extends BaseStruct {
  UserInfoStruct({
    String? userId,
    String? nombre,
    String? apellido,
    String? email,
    String? saldo,
    int? ranking,
    List<int>? rankingHistorico,
    String? avatarUrl,
    String? avatarHashUrl,
    String? categoria,
    String? genero,
    String? lado,
    String? apodo,
    DateTime? createdAt,
    String? rol,
  })  : _userId = userId,
        _nombre = nombre,
        _apellido = apellido,
        _email = email,
        _saldo = saldo,
        _ranking = ranking,
        _rankingHistorico = rankingHistorico,
        _avatarUrl = avatarUrl,
        _avatarHashUrl = avatarHashUrl,
        _categoria = categoria,
        _genero = genero,
        _lado = lado,
        _apodo = apodo,
        _createdAt = createdAt,
        _rol = rol;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "apellido" field.
  String? _apellido;
  String get apellido => _apellido ?? '';
  set apellido(String? val) => _apellido = val;

  bool hasApellido() => _apellido != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "saldo" field.
  String? _saldo;
  String get saldo => _saldo ?? '';
  set saldo(String? val) => _saldo = val;

  bool hasSaldo() => _saldo != null;

  // "ranking" field.
  int? _ranking;
  int get ranking => _ranking ?? 0;
  set ranking(int? val) => _ranking = val;

  void incrementRanking(int amount) => ranking = ranking + amount;

  bool hasRanking() => _ranking != null;

  // "rankingHistorico" field.
  List<int>? _rankingHistorico;
  List<int> get rankingHistorico => _rankingHistorico ?? const [];
  set rankingHistorico(List<int>? val) => _rankingHistorico = val;

  void updateRankingHistorico(Function(List<int>) updateFn) {
    updateFn(rankingHistorico ??= []);
  }

  bool hasRankingHistorico() => _rankingHistorico != null;

  // "avatarUrl" field.
  String? _avatarUrl;
  String get avatarUrl => _avatarUrl ?? '';
  set avatarUrl(String? val) => _avatarUrl = val;

  bool hasAvatarUrl() => _avatarUrl != null;

  // "avatarHashUrl" field.
  String? _avatarHashUrl;
  String get avatarHashUrl => _avatarHashUrl ?? '';
  set avatarHashUrl(String? val) => _avatarHashUrl = val;

  bool hasAvatarHashUrl() => _avatarHashUrl != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  set genero(String? val) => _genero = val;

  bool hasGenero() => _genero != null;

  // "lado" field.
  String? _lado;
  String get lado => _lado ?? '';
  set lado(String? val) => _lado = val;

  bool hasLado() => _lado != null;

  // "apodo" field.
  String? _apodo;
  String get apodo => _apodo ?? '';
  set apodo(String? val) => _apodo = val;

  bool hasApodo() => _apodo != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "Rol" field.
  String? _rol;
  String get rol => _rol ?? '';
  set rol(String? val) => _rol = val;

  bool hasRol() => _rol != null;

  static UserInfoStruct fromMap(Map<String, dynamic> data) => UserInfoStruct(
        userId: data['userId'] as String?,
        nombre: data['nombre'] as String?,
        apellido: data['apellido'] as String?,
        email: data['email'] as String?,
        saldo: data['saldo'] as String?,
        ranking: castToType<int>(data['ranking']),
        rankingHistorico: getDataList(data['rankingHistorico']),
        avatarUrl: data['avatarUrl'] as String?,
        avatarHashUrl: data['avatarHashUrl'] as String?,
        categoria: data['categoria'] as String?,
        genero: data['genero'] as String?,
        lado: data['lado'] as String?,
        apodo: data['apodo'] as String?,
        createdAt: data['createdAt'] as DateTime?,
        rol: data['Rol'] as String?,
      );

  static UserInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'userId': _userId,
        'nombre': _nombre,
        'apellido': _apellido,
        'email': _email,
        'saldo': _saldo,
        'ranking': _ranking,
        'rankingHistorico': _rankingHistorico,
        'avatarUrl': _avatarUrl,
        'avatarHashUrl': _avatarHashUrl,
        'categoria': _categoria,
        'genero': _genero,
        'lado': _lado,
        'apodo': _apodo,
        'createdAt': _createdAt,
        'Rol': _rol,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'apellido': serializeParam(
          _apellido,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'saldo': serializeParam(
          _saldo,
          ParamType.String,
        ),
        'ranking': serializeParam(
          _ranking,
          ParamType.int,
        ),
        'rankingHistorico': serializeParam(
          _rankingHistorico,
          ParamType.int,
          isList: true,
        ),
        'avatarUrl': serializeParam(
          _avatarUrl,
          ParamType.String,
        ),
        'avatarHashUrl': serializeParam(
          _avatarHashUrl,
          ParamType.String,
        ),
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'genero': serializeParam(
          _genero,
          ParamType.String,
        ),
        'lado': serializeParam(
          _lado,
          ParamType.String,
        ),
        'apodo': serializeParam(
          _apodo,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'Rol': serializeParam(
          _rol,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInfoStruct(
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        apellido: deserializeParam(
          data['apellido'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        saldo: deserializeParam(
          data['saldo'],
          ParamType.String,
          false,
        ),
        ranking: deserializeParam(
          data['ranking'],
          ParamType.int,
          false,
        ),
        rankingHistorico: deserializeParam<int>(
          data['rankingHistorico'],
          ParamType.int,
          true,
        ),
        avatarUrl: deserializeParam(
          data['avatarUrl'],
          ParamType.String,
          false,
        ),
        avatarHashUrl: deserializeParam(
          data['avatarHashUrl'],
          ParamType.String,
          false,
        ),
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        genero: deserializeParam(
          data['genero'],
          ParamType.String,
          false,
        ),
        lado: deserializeParam(
          data['lado'],
          ParamType.String,
          false,
        ),
        apodo: deserializeParam(
          data['apodo'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        rol: deserializeParam(
          data['Rol'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserInfoStruct &&
        userId == other.userId &&
        nombre == other.nombre &&
        apellido == other.apellido &&
        email == other.email &&
        saldo == other.saldo &&
        ranking == other.ranking &&
        listEquality.equals(rankingHistorico, other.rankingHistorico) &&
        avatarUrl == other.avatarUrl &&
        avatarHashUrl == other.avatarHashUrl &&
        categoria == other.categoria &&
        genero == other.genero &&
        lado == other.lado &&
        apodo == other.apodo &&
        createdAt == other.createdAt &&
        rol == other.rol;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userId,
        nombre,
        apellido,
        email,
        saldo,
        ranking,
        rankingHistorico,
        avatarUrl,
        avatarHashUrl,
        categoria,
        genero,
        lado,
        apodo,
        createdAt,
        rol
      ]);
}

UserInfoStruct createUserInfoStruct({
  String? userId,
  String? nombre,
  String? apellido,
  String? email,
  String? saldo,
  int? ranking,
  String? avatarUrl,
  String? avatarHashUrl,
  String? categoria,
  String? genero,
  String? lado,
  String? apodo,
  DateTime? createdAt,
  String? rol,
}) =>
    UserInfoStruct(
      userId: userId,
      nombre: nombre,
      apellido: apellido,
      email: email,
      saldo: saldo,
      ranking: ranking,
      avatarUrl: avatarUrl,
      avatarHashUrl: avatarHashUrl,
      categoria: categoria,
      genero: genero,
      lado: lado,
      apodo: apodo,
      createdAt: createdAt,
      rol: rol,
    );
