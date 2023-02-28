import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controllers/forward_group_controller.dart';

class ForwardGroupList extends StatelessWidget {
  ForwardGroupList({super.key});
  final _controller = Get.find<ForwardGroupController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: _controller.forwardGroups.length,
          itemBuilder: (context, index) {
            final group = _controller.forwardGroups[index];
            return ListTile(
              title: Text(group.id),
              subtitle: Text(group.pattern),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  _controller.removeForwardGroup(group.id);
                },
              ),
            );
          },
        ));
  }
}
