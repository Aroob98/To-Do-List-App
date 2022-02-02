import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_todolist/task.dart';
import 'package:project_todolist/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class DataInputPage extends StatelessWidget {
  static const String id = '/data-input';
  DataInputPage ({Key? key}) : super(key: key);

  addTask(BuildContext context){
    Task newTask = Task(title:_titleController.text,
        isCompleted: false
    );
    Provider.of<TaskProvider>(context, listen: false).addTask(newTask);
    Navigator.of(context).pop();
  }




  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Add To-Do'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          'Adding a new task?'.text.size(20).black.semiBold.makeCentered(),
          24.heightBox,
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder()
            ),
          ),
          24.heightBox,
          CupertinoButton(
              child: 'Add Task'.text.make(),
              onPressed: (){
                addTask(context);

              },
                color: Theme.of(context).primaryColor,
              )
        ],
      ).p(24),
    );
  }
}
