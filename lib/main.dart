import 'package:chatting_app/route/route_generator.dart';
import 'package:flutter/material.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Finesse',
      debugShowCheckedModeBanner: false,
      initialRoute: '/mainScreen',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
