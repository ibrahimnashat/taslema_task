// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:math';

import '../../../core/bloc/event.dart';
import '../../../core/bloc/state.dart';
import '../../../core/consts/exports.dart';

@injectable
class HomeBloc extends Bloc<ProcessEvent, ProcessState> {
  final List<HomeItem> items = [
    HomeItem(
      name: 'Sports',
      icon: 'https://www.svgrepo.com/show/446027/sports-volleyball.svg',
    ),
    HomeItem(
      name: 'Music',
      icon: 'https://www.svgrepo.com/show/512530/music-997.svg',
    ),
    HomeItem(
      name: 'Food',
      icon: 'https://www.svgrepo.com/show/490738/food-restaurant.svg',
    ),
    HomeItem(
      name: 'Traveling',
      icon: 'https://www.svgrepo.com/show/490293/porsche-911.svg',
    ),
    HomeItem(
      name: 'Cinema',
      icon: 'https://www.svgrepo.com/show/490291/popcorn.svg',
    ),
  ];

  HomeBloc() : super(InitState()) {
    on<ProcessEvent>(_init);
  }

  void _init(ProcessEvent event, Emitter<ProcessState> emit) async {}

  Color get color {
    return [
      Coolors.redVenetian,
      Coolors.greenAccent,
      Coolors.brown,
    ].elementAt(Random().nextInt(3));
  }
}

class HomeItem {
  final String name;
  final String icon;

  HomeItem({
    required this.name,
    required this.icon,
  });
}
