import 'package:crudtodo/model/model.dart';
import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Task'),
      content: TextField(
        controller: _textController,
        onChanged: (value) {
          // Handle input if needed
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Handle adding task and close the dialog
            Navigator.of(context).pop(_textController.text);
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

class UpdateTaskDialog extends StatefulWidget {
  final Task task;

  UpdateTaskDialog({required this.task});

  @override
  _UpdateTaskDialogState createState() => _UpdateTaskDialogState();
}

class _UpdateTaskDialogState extends State<UpdateTaskDialog> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.task.title);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update Task'),
      content: TextField(
        controller: _textController,
        onChanged: (value) {
          // Handle input if needed
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Handle updating task and close the dialog
            Navigator.of(context).pop(_textController.text);
          },
          child: Text('Update'),
        ),
      ],
    );
  }
}
