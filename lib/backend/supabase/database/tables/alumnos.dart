import '../database.dart';

class AlumnosTable extends SupabaseTable<AlumnosRow> {
  @override
  String get tableName => 'Alumnos';

  @override
  AlumnosRow createRow(Map<String, dynamic> data) => AlumnosRow(data);
}

class AlumnosRow extends SupabaseDataRow {
  AlumnosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AlumnosTable();

  String get alumnoId => getField<String>('alumnoId')!;
  set alumnoId(String value) => setField<String>('alumnoId', value);

  int? get totales => getField<int>('totales');
  set totales(int? value) => setField<int>('totales', value);

  int? get pendientes => getField<int>('pendientes');
  set pendientes(int? value) => setField<int>('pendientes', value);

  int? get pagadas => getField<int>('pagadas');
  set pagadas(int? value) => setField<int>('pagadas', value);
}
