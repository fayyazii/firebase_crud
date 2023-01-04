import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/models/participant_model.dart';
import 'package:firebase_crud/repos/qrscanrepo.dart';
import 'package:meta/meta.dart';

part 'qrcubits_state.dart';

class QrcubitsCubit extends Cubit<QrcubitsState> {
  QrcubitsCubit() : super(QrcubitsInitial());
  getdata(String code)async
  {
    try{
      emit(QrcubitsLoading());
     var responce =  await QrScanRepo.getdata(code);
     if(responce.docs.isNotEmpty){
       var model=ParticipantModel.fromJson(responce.docs.first.data());
       emit(QrcubitsLoaded(data: model));
     }
     else{
       throw Exception("no result found");
     }

    }catch(e)
    {
      if( e is FirebaseException)
        {
          emit(QrcubitsError(err: e.message.toString()));
        }
      if( e is SocketException)
      {
        emit(QrcubitsError(err: e.message.toString()));
      }
      else{
        emit(QrcubitsError(err: e.toString()));
      }
    }
  }
}
