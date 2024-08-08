import '../database.dart';

class VersionTable extends SupabaseTable<VersionRow> {
  @override
  String get tableName => 'Version';

  @override
  VersionRow createRow(Map<String, dynamic> data) => VersionRow(data);
}

class VersionRow extends SupabaseDataRow {
  VersionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VersionTable();

  int get versionId => getField<int>('versionId')!;
  set versionId(int value) => setField<int>('versionId', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  String? get version => getField<String>('version');
  set version(String? value) => setField<String>('version', value);

  String? get appStore => getField<String>('appStore');
  set appStore(String? value) => setField<String>('appStore', value);

  String? get playStore => getField<String>('playStore');
  set playStore(String? value) => setField<String>('playStore', value);

  bool? get show => getField<bool>('show');
  set show(bool? value) => setField<bool>('show', value);
}
