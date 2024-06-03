import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_UserInfo')) {
        try {
          final serializedData = prefs.getString('ff_UserInfo') ?? '{}';
          _UserInfo =
              UserInfoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_Club')) {
        try {
          final serializedData = prefs.getString('ff_Club') ?? '{}';
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

  late SharedPreferences prefs;

  UserInfoStruct _UserInfo = UserInfoStruct();
  UserInfoStruct get UserInfo => _UserInfo;
  set UserInfo(UserInfoStruct value) {
    _UserInfo = value;
    prefs.setString('ff_UserInfo', value.serialize());
  }

  void updateUserInfoStruct(Function(UserInfoStruct) updateFn) {
    updateFn(_UserInfo);
    prefs.setString('ff_UserInfo', _UserInfo.serialize());
  }

  ClubStruct _Club = ClubStruct.fromSerializableMap(jsonDecode(
      '{\"clubId\":\"12\",\"nombre\":\"Tomy\",\"color\":\"#ffaabb\"}'));
  ClubStruct get Club => _Club;
  set Club(ClubStruct value) {
    _Club = value;
    prefs.setString('ff_Club', value.serialize());
  }

  void updateClubStruct(Function(ClubStruct) updateFn) {
    updateFn(_Club);
    prefs.setString('ff_Club', _Club.serialize());
  }

  bool _refresh = false;
  bool get refresh => _refresh;
  set refresh(bool value) {
    _refresh = value;
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
