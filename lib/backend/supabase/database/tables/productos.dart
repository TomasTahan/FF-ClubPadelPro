import '../database.dart';

class ProductosTable extends SupabaseTable<ProductosRow> {
  @override
  String get tableName => 'Productos';

  @override
  ProductosRow createRow(Map<String, dynamic> data) => ProductosRow(data);
}

class ProductosRow extends SupabaseDataRow {
  ProductosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductosTable();

  int get productoId => getField<int>('productoId')!;
  set productoId(int value) => setField<int>('productoId', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  int? get precio => getField<int>('precio');
  set precio(int? value) => setField<int>('precio', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);
}
