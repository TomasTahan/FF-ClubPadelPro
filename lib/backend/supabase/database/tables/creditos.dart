import '../database.dart';

class CreditosTable extends SupabaseTable<CreditosRow> {
  @override
  String get tableName => 'Creditos';

  @override
  CreditosRow createRow(Map<String, dynamic> data) => CreditosRow(data);
}

class CreditosRow extends SupabaseDataRow {
  CreditosRow(super.data);

  @override
  SupabaseTable get table => CreditosTable();

  int get creditosId => getField<int>('creditosId')!;
  set creditosId(int value) => setField<int>('creditosId', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  String? get userId => getField<String>('userId');
  set userId(String? value) => setField<String>('userId', value);

  int? get creditos => getField<int>('creditos');
  set creditos(int? value) => setField<int>('creditos', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);
}
