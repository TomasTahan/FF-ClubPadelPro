import '../database.dart';

class AdminsTable extends SupabaseTable<AdminsRow> {
  @override
  String get tableName => 'Admins';

  @override
  AdminsRow createRow(Map<String, dynamic> data) => AdminsRow(data);
}

class AdminsRow extends SupabaseDataRow {
  AdminsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AdminsTable();

  int get adminId => getField<int>('adminId')!;
  set adminId(int value) => setField<int>('adminId', value);

  int? get clubId => getField<int>('clubId');
  set clubId(int? value) => setField<int>('clubId', value);
}
