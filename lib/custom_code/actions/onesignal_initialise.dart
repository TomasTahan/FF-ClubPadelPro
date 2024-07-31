// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:onesignal_flutter/onesignal_flutter.dart';

Future onesignalInitialise() async {
  final String oneSignalAppId = "8b84349d-6ad5-4bc7-8be0-081f6b3fb323";

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId(oneSignalAppId);

  // Solicita permisos para notificaciones push
  OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true)
      .then((accepted) {
    print("Accepted permission: $accepted");
  });
}
