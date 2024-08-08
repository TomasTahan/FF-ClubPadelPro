import '../database.dart';

class PagosTable extends SupabaseTable<PagosRow> {
  @override
  String get tableName => 'Pagos';

  @override
  PagosRow createRow(Map<String, dynamic> data) => PagosRow(data);
}

class PagosRow extends SupabaseDataRow {
  PagosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PagosTable();

  int get pagoId => getField<int>('pagoId')!;
  set pagoId(int value) => setField<int>('pagoId', value);

  String? get userId => getField<String>('userId');
  set userId(String? value) => setField<String>('userId', value);

  int? get productoId => getField<int>('productoId');
  set productoId(int? value) => setField<int>('productoId', value);

  double? get precioFinal => getField<double>('precioFinal');
  set precioFinal(double? value) => setField<double>('precioFinal', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  String? get tipo => getField<String>('Tipo');
  set tipo(String? value) => setField<String>('Tipo', value);
}
