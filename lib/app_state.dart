import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_UserInfo') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_UserInfo') ?? '{}';
          _UserInfo =
              UserInfoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_Club') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_Club') ?? '{}';
          _Club = ClubStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  UserInfoStruct _UserInfo = UserInfoStruct();
  UserInfoStruct get UserInfo => _UserInfo;
  set UserInfo(UserInfoStruct value) {
    _UserInfo = value;
    secureStorage.setString('ff_UserInfo', value.serialize());
  }

  void deleteUserInfo() {
    secureStorage.delete(key: 'ff_UserInfo');
  }

  void updateUserInfoStruct(Function(UserInfoStruct) updateFn) {
    updateFn(_UserInfo);
    secureStorage.setString('ff_UserInfo', _UserInfo.serialize());
  }

  ClubStruct _Club = ClubStruct.fromSerializableMap(jsonDecode(
      '{\"clubId\":\"12\",\"nombre\":\"Tomy\",\"color\":\"#ffaabb\"}'));
  ClubStruct get Club => _Club;
  set Club(ClubStruct value) {
    _Club = value;
    secureStorage.setString('ff_Club', value.serialize());
  }

  void deleteClub() {
    secureStorage.delete(key: 'ff_Club');
  }

  void updateClubStruct(Function(ClubStruct) updateFn) {
    updateFn(_Club);
    secureStorage.setString('ff_Club', _Club.serialize());
  }

  bool _refresh = false;
  bool get refresh => _refresh;
  set refresh(bool value) {
    _refresh = value;
  }

  List<CardsStruct> _Cards = [];
  List<CardsStruct> get Cards => _Cards;
  set Cards(List<CardsStruct> value) {
    _Cards = value;
  }

  void addToCards(CardsStruct value) {
    _Cards.add(value);
  }

  void removeFromCards(CardsStruct value) {
    _Cards.remove(value);
  }

  void removeAtIndexFromCards(int index) {
    _Cards.removeAt(index);
  }

  void updateCardsAtIndex(
    int index,
    CardsStruct Function(CardsStruct) updateFn,
  ) {
    _Cards[index] = updateFn(_Cards[index]);
  }

  void insertAtIndexInCards(int index, CardsStruct value) {
    _Cards.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
