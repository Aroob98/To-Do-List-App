import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_todolist/data_input_page.dart';
import 'package:project_todolist/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:lottie/lottie.dart';

class TodosPage extends StatelessWidget{
  static const String id ='/todos-page';
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text('Todos')),
      ),
      body: Consumer<TaskProvider>(
        builder:(context, taskProvider, child) => Column(
          children: [
            Expanded(
              child: (taskProvider.tasks.isEmpty)?  Center(
          child: LottieBuilder.asset('assets/anime/sad.json'),
        )

                : ListView.builder(
                    itemCount: taskProvider.tasks.length,
                    itemBuilder: (context, index) =>
                    Dismissible(
                      key: Key(taskProvider.tasks[index].title),
                      onDismissed:(v) {
                        taskProvider.tasks.removeAt(index);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('dismissed')));

                      },
                      background: Container(color: Colors.red),
                      child: Card(child: ListTile(
                    title: Text(taskProvider.tasks[index].title),
          subtitle:
          taskProvider.tasks[index].isCompleted ? 'Completed'.text.make():
          const Text('Incomplete'),
        )),
                    )),
            ),
            CupertinoButton(
              color: Colors.yellow,
              child: 'Add a New Task'.text.make(),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DataInputPage() ));
              },
            )
          ],
        ),
      ),
    );
  }
}
