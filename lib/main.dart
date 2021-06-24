import 'package:flutter/material.dart';
import 'package:omdb_api_bloc/presentation/router.dart';

void main() {
  runApp(MyApp(router:AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({Key? key, required this.router}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
