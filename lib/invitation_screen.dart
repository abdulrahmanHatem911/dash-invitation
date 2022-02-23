import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invitation_app/add_invitation/add_invitation_screen.dart';
import 'package:invitation_app/body_screen/body_screen.dart';
import 'package:invitation_app/constant/constant_screen.dart';
import 'package:invitation_app/cubit/app_cubit.dart';
import 'package:invitation_app/cubit/app_states.dart';
// the keys

var floatingKey1 = GlobalKey();
var scaffoldeKey1 = GlobalKey<ScaffoldState>();

class InvitationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          key: scaffoldeKey1,
          appBar: AppBar(
            title: const Text('دعوات داش'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.markunread_sharp),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
              ),
            ],
          ),
          body: ConditionalBuilder(
            condition: true,
            builder: (context) => BodyScreen(),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            key: floatingKey1,
            onPressed: () {
              navigateTo(context, AddInvitationScreen());
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
