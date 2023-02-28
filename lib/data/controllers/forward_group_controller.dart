import 'package:get/get.dart';

import '../datasources/forward_group_provider.dart';
import '../models/forward_group_model.dart';

class ForwardGroupController extends GetxController {
  final ForwardGroupProvider _forwardGroupProvider = ForwardGroupProvider();

  var forwardGroups = <ForwardGroup>[].obs;

  Future<List<ForwardGroup>> _getForwardGroups() async {
    return (await _forwardGroupProvider.getForwardGroups()).forwardGroups;
  }

  @override
  void onInit() async {
    super.onInit();
    forwardGroups.bindStream(_getForwardGroups().asStream());
  }

  Future<void> addForwardGroup(ForwardGroup forwardGroup) async {
    await _forwardGroupProvider.saveForwardGroup(forwardGroup);
    update();
  }

  Future<void> removeForwardGroup(String forwardGroupId) async {
    await _forwardGroupProvider.removeForwardGroup(forwardGroupId);
    update();
  }

  Future<void> removeAll() async {
    await _forwardGroupProvider.clear();
    update();
  }
}
