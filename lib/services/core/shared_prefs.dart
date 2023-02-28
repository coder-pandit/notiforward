import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService extends GetxService {
  late final SharedPreferences _prefs;
  SharedPreferences get prefs => _prefs;

  Future<SharedPrefsService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}
