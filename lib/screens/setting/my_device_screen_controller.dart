import 'package:device_info_plus/device_info_plus.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

class MyDeviceScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => MyDeviceScreenController(),
        permanent: false, fenix: false);
  }
}

class MyDeviceScreenController extends BaseController {
  final AuthService authService = Get.find();

  RxMap<String, String> deviceMap = <String, String>{}.obs;

  @override
  void onInit() {
    super.onInit();
    getDeviceInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future<void> getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    Map<String, String> deviceInfo = {};

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      deviceInfo = {
        'Device ID': androidInfo.id ?? 'Unknown',
        'Mobile Phone Model': androidInfo.model ?? 'Unknown',
        'Device Platform': 'Android',
        'Operating System': 'Android',
        'System version': androidInfo.version.release ?? 'Unknown',
        'Current Language': Platform.localeName,
      };
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      deviceInfo = {
        'Device ID': iosInfo.identifierForVendor ?? 'Unknown',
        'Mobile Phone Model': iosInfo.utsname.machine ?? 'Unknown',
        'Device Platform': 'iOS',
        'Operating System': 'iOS',
        'System version': iosInfo.systemVersion ?? 'Unknown',
        'Current Language': Platform.localeName,
      };
    }

    String ip = await getPublicIP();
    deviceInfo['IP'] = ip;
    deviceMap.value = deviceInfo;
  }

  Future<String> getPublicIP() async {
    try {
      final response =
          await http.get(Uri.parse('https://api64.ipify.org?format=json'));
      if (response.statusCode == 200) {
        final ip = response.body.split('"ip":"')[1].split('"')[0];
        return ip;
      } else {
        throw Exception('Failed to get public IP');
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
