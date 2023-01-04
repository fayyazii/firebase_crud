import 'package:firebase_crud/cubits/fetch_all_persons/fetch_all_persons_cubit.dart';
import 'package:firebase_crud/views/add_person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    context.read<FetchAllPersonsCubit>().getAllPersons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<FetchAllPersonsCubit, FetchAllPersonsState>(
        builder: (context, state) {
          if(state is FetchAllPersonsLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is FetchAllPersonsLaoded) {
            return ListView.builder(
            itemCount: state.persons.length,
            itemBuilder: (context, index) {
              return  Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(state.persons[index].name),
                ),
              );
            },
          );
          }
          if(state is FetchAllPersonsError){
            return Center(
              child: Text(state.err),
            );
          }
          else{
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPerson()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
