import '../database.dart';

class CreditosPackTable extends SupabaseTable<CreditosPackRow> {
  @override
  String get tableName => 'CreditosPack';

  @override
  CreditosPackRow createRow(Map<String, dynamic> data) => CreditosPackRow(data);
}

class CreditosPackRow extends SupabaseDataRow {
  CreditosPackRow(super.data);

  @override
  SupabaseTable get table => CreditosPackTable();

  int get packId => getField<int>('packId')!;
  set packId(int value) => setField<int>('packId', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  int? get creditos => getField<int>('creditos');
  set creditos(int? value) => setField<int>('creditos', value);

  int? get precio => getField<int>('precio');
  set precio(int? value) => setField<int>('precio', value);

  int? get descuento => getField<int>('descuento');
  set descuento(int? value) => setField<int>('descuento', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);
}
