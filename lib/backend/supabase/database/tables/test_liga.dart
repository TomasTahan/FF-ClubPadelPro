import '../database.dart';

class TestLigaTable extends SupabaseTable<TestLigaRow> {
  @override
  String get tableName => 'TestLiga';

  @override
  TestLigaRow createRow(Map<String, dynamic> data) => TestLigaRow(data);
}

class TestLigaRow extends SupabaseDataRow {
  TestLigaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TestLigaTable();

  int get parejaId => getField<int>('parejaId')!;
  set parejaId(int value) => setField<int>('parejaId', value);

  String? get user1 => getField<String>('user1');
  set user1(String? value) => setField<String>('user1', value);

  String? get user2 => getField<String>('user2');
  set user2(String? value) => setField<String>('user2', value);

  int? get pj => getField<int>('pj');
  set pj(int? value) => setField<int>('pj', value);

  int? get pg => getField<int>('pg');
  set pg(int? value) => setField<int>('pg', value);

  int? get pp => getField<int>('pp');
  set pp(int? value) => setField<int>('pp', value);

  int? get sf => getField<int>('sf');
  set sf(int? value) => setField<int>('sf', value);

  int? get sc => getField<int>('sc');
  set sc(int? value) => setField<int>('sc', value);

  int? get difS => getField<int>('difS');
  set difS(int? value) => setField<int>('difS', value);

  int? get jf => getField<int>('jf');
  set jf(int? value) => setField<int>('jf', value);

  int? get jc => getField<int>('jc');
  set jc(int? value) => setField<int>('jc', value);

  int? get difJ => getField<int>('difJ');
  set difJ(int? value) => setField<int>('difJ', value);

  int? get puntos => getField<int>('puntos');
  set puntos(int? value) => setField<int>('puntos', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);
}
