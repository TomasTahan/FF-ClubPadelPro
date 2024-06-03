import '../database.dart';

class CanchasTable extends SupabaseTable<CanchasRow> {
  @override
  String get tableName => 'Canchas';

  @override
  CanchasRow createRow(Map<String, dynamic> data) => CanchasRow(data);
}

class CanchasRow extends SupabaseDataRow {
  CanchasRow(super.data);

  @override
  SupabaseTable get table => CanchasTable();

  String get canchaId => getField<String>('canchaId')!;
  set canchaId(String value) => setField<String>('canchaId', value);

  DateTime? get fecha => getField<DateTime>('fecha');
  set fecha(DateTime? value) => setField<DateTime>('fecha', value);

  String? get inicio => getField<String>('inicio');
  set inicio(String? value) => setField<String>('inicio', value);

  String? get fin => getField<String>('fin');
  set fin(String? value) => setField<String>('fin', value);

  int? get cancha => getField<int>('cancha');
  set cancha(int? value) => setField<int>('cancha', value);

  String? get cliente => getField<String>('cliente');
  set cliente(String? value) => setField<String>('cliente', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);
}
