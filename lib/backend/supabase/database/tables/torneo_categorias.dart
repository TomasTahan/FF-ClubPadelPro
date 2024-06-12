import '../database.dart';

class TorneoCategoriasTable extends SupabaseTable<TorneoCategoriasRow> {
  @override
  String get tableName => 'TorneoCategorias';

  @override
  TorneoCategoriasRow createRow(Map<String, dynamic> data) =>
      TorneoCategoriasRow(data);
}

class TorneoCategoriasRow extends SupabaseDataRow {
  TorneoCategoriasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TorneoCategoriasTable();

  int get categoriaId => getField<int>('categoriaId')!;
  set categoriaId(int value) => setField<int>('categoriaId', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  int? get num => getField<int>('num');
  set num(int? value) => setField<int>('num', value);

  String? get torneoId => getField<String>('torneoId');
  set torneoId(String? value) => setField<String>('torneoId', value);
}
