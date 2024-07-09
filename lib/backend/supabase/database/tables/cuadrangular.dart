import '../database.dart';

class CuadrangularTable extends SupabaseTable<CuadrangularRow> {
  @override
  String get tableName => 'Cuadrangular';

  @override
  CuadrangularRow createRow(Map<String, dynamic> data) => CuadrangularRow(data);
}

class CuadrangularRow extends SupabaseDataRow {
  CuadrangularRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CuadrangularTable();

  int get cuadrangularId => getField<int>('cuadrangularId')!;
  set cuadrangularId(int value) => setField<int>('cuadrangularId', value);

  DateTime? get fecha => getField<DateTime>('fecha');
  set fecha(DateTime? value) => setField<DateTime>('fecha', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);

  int? get parejas => getField<int>('parejas');
  set parejas(int? value) => setField<int>('parejas', value);

  int? get precio => getField<int>('precio');
  set precio(int? value) => setField<int>('precio', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);
}
