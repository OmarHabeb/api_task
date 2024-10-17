import 'package:api_task/control/cubit/get_data_cubit.dart';
import 'package:api_task/veiw/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetDataCubit()..res()..res2(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: home_screen(),
      ),
    );
  }
}
