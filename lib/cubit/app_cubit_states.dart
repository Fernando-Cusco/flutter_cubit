import 'package:appcubit/model/data_model.dart';
import 'package:equatable/equatable.dart';

abstract class ClubitState extends Equatable {}

class InitialState extends ClubitState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends ClubitState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ClubitState {
  @override
  List<Object> get props => [];
}

class LoadedState extends ClubitState {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

class DetailState extends ClubitState {
  DetailState(this.place);
  final DataModel place;
  @override
  List<Object> get props => [place];
}



