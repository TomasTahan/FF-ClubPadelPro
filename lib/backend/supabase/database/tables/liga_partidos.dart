import '../database.dart';

class LigaPartidosTable extends SupabaseTable<LigaPartidosRow> {
  @override
  String get tableName => 'LigaPartidos';

  @override
  LigaPartidosRow createRow(Map<String, dynamic> data) => LigaPartidosRow(data);
}

class LigaPartidosRow extends SupabaseDataRow {
  LigaPartidosRow(super.data);

  @override
  SupabaseTable get table => LigaPartidosTable();

  int get partidoId => getField<int>('partidoId')!;
  set partidoId(int value) => setField<int>('partidoId', value);

  int? get parejaIdA => getField<int>('parejaIdA');
  set parejaIdA(int? value) => setField<int>('parejaIdA', value);

  int? get parejaIdB => getField<int>('parejaIdB');
  set parejaIdB(int? value) => setField<int>('parejaIdB', value);

  DateTime? get fecha => getField<DateTime>('fecha');
  set fecha(DateTime? value) => setField<DateTime>('fecha', value);

  String? get inicio => getField<String>('inicio');
  set inicio(String? value) => setField<String>('inicio', value);

  List<String> get resultado => getListField<String>('resultado');
  set resultado(List<String>? value) =>
      setListField<String>('resultado', value);

  String? get fin => getField<String>('fin');
  set fin(String? value) => setField<String>('fin', value);

  int? get cancha => getField<int>('cancha');
  set cancha(int? value) => setField<int>('cancha', value);
}
