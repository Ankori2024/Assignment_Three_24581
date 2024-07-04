import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  ConnectivityService() {
    _initConnectivityListener();
  }

  void _initConnectivityListener() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      String message = 'No internet connection';
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        message = 'Internet connection available';
      }
      print(message);
      // Toast message code here
    } as void Function(List<ConnectivityResult> event)?);
  }
}
