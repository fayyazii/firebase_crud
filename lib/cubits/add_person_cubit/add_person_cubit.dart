import 'package:bloc/bloc.dart';
import 'package:firebase_crud/repositories/add_person_repo.dart';
import 'package:meta/meta.dart';

part 'add_person_state.dart';

class AddPersonCubit extends Cubit<AddPersonState> {
  AddPersonCubit() : super(AddPersonInitial());

  uploadData(Map<String,dynamic> data)async{
    try {
      emit(AddPersonLoading());
      var response = await AddPersonRepo.addPerson(data);
      emit(AddPersonAdded());
    }catch(e){
      emit(AddPersonError(err: e.toString()));
    }
  }
}
