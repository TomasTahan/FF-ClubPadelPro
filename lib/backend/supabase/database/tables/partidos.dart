import '../database.dart';

class PartidosTable extends SupabaseTable<PartidosRow> {
  @override
  String get tableName => 'Partidos';

  @override
  PartidosRow createRow(Map<String, dynamic> data) => PartidosRow(data);
}

class PartidosRow extends SupabaseDataRow {
  PartidosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PartidosTable();

  int get partidoId => getField<int>('partidoId')!;
  set partidoId(int value) => setField<int>('partidoId', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  String? get createdBy => getField<String>('createdBy');
  set createdBy(String? value) => setField<String>('createdBy', value);

  String? get playerIdA => getField<String>('playerIdA');
  set playerIdA(String? value) => setField<String>('playerIdA', value);

  String? get playerIdB => getField<String>('playerIdB');
  set playerIdB(String? value) => setField<String>('playerIdB', value);

  String? get playerIdC => getField<String>('playerIdC');
  set playerIdC(String? value) => setField<String>('playerIdC', value);

  String? get playerIdD => getField<String>('playerIdD');
  set playerIdD(String? value) => setField<String>('playerIdD', value);

  DateTime? get fecha => getField<DateTime>('fecha');
  set fecha(DateTime? value) => setField<DateTime>('fecha', value);

  String? get inicio => getField<String>('inicio');
  set inicio(String? value) => setField<String>('inicio', value);

  String? get fin => getField<String>('fin');
  set fin(String? value) => setField<String>('fin', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);

  List<String> get resultado => getListField<String>('resultado');
  set resultado(List<String>? value) =>
      setListField<String>('resultado', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);
}
