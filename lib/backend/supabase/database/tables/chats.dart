import '../database.dart';

class ChatsTable extends SupabaseTable<ChatsRow> {
  @override
  String get tableName => 'Chats';

  @override
  ChatsRow createRow(Map<String, dynamic> data) => ChatsRow(data);
}

class ChatsRow extends SupabaseDataRow {
  ChatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatsTable();

  int get chatId => getField<int>('chatId')!;
  set chatId(int value) => setField<int>('chatId', value);

  List<String> get chatMembers => getListField<String>('chatMembers');
  set chatMembers(List<String>? value) =>
      setListField<String>('chatMembers', value);
}
