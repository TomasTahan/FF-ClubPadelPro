import '../database.dart';

class VistaLigaPartidosTable extends SupabaseTable<VistaLigaPartidosRow> {
  @override
  String get tableName => 'VistaLigaPartidos';

  @override
  VistaLigaPartidosRow createRow(Map<String, dynamic> data) =>
      VistaLigaPartidosRow(data);
}

class VistaLigaPartidosRow extends SupabaseDataRow {
  VistaLigaPartidosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VistaLigaPartidosTable();

  int? get partidoId => getField<int>('partidoId');
  set partidoId(int? value) => setField<int>('partidoId', value);

  String? get ida1 => getField<String>('ida1');
  set ida1(String? value) => setField<String>('ida1', value);

  String? get nombrea1 => getField<String>('nombrea1');
  set nombrea1(String? value) => setField<String>('nombrea1', value);

  String? get avatarurla1 => getField<String>('avatarurla1');
  set avatarurla1(String? value) => setField<String>('avatarurla1', value);

  String? get hashurla1 => getField<String>('hashurla1');
  set hashurla1(String? value) => setField<String>('hashurla1', value);

  int? get rankinga1 => getField<int>('rankinga1');
  set rankinga1(int? value) => setField<int>('rankinga1', value);

  String? get ida2 => getField<String>('ida2');
  set ida2(String? value) => setField<String>('ida2', value);

  String? get nombrea2 => getField<String>('nombrea2');
  set nombrea2(String? value) => setField<String>('nombrea2', value);

  String? get avatarurla2 => getField<String>('avatarurla2');
  set avatarurla2(String? value) => setField<String>('avatarurla2', value);

  String? get hashurla2 => getField<String>('hashurla2');
  set hashurla2(String? value) => setField<String>('hashurla2', value);

  int? get rankinga2 => getField<int>('rankinga2');
  set rankinga2(int? value) => setField<int>('rankinga2', value);

  String? get idb1 => getField<String>('idb1');
  set idb1(String? value) => setField<String>('idb1', value);

  String? get nombreb1 => getField<String>('nombreb1');
  set nombreb1(String? value) => setField<String>('nombreb1', value);

  String? get avatarurlb1 => getField<String>('avatarurlb1');
  set avatarurlb1(String? value) => setField<String>('avatarurlb1', value);

  String? get hashurlb1 => getField<String>('hashurlb1');
  set hashurlb1(String? value) => setField<String>('hashurlb1', value);

  int? get rankingb1 => getField<int>('rankingb1');
  set rankingb1(int? value) => setField<int>('rankingb1', value);

  String? get idb2 => getField<String>('idb2');
  set idb2(String? value) => setField<String>('idb2', value);

  String? get nombreb2 => getField<String>('nombreb2');
  set nombreb2(String? value) => setField<String>('nombreb2', value);

  String? get avatarurlb2 => getField<String>('avatarurlb2');
  set avatarurlb2(String? value) => setField<String>('avatarurlb2', value);

  String? get hashurlb2 => getField<String>('hashurlb2');
  set hashurlb2(String? value) => setField<String>('hashurlb2', value);

  int? get rankingb2 => getField<int>('rankingb2');
  set rankingb2(int? value) => setField<int>('rankingb2', value);

  DateTime? get fecha => getField<DateTime>('fecha');
  set fecha(DateTime? value) => setField<DateTime>('fecha', value);

  String? get inicio => getField<String>('inicio');
  set inicio(String? value) => setField<String>('inicio', value);

  String? get fin => getField<String>('fin');
  set fin(String? value) => setField<String>('fin', value);

  List<String> get resultado => getListField<String>('resultado');
  set resultado(List<String>? value) =>
      setListField<String>('resultado', value);

  int? get cancha => getField<int>('cancha');
  set cancha(int? value) => setField<int>('cancha', value);

  int? get ligaId => getField<int>('ligaId');
  set ligaId(int? value) => setField<int>('ligaId', value);
}
