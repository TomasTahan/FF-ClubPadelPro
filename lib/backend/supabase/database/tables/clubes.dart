import '../database.dart';

class ClubesTable extends SupabaseTable<ClubesRow> {
  @override
  String get tableName => 'Clubes';

  @override
  ClubesRow createRow(Map<String, dynamic> data) => ClubesRow(data);
}

class ClubesRow extends SupabaseDataRow {
  ClubesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClubesTable();

  int get clubId => getField<int>('clubId')!;
  set clubId(int value) => setField<int>('clubId', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  String? get ubicacion => getField<String>('ubicacion');
  set ubicacion(String? value) => setField<String>('ubicacion', value);

  int? get canchas => getField<int>('canchas');
  set canchas(int? value) => setField<int>('canchas', value);

  String? get colorPrincipal => getField<String>('colorPrincipal');
  set colorPrincipal(String? value) =>
      setField<String>('colorPrincipal', value);

  List<String> get horariosCanchas => getListField<String>('horariosCanchas');
  set horariosCanchas(List<String>? value) =>
      setListField<String>('horariosCanchas', value);

  String? get colorSecundario => getField<String>('colorSecundario');
  set colorSecundario(String? value) =>
      setField<String>('colorSecundario', value);

  String? get merchantCode => getField<String>('merchantCode');
  set merchantCode(String? value) => setField<String>('merchantCode', value);

  String? get merchantToken => getField<String>('merchantToken');
  set merchantToken(String? value) => setField<String>('merchantToken', value);
}
