import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
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
    secureStorage = FlutterSecureStorage();
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
    await _safeInitAsync(() async {
      _ClubesFavoritos =
          (await secureStorage.getStringList('ff_ClubesFavoritos'))
                  ?.map((x) {
                    try {
                      return ClubesFavoritosStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _ClubesFavoritos;
    });
    await _safeInitAsync(() async {
      _version = await secureStorage.getString('ff_version') ?? _version;
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

  List<ClubesFavoritosStruct> _ClubesFavoritos = [
    ClubesFavoritosStruct.fromSerializableMap(jsonDecode(
        '{\"clubId\":\"15\",\"nombre\":\"Las Pircas\",\"ubicacion\":\"Las Pircas\",\"colorTrue\":\"#0320ed\",\"colorSecundario\":\"#192779\",\"merchantCode\":\"123\",\"merchantToken\":\"123\"}'))
  ];
  List<ClubesFavoritosStruct> get ClubesFavoritos => _ClubesFavoritos;
  set ClubesFavoritos(List<ClubesFavoritosStruct> value) {
    _ClubesFavoritos = value;
    secureStorage.setStringList(
        'ff_ClubesFavoritos', value.map((x) => x.serialize()).toList());
  }

  void deleteClubesFavoritos() {
    secureStorage.delete(key: 'ff_ClubesFavoritos');
  }

  void addToClubesFavoritos(ClubesFavoritosStruct value) {
    ClubesFavoritos.add(value);
    secureStorage.setStringList('ff_ClubesFavoritos',
        _ClubesFavoritos.map((x) => x.serialize()).toList());
  }

  void removeFromClubesFavoritos(ClubesFavoritosStruct value) {
    ClubesFavoritos.remove(value);
    secureStorage.setStringList('ff_ClubesFavoritos',
        _ClubesFavoritos.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromClubesFavoritos(int index) {
    ClubesFavoritos.removeAt(index);
    secureStorage.setStringList('ff_ClubesFavoritos',
        _ClubesFavoritos.map((x) => x.serialize()).toList());
  }

  void updateClubesFavoritosAtIndex(
    int index,
    ClubesFavoritosStruct Function(ClubesFavoritosStruct) updateFn,
  ) {
    ClubesFavoritos[index] = updateFn(_ClubesFavoritos[index]);
    secureStorage.setStringList('ff_ClubesFavoritos',
        _ClubesFavoritos.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInClubesFavoritos(int index, ClubesFavoritosStruct value) {
    ClubesFavoritos.insert(index, value);
    secureStorage.setStringList('ff_ClubesFavoritos',
        _ClubesFavoritos.map((x) => x.serialize()).toList());
  }

  String _version = '1.0.2';
  String get version => _version;
  set version(String value) {
    _version = value;
    secureStorage.setString('ff_version', value);
  }

  void deleteVersion() {
    secureStorage.delete(key: 'ff_version');
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
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
