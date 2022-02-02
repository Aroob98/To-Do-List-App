import 'package:flutter/material.dart';
import 'package:project_todolist/todos_list_page.dart';
import 'package:provider/provider.dart';
import 'package:project_todolist/task_provider.dart';
import 'package:project_todolist/data_input_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do List App',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: TodosPage(),
        // initialRoute: TodosPage.id,
        // routes: {
        //   DataInputPage.id: (context) => const DataInputPage(),
        //   TodosPage.id: (context) => const TodosPage(),
        // },
      ),
    );
  }
}
