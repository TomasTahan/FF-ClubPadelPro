import '../database.dart';

class AmericanoPartidosTable extends SupabaseTable<AmericanoPartidosRow> {
  @override
  String get tableName => 'AmericanoPartidos';

  @override
  AmericanoPartidosRow createRow(Map<String, dynamic> data) =>
      AmericanoPartidosRow(data);
}

class AmericanoPartidosRow extends SupabaseDataRow {
  AmericanoPartidosRow(super.data);

  @override
  SupabaseTable get table => AmericanoPartidosTable();

  int get partidosId => getField<int>('partidosId')!;
  set partidosId(int value) => setField<int>('partidosId', value);

  int? get pareja1 => getField<int>('pareja1');
  set pareja1(int? value) => setField<int>('pareja1', value);

  int? get pareja2 => getField<int>('pareja2');
  set pareja2(int? value) => setField<int>('pareja2', value);

  String? get set1 => getField<String>('set1');
  set set1(String? value) => setField<String>('set1', value);

  String? get set2 => getField<String>('set2');
  set set2(String? value) => setField<String>('set2', value);

  String? get set3 => getField<String>('set3');
  set set3(String? value) => setField<String>('set3', value);

  String? get americanoId => getField<String>('americanoId');
  set americanoId(String? value) => setField<String>('americanoId', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);

  String? get copa => getField<String>('copa');
  set copa(String? value) => setField<String>('copa', value);

  int? get cancha => getField<int>('cancha');
  set cancha(int? value) => setField<int>('cancha', value);
}
