import '../database.dart';

class VistaStatsTable extends SupabaseTable<VistaStatsRow> {
  @override
  String get tableName => 'VistaStats';

  @override
  VistaStatsRow createRow(Map<String, dynamic> data) => VistaStatsRow(data);
}

class VistaStatsRow extends SupabaseDataRow {
  VistaStatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VistaStatsTable();

  String? get userId => getField<String>('userId');
  set userId(String? value) => setField<String>('userId', value);

  int? get ranking => getField<int>('ranking');
  set ranking(int? value) => setField<int>('ranking', value);

  int? get partidosJugados => getField<int>('partidos_jugados');
  set partidosJugados(int? value) => setField<int>('partidos_jugados', value);

  int? get partidosGanados => getField<int>('partidos_ganados');
  set partidosGanados(int? value) => setField<int>('partidos_ganados', value);

  int? get partidosPerdidos => getField<int>('partidos_perdidos');
  set partidosPerdidos(int? value) => setField<int>('partidos_perdidos', value);

  int? get porcentajeVictoria => getField<int>('porcentaje_victoria');
  set porcentajeVictoria(int? value) =>
      setField<int>('porcentaje_victoria', value);
}
