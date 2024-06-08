import '../database.dart';

class VistaCustomerCardTable extends SupabaseTable<VistaCustomerCardRow> {
  @override
  String get tableName => 'VistaCustomerCard';

  @override
  VistaCustomerCardRow createRow(Map<String, dynamic> data) =>
      VistaCustomerCardRow(data);
}

class VistaCustomerCardRow extends SupabaseDataRow {
  VistaCustomerCardRow(super.data);

  @override
  SupabaseTable get table => VistaCustomerCardTable();

  String? get customerId => getField<String>('customerId');
  set customerId(String? value) => setField<String>('customerId', value);

  String? get userId => getField<String>('userId');
  set userId(String? value) => setField<String>('userId', value);

  int? get cardId => getField<int>('cardId');
  set cardId(int? value) => setField<int>('cardId', value);

  String? get last4 => getField<String>('last4');
  set last4(String? value) => setField<String>('last4', value);

  String? get cardType => getField<String>('cardType');
  set cardType(String? value) => setField<String>('cardType', value);

  int? get cvv => getField<int>('CVV');
  set cvv(int? value) => setField<int>('CVV', value);
}
