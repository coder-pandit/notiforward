import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../data/controllers/forward_group_controller.dart';
import '../../../data/models/forward_group_model.dart';

class AddForwardGroupPage extends StatefulWidget {
  const AddForwardGroupPage({super.key});

  @override
  State<AddForwardGroupPage> createState() => _AddForwardGroupPageState();
}

class _AddForwardGroupPageState extends State<AddForwardGroupPage> {
  final _mobileControllers = <TextEditingController>[];
  final _patternController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _groupController = Get.find<ForwardGroupController>();

  @override
  void initState() {
    super.initState();
    _mobileControllers.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Forward Group'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _patternController,
              decoration: const InputDecoration(
                labelText: 'Pattern',
              ),
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter a pattern';
                }
                return null;
              },
            ),
            ..._mobileControllers.map((TextEditingController controller) {
              return TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'Forward',
                ),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a forward';
                  }
                  return null;
                },
              );
            }),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  setState(() {
                    _mobileControllers.add(TextEditingController());
                  });
                }
              },
              child: const Text('Add Forward'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _groupController.addForwardGroup(
                    ForwardGroup(
                      id: const Uuid().v1(),
                      forwardTo: _mobileControllers.map((controller) {
                        return controller.text;
                      }).toList(),
                      pattern: _patternController.text,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
