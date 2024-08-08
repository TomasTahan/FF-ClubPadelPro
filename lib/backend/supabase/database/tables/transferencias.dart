import '../database.dart';

class TransferenciasTable extends SupabaseTable<TransferenciasRow> {
  @override
  String get tableName => 'Transferencias';

  @override
  TransferenciasRow createRow(Map<String, dynamic> data) =>
      TransferenciasRow(data);
}

class TransferenciasRow extends SupabaseDataRow {
  TransferenciasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TransferenciasTable();

  int get transferenciaId => getField<int>('transferenciaId')!;
  set transferenciaId(int value) => setField<int>('transferenciaId', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  String? get signatureToken => getField<String>('signatureToken');
  set signatureToken(String? value) =>
      setField<String>('signatureToken', value);

  String? get merchId => getField<String>('merchId');
  set merchId(String? value) => setField<String>('merchId', value);

  String? get userId => getField<String>('userId');
  set userId(String? value) => setField<String>('userId', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
