import 'package:appcubit/cubit/app_cubit_logic.dart';
import 'package:appcubit/cubit/app_cubits.dart';
import 'package:appcubit/service/data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: BlocProvider<AppCubits>(
        create: (_) => AppCubits(dataServices: DataServices()),
        child: const AppCubitLogic()
      )
    );
  }
}