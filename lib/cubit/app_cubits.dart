import 'package:appcubit/cubit/app_cubit_states.dart';
import 'package:appcubit/model/data_model.dart';
import 'package:appcubit/service/data_service.dart';
import 'package:bloc/bloc.dart';

class AppCubits extends Cubit<ClubitState> {
  AppCubits({required this.dataServices}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices dataServices;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await dataServices.getInfo();
      emit(LoadedState(places));
      // dataServices.
    } catch (e) {}
  }

  detailPage(DataModel dataModel) {
    emit(DetailState(dataModel));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
