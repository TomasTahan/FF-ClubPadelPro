import '../database.dart';

class LogTable extends SupabaseTable<LogRow> {
  @override
  String get tableName => 'Log';

  @override
  LogRow createRow(Map<String, dynamic> data) => LogRow(data);
}

class LogRow extends SupabaseDataRow {
  LogRow(super.data);

  @override
  SupabaseTable get table => LogTable();

  int get logId => getField<int>('logId')!;
  set logId(int value) => setField<int>('logId', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);
}
