part of 'qrcubits_cubit.dart';

@immutable
abstract class QrcubitsState {}

class QrcubitsInitial extends QrcubitsState {}
class QrcubitsLoading extends QrcubitsState {}
class QrcubitsLoaded extends QrcubitsState {
  var data ;
  QrcubitsLoaded({required this.data});
}
class QrcubitsError extends QrcubitsState {
  String err;
  QrcubitsError({required this.err});
}
