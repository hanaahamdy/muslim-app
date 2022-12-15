import 'package:al_quraan_alkareem/features/home_layout/home_bloc/home_bloc.dart';
import 'package:al_quraan_alkareem/features/home_layout/home_bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeStates>(
        builder: (context, state) {
          HomeBloc cubit = HomeBloc.get(context);
          return Scaffold(
            body: cubit.screens[cubit.current_index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.current_index,
              onTap: (index) {
                cubit.currentBottomIndex(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
