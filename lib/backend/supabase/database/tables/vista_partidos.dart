import '../database.dart';

class VistaPartidosTable extends SupabaseTable<VistaPartidosRow> {
  @override
  String get tableName => 'VistaPartidos';

  @override
  VistaPartidosRow createRow(Map<String, dynamic> data) =>
      VistaPartidosRow(data);
}

class VistaPartidosRow extends SupabaseDataRow {
  VistaPartidosRow(super.data);

  @override
  SupabaseTable get table => VistaPartidosTable();

  int? get partidoId => getField<int>('partidoId');
  set partidoId(int? value) => setField<int>('partidoId', value);

  String? get createdBy => getField<String>('createdBy');
  set createdBy(String? value) => setField<String>('createdBy', value);

  DateTime? get fecha => getField<DateTime>('fecha');
  set fecha(DateTime? value) => setField<DateTime>('fecha', value);

  String? get horaInicio => getField<String>('horaInicio');
  set horaInicio(String? value) => setField<String>('horaInicio', value);

  String? get horaFin => getField<String>('horaFin');
  set horaFin(String? value) => setField<String>('horaFin', value);

  String? get tipo => getField<String>('Tipo');
  set tipo(String? value) => setField<String>('Tipo', value);

  int? get rankingA => getField<int>('RankingA');
  set rankingA(int? value) => setField<int>('RankingA', value);

  String? get nombreA => getField<String>('nombreA');
  set nombreA(String? value) => setField<String>('nombreA', value);

  String? get uidA => getField<String>('uidA');
  set uidA(String? value) => setField<String>('uidA', value);

  String? get avatarA => getField<String>('avatarA');
  set avatarA(String? value) => setField<String>('avatarA', value);

  String? get hashA => getField<String>('hashA');
  set hashA(String? value) => setField<String>('hashA', value);

  String? get nombreB => getField<String>('nombreB');
  set nombreB(String? value) => setField<String>('nombreB', value);

  String? get uidB => getField<String>('uidB');
  set uidB(String? value) => setField<String>('uidB', value);

  String? get avatarB => getField<String>('avatarB');
  set avatarB(String? value) => setField<String>('avatarB', value);

  String? get hashB => getField<String>('hashB');
  set hashB(String? value) => setField<String>('hashB', value);

  String? get nombreC => getField<String>('nombreC');
  set nombreC(String? value) => setField<String>('nombreC', value);

  String? get uidC => getField<String>('uidC');
  set uidC(String? value) => setField<String>('uidC', value);

  String? get avatarC => getField<String>('avatarC');
  set avatarC(String? value) => setField<String>('avatarC', value);

  String? get hashC => getField<String>('hashC');
  set hashC(String? value) => setField<String>('hashC', value);

  String? get nombreD => getField<String>('nombreD');
  set nombreD(String? value) => setField<String>('nombreD', value);

  String? get uidD => getField<String>('uidD');
  set uidD(String? value) => setField<String>('uidD', value);

  String? get avatarD => getField<String>('avatarD');
  set avatarD(String? value) => setField<String>('avatarD', value);

  String? get hashD => getField<String>('hashD');
  set hashD(String? value) => setField<String>('hashD', value);

  int? get promA => getField<int>('promA');
  set promA(int? value) => setField<int>('promA', value);

  int? get promB => getField<int>('promB');
  set promB(int? value) => setField<int>('promB', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);

  List<String> get resultado => getListField<String>('resultado');
  set resultado(List<String>? value) =>
      setListField<String>('resultado', value);
}
