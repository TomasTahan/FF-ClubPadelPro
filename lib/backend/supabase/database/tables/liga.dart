import '../database.dart';

class LigaTable extends SupabaseTable<LigaRow> {
  @override
  String get tableName => 'Liga';

  @override
  LigaRow createRow(Map<String, dynamic> data) => LigaRow(data);
}

class LigaRow extends SupabaseDataRow {
  LigaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LigaTable();

  int get ligaId => getField<int>('ligaId')!;
  set ligaId(int value) => setField<int>('ligaId', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  DateTime? get inicio => getField<DateTime>('inicio');
  set inicio(DateTime? value) => setField<DateTime>('inicio', value);

  DateTime? get fin => getField<DateTime>('fin');
  set fin(DateTime? value) => setField<DateTime>('fin', value);

  String? get ubicacion => getField<String>('ubicacion');
  set ubicacion(String? value) => setField<String>('ubicacion', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);

  int? get precio => getField<int>('precio');
  set precio(int? value) => setField<int>('precio', value);

  bool? get anotarResultados => getField<bool>('anotarResultados');
  set anotarResultados(bool? value) =>
      setField<bool>('anotarResultados', value);
}
