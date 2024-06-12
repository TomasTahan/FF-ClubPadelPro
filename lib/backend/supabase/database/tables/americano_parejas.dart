import '../database.dart';

class AmericanoParejasTable extends SupabaseTable<AmericanoParejasRow> {
  @override
  String get tableName => 'AmericanoParejas';

  @override
  AmericanoParejasRow createRow(Map<String, dynamic> data) =>
      AmericanoParejasRow(data);
}

class AmericanoParejasRow extends SupabaseDataRow {
  AmericanoParejasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AmericanoParejasTable();

  int get parejaId => getField<int>('parejaId')!;
  set parejaId(int value) => setField<int>('parejaId', value);

  String? get jugador1 => getField<String>('jugador1');
  set jugador1(String? value) => setField<String>('jugador1', value);

  String? get jugador2 => getField<String>('jugador2');
  set jugador2(String? value) => setField<String>('jugador2', value);

  int? get grupo => getField<int>('grupo');
  set grupo(int? value) => setField<int>('grupo', value);

  int? get puntos => getField<int>('puntos');
  set puntos(int? value) => setField<int>('puntos', value);

  String? get americanoId => getField<String>('americanoId');
  set americanoId(String? value) => setField<String>('americanoId', value);
}
