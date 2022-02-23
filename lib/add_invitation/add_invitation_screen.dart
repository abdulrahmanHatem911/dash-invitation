import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:invitation_app/constant/constant_screen.dart';
import 'package:invitation_app/cubit/app_cubit.dart';
import 'package:invitation_app/cubit/app_states.dart';

var floatAddKey = GlobalKey();
var scafoldKey = GlobalKey<ScaffoldState>();
var formKey = GlobalKey<FormState>();

//controllers >>>>>>
var senderController = TextEditingController();
var receiverController = TextEditingController();
var dateController = TextEditingController();
var locationController = TextEditingController();

class AddInvitationScreen extends StatelessWidget {
  const AddInvitationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl, // set this property
          child: Scaffold(
            key: scafoldKey,
            appBar: AppBar(
              title: const Text('إضافة دعوه'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 300.0,
                    child: Image(
                      image: AssetImage('assest/image/duck_8.png'),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'مرحبا بك في تطبيق دعوات داش ',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 10.0),
                  // the text to sender name
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: receiverController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'المرسل إليه ',
                              hintText: '',
                              prefixIcon: Icon(Icons.text_fields),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'القيمو التي أدخلتها غير صحيحه';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10.0),
                          // the tex for the sender
                          TextFormField(
                            controller: senderController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'المرسل ',
                              prefixIcon: Icon(Icons.text_fields),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'القيمة التي أدخلتها غير صحيحه';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: dateController,
                            decoration: const InputDecoration(
                              labelText: 'التاريخ',
                              prefixIcon: Icon(Icons.date_range_outlined),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'القيمة التي أدخلتها غير صحيحه';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: locationController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'المكان',
                              prefixIcon: Icon(Icons.location_on),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'القيمة التي أدخلتها غير صحيحه';
                              }
                              return null;
                            },
                          ),
                          // the botton
                          const SizedBox(height: 10.0),
                          Container(
                            width: 200.0,
                            height: 45.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: MaterialButton(
                              color: HexColor('2d767f'),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.insertDataBase(
                                    sender: senderController.text,
                                    receiver: receiverController.text,
                                    date: dateController.text,
                                    location: locationController.text,
                                  );
                                  navigatorFrom(context);
                                }
                              },
                              child: const Text(
                                'إضافة',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
