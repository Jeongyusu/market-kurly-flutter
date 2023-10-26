// 창고
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Param {
  bool isChecked;
  Param(this.isChecked);
}

// 창고데이터
class ParamStore extends StateNotifier<Param?> {
  ParamStore(super._state);

  void init() {
    state = Param(true);
  }

  void AllChecked() {
    state = Param(true);
  }

  void AllDispose() {
    state = Param(false);
  }
}

final paramProvider = StateNotifierProvider<ParamStore, Param?>((ref) {
  return ParamStore(null)..init();
});
