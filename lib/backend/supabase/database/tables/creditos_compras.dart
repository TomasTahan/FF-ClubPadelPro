import '../database.dart';

class CreditosComprasTable extends SupabaseTable<CreditosComprasRow> {
  @override
  String get tableName => 'CreditosCompras';

  @override
  CreditosComprasRow createRow(Map<String, dynamic> data) =>
      CreditosComprasRow(data);
}

class CreditosComprasRow extends SupabaseDataRow {
  CreditosComprasRow(super.data);

  @override
  SupabaseTable get table => CreditosComprasTable();

  int get compraId => getField<int>('compraId')!;
  set compraId(int value) => setField<int>('compraId', value);

  String? get userId => getField<String>('userId');
  set userId(String? value) => setField<String>('userId', value);

  int? get packId => getField<int>('packId');
  set packId(int? value) => setField<int>('packId', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  String? get status => getField<String>('Status');
  set status(String? value) => setField<String>('Status', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);
}
