import '../database.dart';

class ClasesTable extends SupabaseTable<ClasesRow> {
  @override
  String get tableName => 'Clases';

  @override
  ClasesRow createRow(Map<String, dynamic> data) => ClasesRow(data);
}

class ClasesRow extends SupabaseDataRow {
  ClasesRow(super.data);

  @override
  SupabaseTable get table => ClasesTable();

  int get claseId => getField<int>('claseId')!;
  set claseId(int value) => setField<int>('claseId', value);

  DateTime? get fecha => getField<DateTime>('fecha');
  set fecha(DateTime? value) => setField<DateTime>('fecha', value);

  String? get inicio => getField<String>('inicio');
  set inicio(String? value) => setField<String>('inicio', value);

  String? get fin => getField<String>('fin');
  set fin(String? value) => setField<String>('fin', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  bool? get pagada => getField<bool>('pagada');
  set pagada(bool? value) => setField<bool>('pagada', value);

  int? get cancha => getField<int>('cancha');
  set cancha(int? value) => setField<int>('cancha', value);

  String? get alumnoId => getField<String>('alumnoId');
  set alumnoId(String? value) => setField<String>('alumnoId', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);

  String? get profesorId => getField<String>('profesorId');
  set profesorId(String? value) => setField<String>('profesorId', value);
}
