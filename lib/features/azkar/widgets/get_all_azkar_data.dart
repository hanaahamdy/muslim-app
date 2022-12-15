

import '../data/data_base/azkar_bloc/azkar_bloc.dart';
List<dynamic> all_azkar_list(AzkarBloc cubit) {
  List allAzkar = [
    cubit.morning,
    cubit.evening,
    cubit.after_sleeping,
    cubit.suit_wearing,
    cubit.in_bathroom,
    cubit.out_bathroom,
    cubit.wedoaa,
    cubit.after_wedoaa,
    cubit.house_left,
    cubit.house_enter,
    cubit.mosqu_route,
    cubit.mosqu_enter,
    cubit.mosq_leave,
    cubit.azkar_azan,
    cubit.azan_listening,
    cubit.rekooa,
    cubit.after_rekoaa,
    cubit.sgood,
    cubit.between_sgood,
    cubit.sleeping_zekr,
  ];
  return allAzkar;
}