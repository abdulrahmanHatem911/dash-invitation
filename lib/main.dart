import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invitation_app/constant/color/constant_color.dart';
import 'package:invitation_app/cubit/app_cubit.dart';
import 'package:invitation_app/cubit/app_states.dart';
import 'package:invitation_app/invitation_screen.dart';
import 'constant/bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDataBase(),
      child: BlocConsumer<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            home: Directionality(
              textDirection: TextDirection.rtl, // set this property
              child: InvitationScreen(),
              //TestScreen(),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
