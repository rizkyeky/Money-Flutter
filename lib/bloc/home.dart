part of 'bloc.dart';

class HomeBloc implements Bloc {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final StateController<int> counter = StateController(0);

  void increment() {
    counter.value++;
  }

  List<Map<String, dynamic>> overview = [
    {
      'label': 'Income',
      'total': 12000,
      'color': 0xFFEB568C
    },
    {
      'label': 'Outcome',
      'total': 24000,
      'color': 0xFF5878CA
    }
  ];

}