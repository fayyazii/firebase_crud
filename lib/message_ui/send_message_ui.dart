import 'package:firebase_crud/cubits/message_cubit/message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class sendMessage extends StatelessWidget {

  final txtname = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              controller: txtname,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "send message",
              ),
            ),
          ),
          BlocListener<MessageCubit, MessageState>(
            listener: (context, state) {
              if(state is MessageLoading)
                {
                  showDialog(context: context, builder: (context)=>AlertDialog(
                    content: SizedBox(
                        height:100,
                        child: Center(child: CircularProgressIndicator())),
                  ));
                }
              if(state is MessageLoaded)
                {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Sended"))
                  );
                }
              if(state is MessageError)
              {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.err))
                );
              }

            },
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Map<String, dynamic> txtdata = {
                  'message': txtname.text.trim(),
                  'sender': "0311",
                  'receiver': "0334",
                };
                context.read<MessageCubit>().sendMessageData(txtdata);
              },
              child: Text("Send"),),
          )

        ],
      ),
    );
  }
}
