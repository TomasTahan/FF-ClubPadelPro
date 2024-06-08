import '../database.dart';

class CustomersTable extends SupabaseTable<CustomersRow> {
  @override
  String get tableName => 'Customers';

  @override
  CustomersRow createRow(Map<String, dynamic> data) => CustomersRow(data);
}

class CustomersRow extends SupabaseDataRow {
  CustomersRow(super.data);

  @override
  SupabaseTable get table => CustomersTable();

  String get customerId => getField<String>('customerId')!;
  set customerId(String value) => setField<String>('customerId', value);

  String? get userId => getField<String>('userId');
  set userId(String? value) => setField<String>('userId', value);
}
