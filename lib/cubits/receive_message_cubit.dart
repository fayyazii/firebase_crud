import 'package:bloc/bloc.dart';
import 'package:firebase_crud/cubits/message_cubit/message_cubit.dart';
import 'package:firebase_crud/models/message_model.dart';
import 'package:firebase_crud/repositories/receivemessagerepo.dart';
import 'package:meta/meta.dart';

part 'receive_message_state.dart';

class ReceiveMessageCubit extends Cubit<ReceiveMessageState> {
  ReceiveMessageCubit() : super(ReceiveMessageInitial());
  getMessages()async
  {
    try{
      List<MessageModel> msgmodel =[];
      emit(ReceiveMessageloading());
      var data = receiveMessageRepo.receiveMessage();
      data.listen((event) {
        msgmodel.clear();
        for (var doc in event.docs)
          {
            var model = MessageModel.fromJson(doc.data());
            msgmodel.add(model);
          }
        emit(ReceiveMessageLoaded(msgmodel: msgmodel));
      });

    }catch(e) {
      emit(ReceiveMessageerror(err: e.toString()));
    }
  }
}
