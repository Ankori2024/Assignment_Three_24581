import 'package:battery_plus/battery_plus.dart';

class BatteryService {
  BatteryService() {
    _initBatteryListener();
  }

  void _initBatteryListener() {
    Battery().onBatteryStateChanged.listen((BatteryState state) {
      if (state == BatteryState.charging) {
        Battery().batteryLevel.then((level) {
          if (level >= 90) {
            print('Battery is above 90% and charging');
            // Toast message and ringtone code here
          }
        });
      }
    });
  }
}
