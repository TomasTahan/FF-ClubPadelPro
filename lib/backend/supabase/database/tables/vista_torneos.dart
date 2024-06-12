import '../database.dart';

class VistaTorneosTable extends SupabaseTable<VistaTorneosRow> {
  @override
  String get tableName => 'VistaTorneos';

  @override
  VistaTorneosRow createRow(Map<String, dynamic> data) => VistaTorneosRow(data);
}

class VistaTorneosRow extends SupabaseDataRow {
  VistaTorneosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VistaTorneosTable();

  String? get eventoid => getField<String>('eventoid');
  set eventoid(String? value) => setField<String>('eventoid', value);

  DateTime? get fecha => getField<DateTime>('fecha');
  set fecha(DateTime? value) => setField<DateTime>('fecha', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);

  int? get parejas => getField<int>('parejas');
  set parejas(int? value) => setField<int>('parejas', value);

  DateTime? get createdAt => getField<DateTime>('createdAt');
  set createdAt(DateTime? value) => setField<DateTime>('createdAt', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);
}
