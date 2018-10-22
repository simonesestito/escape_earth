import 'package:connectivity/connectivity.dart';

Future<bool> isConnected() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi;
}
