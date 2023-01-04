import 'package:firebase_crud/cubits/add_person_cubit/add_person_cubit.dart';
import 'package:firebase_crud/repositories/add_person_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPerson extends StatelessWidget {
  AddPerson({Key? key}) : super(key: key);
  final txtEmail = TextEditingController();
  final txtName = TextEditingController();
  final txtAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          customField(hint: "email", controller: txtEmail),
          customField(hint: "name", controller: txtName),
          customField(hint: "age", controller: txtAge),
          const SizedBox(
            height: 30,
          ),

          BlocListener<AddPersonCubit, AddPersonState>(
            listener: (context, state) {
              if(state is AddPersonLoading){
                showDialog(
                    context: context,
                    builder: (context)=>const AlertDialog(
                      content: SizedBox(
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                );
              }
              if(state is AddPersonAdded){
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("added"))
                );
              }
              if(state is AddPersonError){
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.err), backgroundColor: Colors.red,)
                );
              }
            },
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Map<String, dynamic> personData = {
                  'name': txtName.text,
                  'email': txtEmail.text,
                  'age': txtAge.text,
                };

                context.read<AddPersonCubit>().uploadData(personData);
              },
              child: const Text(
                "Add person", style: TextStyle(color: Colors.white),),
            ),
          )

        ],
      ),
    );
  }

  Widget customField(
      {required String hint, required TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hint,
            labelText: hint
        ),
      ),
    );
  }
}
