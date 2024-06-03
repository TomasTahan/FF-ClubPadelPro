import '../database.dart';

class AmericanosTable extends SupabaseTable<AmericanosRow> {
  @override
  String get tableName => 'Americanos';

  @override
  AmericanosRow createRow(Map<String, dynamic> data) => AmericanosRow(data);
}

class AmericanosRow extends SupabaseDataRow {
  AmericanosRow(super.data);

  @override
  SupabaseTable get table => AmericanosTable();

  String get americanoId => getField<String>('americanoId')!;
  set americanoId(String value) => setField<String>('americanoId', value);

  DateTime? get fecha => getField<DateTime>('fecha');
  set fecha(DateTime? value) => setField<DateTime>('fecha', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);

  int? get parejas => getField<int>('parejas');
  set parejas(int? value) => setField<int>('parejas', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);
}
