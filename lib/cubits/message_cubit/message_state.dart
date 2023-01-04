part of 'message_cubit.dart';


abstract class MessageState {}

class MessageInitial extends MessageState {}
class MessageLoading extends MessageState {}
class MessageLoaded extends MessageState {}
class MessageError extends MessageState {
  String err;
  MessageError({required this.err});
}
