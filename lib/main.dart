import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/background_services/sms_service.dart';
import 'services/core/shared_prefs.dart';
import 'ui/core/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Register services
  await initServices();

  runApp(const AppWidget());
}

initServices() async {
  await Get.putAsync(
    () => SharedPrefsService().init(),
    tag: 'shared_prefs',
  );
  await Get.putAsync(
    () => SmsService().init(),
    tag: 'background_service',
  );
}
