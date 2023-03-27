import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/data/hive_init.dart';
import 'package:todo_app/core/theme/theme.dart';
import 'package:todo_app/core/router/router.dart';
import 'package:todo_app/core/provider/category_provider.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones();
  await HiveData.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final RouteGenerator router = RouteGenerator();
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CategoryProvider())],
      child: MaterialApp(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,
        theme: MainTheme.light,
        initialRoute: "/",
        onGenerateRoute: router.routeGenerate,
      ),
    );
  }
}
