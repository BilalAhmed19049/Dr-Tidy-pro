import 'package:flutter_riverpod/flutter_riverpod.dart';

final hourProvider = StateNotifierProvider<HourNotifier, int>(
  (ref) {
    return HourNotifier();
  },
);

class HourNotifier extends StateNotifier<int> {
  HourNotifier() : super(2);

  void increment() {
    state++;
  }

  void decrement() {
    if (state > 2) state--;
  }
}
