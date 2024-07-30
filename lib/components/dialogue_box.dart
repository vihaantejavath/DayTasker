import 'package:daytasker/components/button.dart';
import 'package:flutter/material.dart';

class DialogueBox extends StatelessWidget {
  final controller;


  VoidCallback onSave;
  VoidCallback onCancel;

  DialogueBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Task to add Up!!"
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 8),

                CustomButton(text: "Cancel", onPressed: onCancel),

              ],
            ),
          ],
        ),
      ),
    );
  }
}