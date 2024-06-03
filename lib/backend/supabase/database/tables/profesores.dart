import '../database.dart';

class ProfesoresTable extends SupabaseTable<ProfesoresRow> {
  @override
  String get tableName => 'Profesores';

  @override
  ProfesoresRow createRow(Map<String, dynamic> data) => ProfesoresRow(data);
}

class ProfesoresRow extends SupabaseDataRow {
  ProfesoresRow(super.data);

  @override
  SupabaseTable get table => ProfesoresTable();

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  String? get apellido => getField<String>('apellido');
  set apellido(String? value) => setField<String>('apellido', value);

  String? get descripcion => getField<String>('descripcion');
  set descripcion(String? value) => setField<String>('descripcion', value);

  int? get experiencia => getField<int>('experiencia');
  set experiencia(int? value) => setField<int>('experiencia', value);

  String? get horario => getField<String>('horario');
  set horario(String? value) => setField<String>('horario', value);

  String? get imagen => getField<String>('imagen');
  set imagen(String? value) => setField<String>('imagen', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);

  int? get celular => getField<int>('celular');
  set celular(int? value) => setField<int>('celular', value);

  int? get valor1Clase => getField<int>('valor1Clase');
  set valor1Clase(int? value) => setField<int>('valor1Clase', value);

  int? get valorPack4 => getField<int>('valorPack4');
  set valorPack4(int? value) => setField<int>('valorPack4', value);

  String? get hashUrl => getField<String>('hashUrl');
  set hashUrl(String? value) => setField<String>('hashUrl', value);

  String get profesorId => getField<String>('profesorId')!;
  set profesorId(String value) => setField<String>('profesorId', value);

  int? get canchaPreferida => getField<int>('canchaPreferida');
  set canchaPreferida(int? value) => setField<int>('canchaPreferida', value);

  int? get clasesTotales => getField<int>('clasesTotales');
  set clasesTotales(int? value) => setField<int>('clasesTotales', value);
}
