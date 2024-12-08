import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectivityService {
  Future<bool> checkConnectivity() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return false;
      }
      return true;
    } catch (e, s) {
      developer.log('Error checking internet connectivity',
          error: e, stackTrace: s);
      return false;
    }
  }
}
