import '../database.dart';

class ChatMessagesTable extends SupabaseTable<ChatMessagesRow> {
  @override
  String get tableName => 'ChatMessages';

  @override
  ChatMessagesRow createRow(Map<String, dynamic> data) => ChatMessagesRow(data);
}

class ChatMessagesRow extends SupabaseDataRow {
  ChatMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatMessagesTable();

  int get messageId => getField<int>('messageId')!;
  set messageId(int value) => setField<int>('messageId', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  int? get chatId => getField<int>('chatId');
  set chatId(int? value) => setField<int>('chatId', value);

  String? get senderId => getField<String>('senderId');
  set senderId(String? value) => setField<String>('senderId', value);
}
