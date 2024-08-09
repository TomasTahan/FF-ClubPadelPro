import '../database.dart';

class VistaAmericanoInscritosTable
    extends SupabaseTable<VistaAmericanoInscritosRow> {
  @override
  String get tableName => 'VistaAmericanoInscritos';

  @override
  VistaAmericanoInscritosRow createRow(Map<String, dynamic> data) =>
      VistaAmericanoInscritosRow(data);
}

class VistaAmericanoInscritosRow extends SupabaseDataRow {
  VistaAmericanoInscritosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VistaAmericanoInscritosTable();

  String? get userId => getField<String>('userId');
  set userId(String? value) => setField<String>('userId', value);

  String? get avatarUrl => getField<String>('avatarUrl');
  set avatarUrl(String? value) => setField<String>('avatarUrl', value);

  String? get avatarHashUrl => getField<String>('avatarHashUrl');
  set avatarHashUrl(String? value) => setField<String>('avatarHashUrl', value);

  String? get nombreCompleto => getField<String>('nombre_completo');
  set nombreCompleto(String? value) =>
      setField<String>('nombre_completo', value);

  int? get ranking => getField<int>('ranking');
  set ranking(int? value) => setField<int>('ranking', value);

  String? get americanoId => getField<String>('americanoId');
  set americanoId(String? value) => setField<String>('americanoId', value);
}
