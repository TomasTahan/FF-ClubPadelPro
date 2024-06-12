import UIKit
import OneSignalFramework
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    OneSignal.Debug.setLogLevel(.LL_VERBOSE)
    
    // OneSignal initialization
    OneSignal.initialize("c7002411-17a8-4768-b3ca-5413538e7a9a", withLaunchOptions: launchOptions)
        
    // requestPermission will show the native iOS notification permission prompt.
    // We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.Notifications.requestPermission({ accepted in
        print("User accepted notifications: \(accepted)")
    }, fallbackToSettings: true)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
