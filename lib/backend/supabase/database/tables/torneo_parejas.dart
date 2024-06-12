import '../database.dart';

class TorneoParejasTable extends SupabaseTable<TorneoParejasRow> {
  @override
  String get tableName => 'TorneoParejas';

  @override
  TorneoParejasRow createRow(Map<String, dynamic> data) =>
      TorneoParejasRow(data);
}

class TorneoParejasRow extends SupabaseDataRow {
  TorneoParejasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TorneoParejasTable();

  int get parejaId => getField<int>('parejaId')!;
  set parejaId(int value) => setField<int>('parejaId', value);

  String? get userId1 => getField<String>('userId1');
  set userId1(String? value) => setField<String>('userId1', value);

  String? get userId2 => getField<String>('userId2');
  set userId2(String? value) => setField<String>('userId2', value);

  int? get pj => getField<int>('pj');
  set pj(int? value) => setField<int>('pj', value);

  int? get pg => getField<int>('pg');
  set pg(int? value) => setField<int>('pg', value);

  int? get pp => getField<int>('pp');
  set pp(int? value) => setField<int>('pp', value);

  int? get puntos => getField<int>('puntos');
  set puntos(int? value) => setField<int>('puntos', value);

  int? get grupo => getField<int>('grupo');
  set grupo(int? value) => setField<int>('grupo', value);

  int? get categoriaId => getField<int>('categoriaId');
  set categoriaId(int? value) => setField<int>('categoriaId', value);

  String? get pagado => getField<String>('pagado');
  set pagado(String? value) => setField<String>('pagado', value);

  String? get torneoId => getField<String>('torneoId');
  set torneoId(String? value) => setField<String>('torneoId', value);
}
