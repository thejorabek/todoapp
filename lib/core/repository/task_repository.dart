import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/services/task_service.dart';

abstract class TaskApi {
  const TaskApi();

  Future<List<TaskModel>> getTodos();

  Future<void> saveTodo(TaskModel todo);

  Future<void> deleteTodo(TaskModel task);

  Future<void> markCompleted(TaskModel task);

  Future<void> changeNotifier(TaskModel task);

  Future<void> editTodo(TaskModel oldTtask, TaskModel newTask);
}

class TodoNotFoundException implements Exception {}

class Task_Crud extends TaskApi {
  TaskService taskService;
  Task_Crud({required this.taskService});

  @override
  Future<void> deleteTodo(TaskModel task) async {
    taskService.deleteFromHive(task);
  }

  @override
  Future editTodo(TaskModel oldTask, TaskModel newTask) async {
    taskService.editFromHive(oldTask, newTask);
  }

  @override
  Future<List<TaskModel>> getTodos() async {
    return await taskService.getTasks();
  }

  @override
  Future markCompleted(TaskModel task) async {
    taskService.markAsCompletedHive(task);
  }

  @override
  Future changeNotifier(TaskModel task) async {
    taskService.changeNotifier(task);
  }

  @override
  Future<void> saveTodo(TaskModel task) async {
    taskService.addToHive(task);
  }
}
