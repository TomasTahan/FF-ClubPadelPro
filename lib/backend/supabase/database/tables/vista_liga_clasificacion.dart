import '../database.dart';

class VistaLigaClasificacionTable
    extends SupabaseTable<VistaLigaClasificacionRow> {
  @override
  String get tableName => 'VistaLigaClasificacion';

  @override
  VistaLigaClasificacionRow createRow(Map<String, dynamic> data) =>
      VistaLigaClasificacionRow(data);
}

class VistaLigaClasificacionRow extends SupabaseDataRow {
  VistaLigaClasificacionRow(super.data);

  @override
  SupabaseTable get table => VistaLigaClasificacionTable();

  String? get nombreCompleto1 => getField<String>('nombre_completo1');
  set nombreCompleto1(String? value) =>
      setField<String>('nombre_completo1', value);

  String? get nombreCompleto2 => getField<String>('nombre_completo2');
  set nombreCompleto2(String? value) =>
      setField<String>('nombre_completo2', value);

  int? get puntos => getField<int>('puntos');
  set puntos(int? value) => setField<int>('puntos', value);

  int? get pj => getField<int>('pj');
  set pj(int? value) => setField<int>('pj', value);

  int? get pg => getField<int>('pg');
  set pg(int? value) => setField<int>('pg', value);

  int? get pp => getField<int>('pp');
  set pp(int? value) => setField<int>('pp', value);

  int? get grupo => getField<int>('grupo');
  set grupo(int? value) => setField<int>('grupo', value);

  String? get nombrecategoria => getField<String>('nombrecategoria');
  set nombrecategoria(String? value) =>
      setField<String>('nombrecategoria', value);

  int? get ligaId => getField<int>('ligaId');
  set ligaId(int? value) => setField<int>('ligaId', value);
}
