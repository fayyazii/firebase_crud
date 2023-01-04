part of 'receive_message_cubit.dart';


abstract class ReceiveMessageState {}

class ReceiveMessageInitial extends ReceiveMessageState {}
class ReceiveMessageloading extends ReceiveMessageState {}
class ReceiveMessageLoaded extends ReceiveMessageState {
  List<MessageModel> msgmodel =[];
  ReceiveMessageLoaded({required this.msgmodel});
}
class ReceiveMessageerror extends ReceiveMessageState {
  String err;
  ReceiveMessageerror({required this.err});
}
