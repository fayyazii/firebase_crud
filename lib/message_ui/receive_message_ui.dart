import 'package:firebase_crud/cubits/receive_message_cubit.dart';
import 'package:firebase_crud/message_ui/send_message_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class receiveMessage extends StatefulWidget {
  const receiveMessage({Key? key}) : super(key: key);

  @override
  State<receiveMessage> createState() => _receiveMessageState();
}

class _receiveMessageState extends State<receiveMessage> {
  @override
  void initState() {
    context.read<ReceiveMessageCubit>().getMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ReceiveMessageCubit, ReceiveMessageState>(
          builder: (context, state) {
            if (state is ReceiveMessageloading)
              return Center(
                child: CircularProgressIndicator(),
              );
            if (state is ReceiveMessageLoaded) {
              return ListView.builder(
                itemCount: state.msgmodel.length,
                itemBuilder: (context, index) {
                  return Text(state.msgmodel[index].message);
                },
              );
            } else
              return SizedBox();
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>sendMessage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
