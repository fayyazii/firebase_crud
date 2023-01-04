part of 'add_person_cubit.dart';


abstract class AddPersonState {}

class AddPersonInitial extends AddPersonState {}
class AddPersonLoading extends AddPersonState {}
class AddPersonAdded extends AddPersonState {}
class AddPersonError extends AddPersonState {
  String err;
  AddPersonError({required this.err});
}
