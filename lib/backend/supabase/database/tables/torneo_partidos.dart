import '../database.dart';

class TorneoPartidosTable extends SupabaseTable<TorneoPartidosRow> {
  @override
  String get tableName => 'TorneoPartidos';

  @override
  TorneoPartidosRow createRow(Map<String, dynamic> data) =>
      TorneoPartidosRow(data);
}

class TorneoPartidosRow extends SupabaseDataRow {
  TorneoPartidosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TorneoPartidosTable();

  int get partidoId => getField<int>('partidoId')!;
  set partidoId(int value) => setField<int>('partidoId', value);

  int? get parejaA => getField<int>('parejaA');
  set parejaA(int? value) => setField<int>('parejaA', value);

  int? get parejaB => getField<int>('parejaB');
  set parejaB(int? value) => setField<int>('parejaB', value);

  DateTime? get fecha => getField<DateTime>('fecha');
  set fecha(DateTime? value) => setField<DateTime>('fecha', value);

  String? get inicio => getField<String>('inicio');
  set inicio(String? value) => setField<String>('inicio', value);

  String? get fin => getField<String>('fin');
  set fin(String? value) => setField<String>('fin', value);

  List<String> get resultado => getListField<String>('resultado');
  set resultado(List<String>? value) =>
      setListField<String>('resultado', value);

  int? get cancha => getField<int>('cancha');
  set cancha(int? value) => setField<int>('cancha', value);

  String? get torneoId => getField<String>('torneoId');
  set torneoId(String? value) => setField<String>('torneoId', value);

  int? get fase => getField<int>('fase');
  set fase(int? value) => setField<int>('fase', value);
}
