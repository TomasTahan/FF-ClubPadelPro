import '../database.dart';

class TorneoHorariosTable extends SupabaseTable<TorneoHorariosRow> {
  @override
  String get tableName => 'TorneoHorarios';

  @override
  TorneoHorariosRow createRow(Map<String, dynamic> data) =>
      TorneoHorariosRow(data);
}

class TorneoHorariosRow extends SupabaseDataRow {
  TorneoHorariosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TorneoHorariosTable();

  int get horarioId => getField<int>('horarioId')!;
  set horarioId(int value) => setField<int>('horarioId', value);

  String get torneoId => getField<String>('torneoId')!;
  set torneoId(String value) => setField<String>('torneoId', value);

  String get dia => getField<String>('dia')!;
  set dia(String value) => setField<String>('dia', value);

  PostgresTime get horaInicio => getField<PostgresTime>('horaInicio')!;
  set horaInicio(PostgresTime value) =>
      setField<PostgresTime>('horaInicio', value);

  PostgresTime get horaFin => getField<PostgresTime>('horaFin')!;
  set horaFin(PostgresTime value) => setField<PostgresTime>('horaFin', value);
}
