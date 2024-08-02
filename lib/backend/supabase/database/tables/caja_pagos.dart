import '../database.dart';

class CajaPagosTable extends SupabaseTable<CajaPagosRow> {
  @override
  String get tableName => 'CajaPagos';

  @override
  CajaPagosRow createRow(Map<String, dynamic> data) => CajaPagosRow(data);
}

class CajaPagosRow extends SupabaseDataRow {
  CajaPagosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CajaPagosTable();

  int get pagoId => getField<int>('pagoId')!;
  set pagoId(int value) => setField<int>('pagoId', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  String? get cliente => getField<String>('cliente');
  set cliente(String? value) => setField<String>('cliente', value);

  double? get monto => getField<double>('monto');
  set monto(double? value) => setField<double>('monto', value);

  bool? get estado => getField<bool>('estado');
  set estado(bool? value) => setField<bool>('estado', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);
}
