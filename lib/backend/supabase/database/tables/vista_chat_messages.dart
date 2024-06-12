import '../database.dart';

class VistaChatMessagesTable extends SupabaseTable<VistaChatMessagesRow> {
  @override
  String get tableName => 'VistaChatMessages';

  @override
  VistaChatMessagesRow createRow(Map<String, dynamic> data) =>
      VistaChatMessagesRow(data);
}

class VistaChatMessagesRow extends SupabaseDataRow {
  VistaChatMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VistaChatMessagesTable();

  int? get messageId => getField<int>('messageId');
  set messageId(int? value) => setField<int>('messageId', value);

  DateTime? get createdAt => getField<DateTime>('createdAt');
  set createdAt(DateTime? value) => setField<DateTime>('createdAt', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  int? get chatId => getField<int>('chatId');
  set chatId(int? value) => setField<int>('chatId', value);

  String? get senderId => getField<String>('senderId');
  set senderId(String? value) => setField<String>('senderId', value);

  String? get sendername => getField<String>('sendername');
  set sendername(String? value) => setField<String>('sendername', value);
}
