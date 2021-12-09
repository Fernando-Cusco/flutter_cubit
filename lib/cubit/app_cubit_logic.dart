import 'package:appcubit/cubit/app_cubit_states.dart';
import 'package:appcubit/cubit/app_cubits.dart';
import 'package:appcubit/pages/bienvenido_page.dart';
import 'package:appcubit/pages/detail_page.dart';
import 'package:appcubit/pages/navpages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogic extends StatelessWidget {
  const AppCubitLogic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, ClubitState>(builder: (_, state) {
        if (state is WelcomeState) {
          return BienvenidoPage();
        }
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedState) {
          return const HomePage();
        }
        if (state is DetailState) {
          return DetailPage();
        } else {
          return Container();
        }
      }),
    );
  }
}
