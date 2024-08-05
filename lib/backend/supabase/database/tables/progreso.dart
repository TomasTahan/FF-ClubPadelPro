import '../database.dart';

class ProgresoTable extends SupabaseTable<ProgresoRow> {
  @override
  String get tableName => 'Progreso';

  @override
  ProgresoRow createRow(Map<String, dynamic> data) => ProgresoRow(data);
}

class ProgresoRow extends SupabaseDataRow {
  ProgresoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProgresoTable();

  int get progresoId => getField<int>('progresoId')!;
  set progresoId(int value) => setField<int>('progresoId', value);

  int? get partidosTotales => getField<int>('partidosTotales');
  set partidosTotales(int? value) => setField<int>('partidosTotales', value);

  int? get partidosGanados => getField<int>('partidosGanados');
  set partidosGanados(int? value) => setField<int>('partidosGanados', value);

  int? get partidosPerdidos => getField<int>('partidosPerdidos');
  set partidosPerdidos(int? value) => setField<int>('partidosPerdidos', value);

  int? get torneosJugados => getField<int>('torneosJugados');
  set torneosJugados(int? value) => setField<int>('torneosJugados', value);

  List<int> get rankingHistorico => getListField<int>('rankingHistorico');
  set rankingHistorico(List<int>? value) =>
      setListField<int>('rankingHistorico', value);

  String? get userId => getField<String>('userId');
  set userId(String? value) => setField<String>('userId', value);

  int? get setsFavor => getField<int>('setsFavor');
  set setsFavor(int? value) => setField<int>('setsFavor', value);

  int? get setsContra => getField<int>('setsContra');
  set setsContra(int? value) => setField<int>('setsContra', value);
}
