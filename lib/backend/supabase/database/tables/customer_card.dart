import '../database.dart';

class CustomerCardTable extends SupabaseTable<CustomerCardRow> {
  @override
  String get tableName => 'CustomerCard';

  @override
  CustomerCardRow createRow(Map<String, dynamic> data) => CustomerCardRow(data);
}

class CustomerCardRow extends SupabaseDataRow {
  CustomerCardRow(super.data);

  @override
  SupabaseTable get table => CustomerCardTable();

  int get cardId => getField<int>('cardId')!;
  set cardId(int value) => setField<int>('cardId', value);

  String? get customerId => getField<String>('customerId');
  set customerId(String? value) => setField<String>('customerId', value);

  int? get cvv => getField<int>('CVV');
  set cvv(int? value) => setField<int>('CVV', value);

  String? get last4 => getField<String>('last4');
  set last4(String? value) => setField<String>('last4', value);

  String? get cardType => getField<String>('cardType');
  set cardType(String? value) => setField<String>('cardType', value);
}
