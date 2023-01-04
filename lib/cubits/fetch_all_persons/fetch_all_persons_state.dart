part of 'fetch_all_persons_cubit.dart';


abstract class FetchAllPersonsState {}

class FetchAllPersonsInitial extends FetchAllPersonsState {}
class FetchAllPersonsLoading extends FetchAllPersonsState {}
class FetchAllPersonsLaoded extends FetchAllPersonsState {
  List<PersonModel> persons;
  FetchAllPersonsLaoded({required this.persons});
}
class FetchAllPersonsError extends FetchAllPersonsState {
  String err;
  FetchAllPersonsError({required this.err});
}
