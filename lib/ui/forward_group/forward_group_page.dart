import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controllers/forward_group_controller.dart';
import 'widgets/forward_group_list.dart';

class ForwardGroupPage extends StatelessWidget {
  ForwardGroupPage({super.key});
  final _controller = Get.put(ForwardGroupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ForwardGroupList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed('/forward-groups/add'),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Forward Groups'),
          actions: [
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _controller.removeAll();
              },
            ),
          ],
        ));
  }
}
