import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/data/remote/api_helper.dart';
import 'package:shopping_application/data/repository/user_repository.dart';
import 'package:shopping_application/ui/screens/auth/auth_bloc.dart';
import 'package:shopping_application/ui/screens/home_screen.dart';
import 'package:shopping_application/ui/screens/product/product_bloc.dart';
import 'package:shopping_application/ui/screens/register/register_bloc.dart';
import 'package:shopping_application/ui/screens/registration_screen.dart';
import 'package:shopping_application/ui/screens/splash_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => RegisterBloc(
            userRepository: UserRepository(apiHelper: ApiHelper())),
      ),
      BlocProvider(
        create: (context) =>
            AuthBloc(userRepository: UserRepository(apiHelper: ApiHelper())),
      ),
      BlocProvider(
        create: (context) => ProductBloc(apiHelper: ApiHelper()),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
