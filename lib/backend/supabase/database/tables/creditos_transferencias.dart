import '../database.dart';

class CreditosTransferenciasTable
    extends SupabaseTable<CreditosTransferenciasRow> {
  @override
  String get tableName => 'CreditosTransferencias';

  @override
  CreditosTransferenciasRow createRow(Map<String, dynamic> data) =>
      CreditosTransferenciasRow(data);
}

class CreditosTransferenciasRow extends SupabaseDataRow {
  CreditosTransferenciasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CreditosTransferenciasTable();

  int get transferenciaId => getField<int>('transferenciaId')!;
  set transferenciaId(int value) => setField<int>('transferenciaId', value);

  String? get userSend => getField<String>('userSend');
  set userSend(String? value) => setField<String>('userSend', value);

  int? get creditos => getField<int>('creditos');
  set creditos(int? value) => setField<int>('creditos', value);

  String? get userRecipt => getField<String>('userRecipt');
  set userRecipt(String? value) => setField<String>('userRecipt', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);
}
