import '../database.dart';

class TorneosTable extends SupabaseTable<TorneosRow> {
  @override
  String get tableName => 'Torneos';

  @override
  TorneosRow createRow(Map<String, dynamic> data) => TorneosRow(data);
}

class TorneosRow extends SupabaseDataRow {
  TorneosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TorneosTable();

  String get torneoId => getField<String>('torneoId')!;
  set torneoId(String value) => setField<String>('torneoId', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  DateTime? get inicio => getField<DateTime>('inicio');
  set inicio(DateTime? value) => setField<DateTime>('inicio', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);

  DateTime? get fin => getField<DateTime>('fin');
  set fin(DateTime? value) => setField<DateTime>('fin', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  int? get precio => getField<int>('precio');
  set precio(int? value) => setField<int>('precio', value);

  String? get ubicacion => getField<String>('ubicacion');
  set ubicacion(String? value) => setField<String>('ubicacion', value);
}
