import '../database.dart';

class CajaProductosTable extends SupabaseTable<CajaProductosRow> {
  @override
  String get tableName => 'CajaProductos';

  @override
  CajaProductosRow createRow(Map<String, dynamic> data) =>
      CajaProductosRow(data);
}

class CajaProductosRow extends SupabaseDataRow {
  CajaProductosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CajaProductosTable();

  int get productosId => getField<int>('productosId')!;
  set productosId(int value) => setField<int>('productosId', value);

  List<dynamic> get productosTienda => getListField<dynamic>('productosTienda');
  set productosTienda(List<dynamic>? value) =>
      setListField<dynamic>('productosTienda', value);

  List<dynamic> get productosPadel => getListField<dynamic>('productosPadel');
  set productosPadel(List<dynamic>? value) =>
      setListField<dynamic>('productosPadel', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);
}
