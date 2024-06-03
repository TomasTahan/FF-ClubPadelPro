import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'Users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(super.data);

  @override
  SupabaseTable get table => UsersTable();

  String get userId => getField<String>('userId')!;
  set userId(String value) => setField<String>('userId', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  String? get apellido => getField<String>('apellido');
  set apellido(String? value) => setField<String>('apellido', value);

  double? get categoria => getField<double>('categoria');
  set categoria(double? value) => setField<double>('categoria', value);

  String? get lado => getField<String>('lado');
  set lado(String? value) => setField<String>('lado', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  dynamic get clubes => getField<dynamic>('clubes');
  set clubes(dynamic value) => setField<dynamic>('clubes', value);

  List<int> get rankingHistorico => getListField<int>('rankingHistorico');
  set rankingHistorico(List<int>? value) =>
      setListField<int>('rankingHistorico', value);

  int? get ranking => getField<int>('ranking');
  set ranking(int? value) => setField<int>('ranking', value);

  String? get avatarUrl => getField<String>('avatarUrl');
  set avatarUrl(String? value) => setField<String>('avatarUrl', value);

  String? get apodo => getField<String>('apodo');
  set apodo(String? value) => setField<String>('apodo', value);

  String? get genero => getField<String>('genero');
  set genero(String? value) => setField<String>('genero', value);

  String? get avatarHashUrl => getField<String>('avatarHashUrl');
  set avatarHashUrl(String? value) => setField<String>('avatarHashUrl', value);

  String? get contrasena => getField<String>('contraseña');
  set contrasena(String? value) => setField<String>('contraseña', value);

  String? get rol => getField<String>('Rol');
  set rol(String? value) => setField<String>('Rol', value);

  int? get clubFavorito => getField<int>('clubFavorito');
  set clubFavorito(int? value) => setField<int>('clubFavorito', value);
}
