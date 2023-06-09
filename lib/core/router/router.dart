import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/repository/notification_repository.dart';
import 'package:todo_app/core/repository/task_repository.dart';
import 'package:todo_app/core/services/notifications_service.dart';
import 'package:todo_app/core/services/task_service.dart';
import 'package:todo_app/screens/splash_screen.dart';
import 'package:todo_app/core/cubit/notification_cubit/notification_cubit.dart';
import 'package:todo_app/core/cubit/task_cubit/tasks_cubit.dart';
import 'package:todo_app/screens/task_page.dart';
import 'package:todo_app/screens/category_page.dart';

class RouteGenerator {
  late TaskService taskService;
  late NotificaitonUsecase notification;
  late LocalNotificationService notificationService;
  RouteGenerator() {
    taskService = TaskService();
    notificationService = LocalNotificationService();

    notification = NotificaitonUsecase(notificationService);
  }

  Route? routeGenerate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider<TasksCubit>(
              create: (context) => TasksCubit(
                Task_Crud(
                  taskService: taskService,
                ),
              ),
            ),
            BlocProvider<NotificationCubit>(
              create: (context) => NotificationCubit(
                notification,
                Task_Crud(
                  taskService: taskService,
                ),
              ),
            ),
          ], child: const HomePage()),
        );
      case "/":
        return MaterialPageRoute(
          builder: (_) => const EntryPage(),
        );
      case "/bycategory":
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<TasksCubit>(
                create: (context) => TasksCubit(
                  Task_Crud(
                    taskService: taskService,
                  ),
                ),
              ),
              BlocProvider<NotificationCubit>(
                create: (context) => NotificationCubit(
                  notification,
                  Task_Crud(
                    taskService: taskService,
                  ),
                ),
              ),
            ],
            child: TasksByCategoryPage(
              category: args as String,
            ),
          ),
        );
    }
    return null;
  }
}
