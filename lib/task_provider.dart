import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './task.dart';


class TaskProvider extends ChangeNotifier{
  List<Task> tasks =[];

  get getTasks {
    return tasks;
  }


  addTask (Task newTask){
    tasks.add(newTask);

    notifyListeners();
  }
}