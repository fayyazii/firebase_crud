import 'package:bloc/bloc.dart';
import 'package:firebase_crud/repositories/fetch_persons_repo.dart';
import 'package:meta/meta.dart';

import '../../models/person_model.dart';

part 'fetch_all_persons_state.dart';

class FetchAllPersonsCubit extends Cubit<FetchAllPersonsState> {
  FetchAllPersonsCubit() : super(FetchAllPersonsInitial());

  getAllPersons()async{
    try{
      List<PersonModel> persons=[];
      emit(FetchAllPersonsLoading());
    var listener=await FetchPersonsRepo.getData();
    listener.listen((event) {
      persons.clear();
      for(var doc in event.docs){
        var model=PersonModel.fromJson(doc.data());
        persons.add(model);
      }
      emit(FetchAllPersonsLaoded(persons: persons));
    });
    }catch(e)
    {
      emit(FetchAllPersonsError(err: e.toString()));
    }
  }
}
