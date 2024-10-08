import 'package:flutter/material.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/repository/task_group_repository.dart';

class TaskGroupProvider extends ChangeNotifier {
  final supaBaseRepo = TaskGroupRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<TaskGroup> _TaskGroups = [];
  List<TaskGroup> get taskGroup => _TaskGroups;
  Future<void> listTaskGroups() async{
    _isLoading = true;
    notifyListeners();
    _TaskGroups = await TaskGroupRepository().listTaskGroups();
    _isLoading = false;
    notifyListeners();
  }
}