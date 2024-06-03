import '../database.dart';

class LigaParejasTable extends SupabaseTable<LigaParejasRow> {
  @override
  String get tableName => 'LigaParejas';

  @override
  LigaParejasRow createRow(Map<String, dynamic> data) => LigaParejasRow(data);
}

class LigaParejasRow extends SupabaseDataRow {
  LigaParejasRow(super.data);

  @override
  SupabaseTable get table => LigaParejasTable();

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

  int? get ligaId => getField<int>('ligaId');
  set ligaId(int? value) => setField<int>('ligaId', value);

  String? get pagado => getField<String>('pagado');
  set pagado(String? value) => setField<String>('pagado', value);
}
