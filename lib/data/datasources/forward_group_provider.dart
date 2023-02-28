import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/forward_group_model.dart';

class ForwardGroupProvider {
  final _prefs = Get.find<SharedPreferences>(tag: 'shared_prefs');
  final _forwardGroupKey = 'forward_group';

  Future<void> saveForwardGroup(ForwardGroup group) async {
    final groups = await getForwardGroups();
    if (groups == null) {
      await _prefs.setString(
        _forwardGroupKey,
        ForwardGroups(forwardGroups: [group]).toJson(),
      );
      return;
    }

    final index = groups.forwardGroups.indexWhere(
      (element) => element.id == group.id,
    );

    if (index == -1) {
      groups.forwardGroups.add(group);
    } else {
      groups.forwardGroups[index] = group;
    }

    await _prefs.setString(_forwardGroupKey, groups.toJson());
  }

  Future<ForwardGroups> getForwardGroups() async {
    final group = _prefs.getString(_forwardGroupKey);
    return group != null
        ? ForwardGroups.fromJson(group)
        : ForwardGroups(forwardGroups: []);
  }

  Future<void> removeForwardGroup(String groupId) async {
    final groups = await getForwardGroups();
    if (groups == null) {
      return;
    }

    groups.forwardGroups.removeWhere((element) => element.id == groupId);
    await _prefs.setString(_forwardGroupKey, groups.toJson());
  }

  Future<void> clear() async {
    await _prefs.remove(_forwardGroupKey);
  }
}
