import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddUserDialogWidget extends StatefulWidget {
  const AddUserDialogWidget({super.key});

  @override
  State<AddUserDialogWidget> createState() => _AddUserDialogWidgetState();
}

class _AddUserDialogWidgetState extends State<AddUserDialogWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: IntrinsicHeight(
            child: Column(
              children: [
                TextField(
                  controller: controller,
                ),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () {
                  if (controller.text.isEmpty) {
                    return;
                  }

                  context.pop(controller.text);
                }, child: const Text("Добавити"))
              ],
            )
        )
    );
  }
}
