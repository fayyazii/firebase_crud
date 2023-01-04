import 'package:firebase_crud/cubits/add_person_cubit/add_person_cubit.dart';
import 'package:firebase_crud/cubits/fetch_all_persons/fetch_all_persons_cubit.dart';
import 'package:firebase_crud/cubits/message_cubit/message_cubit.dart';
import 'package:firebase_crud/cubits/qrcubits/qrcubits_cubit.dart';
import 'package:firebase_crud/cubits/receive_message_cubit.dart';
import 'package:firebase_crud/message_ui/send_message_ui.dart';
import 'package:firebase_crud/views/add_person.dart';
import 'package:firebase_crud/views/home_page.dart';
import 'package:firebase_crud/views/qrscan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'message_ui/receive_message_ui.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AddPersonCubit()),
        BlocProvider(create: (context)=>FetchAllPersonsCubit()),
        BlocProvider(create: (context)=>MessageCubit()),
        BlocProvider(create: (context)=>ReceiveMessageCubit()),
        BlocProvider(create: (context)=>QrcubitsCubit()),
      ],
      child: MaterialApp(
        home:QrScanner(),
      ),
    );
  }
}
