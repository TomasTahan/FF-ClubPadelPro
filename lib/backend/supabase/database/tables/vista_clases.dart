import '../database.dart';

class VistaClasesTable extends SupabaseTable<VistaClasesRow> {
  @override
  String get tableName => 'VistaClases';

  @override
  VistaClasesRow createRow(Map<String, dynamic> data) => VistaClasesRow(data);
}

class VistaClasesRow extends SupabaseDataRow {
  VistaClasesRow(super.data);

  @override
  SupabaseTable get table => VistaClasesTable();

  int? get claseId => getField<int>('claseId');
  set claseId(int? value) => setField<int>('claseId', value);

  String? get profesorId => getField<String>('profesorId');
  set profesorId(String? value) => setField<String>('profesorId', value);

  String? get alumnoId => getField<String>('alumnoId');
  set alumnoId(String? value) => setField<String>('alumnoId', value);

  String? get nombreCompletoProfesor =>
      getField<String>('nombreCompletoProfesor');
  set nombreCompletoProfesor(String? value) =>
      setField<String>('nombreCompletoProfesor', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  int? get pendientes => getField<int>('pendientes');
  set pendientes(int? value) => setField<int>('pendientes', value);

  String? get fecha => getField<String>('fecha');
  set fecha(String? value) => setField<String>('fecha', value);

  String? get inicio => getField<String>('inicio');
  set inicio(String? value) => setField<String>('inicio', value);

  String? get fin => getField<String>('fin');
  set fin(String? value) => setField<String>('fin', value);

  int? get cancha => getField<int>('cancha');
  set cancha(int? value) => setField<int>('cancha', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);

  String? get estadoclase => getField<String>('estadoclase');
  set estadoclase(String? value) => setField<String>('estadoclase', value);
}
