import 'package:bloc/bloc.dart';
import 'package:firebase_crud/message_ui/send_message_ui.dart';
import 'package:firebase_crud/repositories/messagerepo.dart';
import 'package:meta/meta.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());
  sendMessageData(Map<String,dynamic> data)async
  {
    try{
      emit(MessageLoading());
      await messageRepo.sendData(data);
      emit(MessageLoaded());

    }catch(e)
    {
      emit(MessageError(err: e.toString()));
    }
  }
}
