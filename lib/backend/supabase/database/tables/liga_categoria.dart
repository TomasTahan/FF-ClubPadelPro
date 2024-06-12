import '../database.dart';

class LigaCategoriaTable extends SupabaseTable<LigaCategoriaRow> {
  @override
  String get tableName => 'LigaCategoria';

  @override
  LigaCategoriaRow createRow(Map<String, dynamic> data) =>
      LigaCategoriaRow(data);
}

class LigaCategoriaRow extends SupabaseDataRow {
  LigaCategoriaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LigaCategoriaTable();

  int get categoriaId => getField<int>('categoriaId')!;
  set categoriaId(int value) => setField<int>('categoriaId', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  int? get ligaId => getField<int>('ligaId');
  set ligaId(int? value) => setField<int>('ligaId', value);

  int? get num => getField<int>('num');
  set num(int? value) => setField<int>('num', value);
}
