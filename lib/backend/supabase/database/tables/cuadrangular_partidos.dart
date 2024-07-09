import '../database.dart';

class CuadrangularPartidosTable extends SupabaseTable<CuadrangularPartidosRow> {
  @override
  String get tableName => 'CuadrangularPartidos';

  @override
  CuadrangularPartidosRow createRow(Map<String, dynamic> data) =>
      CuadrangularPartidosRow(data);
}

class CuadrangularPartidosRow extends SupabaseDataRow {
  CuadrangularPartidosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CuadrangularPartidosTable();

  int get partidoId => getField<int>('partidoId')!;
  set partidoId(int value) => setField<int>('partidoId', value);

  int? get pareja1 => getField<int>('pareja1');
  set pareja1(int? value) => setField<int>('pareja1', value);

  int? get pareja2 => getField<int>('pareja2');
  set pareja2(int? value) => setField<int>('pareja2', value);

  String? get set1 => getField<String>('set1');
  set set1(String? value) => setField<String>('set1', value);

  int? get fase => getField<int>('fase');
  set fase(int? value) => setField<int>('fase', value);

  int? get cuadrangularId => getField<int>('cuadrangularId');
  set cuadrangularId(int? value) => setField<int>('cuadrangularId', value);
}
