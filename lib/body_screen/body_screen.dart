import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:invitation_app/cubit/app_cubit.dart';
import 'package:invitation_app/cubit/app_states.dart';

import '../constant/constant_screen.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        List event = AppCubit.get(context).events;
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildeItem(event[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
              end: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.black45,
            ),
          ),
          itemCount: event.length,
        );
      },
    );
  }
}
