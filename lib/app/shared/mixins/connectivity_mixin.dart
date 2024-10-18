
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

mixin ConnectivityMixin{
  Future<bool> isConnected() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      throw Exception();
    }
  }
}
