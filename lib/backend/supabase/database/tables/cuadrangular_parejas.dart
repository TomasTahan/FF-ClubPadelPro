import '../database.dart';

class CuadrangularParejasTable extends SupabaseTable<CuadrangularParejasRow> {
  @override
  String get tableName => 'CuadrangularParejas';

  @override
  CuadrangularParejasRow createRow(Map<String, dynamic> data) =>
      CuadrangularParejasRow(data);
}

class CuadrangularParejasRow extends SupabaseDataRow {
  CuadrangularParejasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CuadrangularParejasTable();

  int get parejaId => getField<int>('parejaId')!;
  set parejaId(int value) => setField<int>('parejaId', value);

  int? get cuadrangularId => getField<int>('cuadrangularId');
  set cuadrangularId(int? value) => setField<int>('cuadrangularId', value);

  String? get jugador1 => getField<String>('jugador1');
  set jugador1(String? value) => setField<String>('jugador1', value);

  String? get jugador2 => getField<String>('jugador2');
  set jugador2(String? value) => setField<String>('jugador2', value);

  int? get puntos => getField<int>('puntos');
  set puntos(int? value) => setField<int>('puntos', value);
}
