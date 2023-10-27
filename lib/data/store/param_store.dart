// 창고
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Param {
  bool? isChecked;
  Param({this.isChecked});
}

// 창고데이터
class ParamStore extends StateNotifier<Param?> {
  ParamStore(super._state);

  void initChecked() {
    state = Param(isChecked: true);
  }

  void AllChecked() {
    state = Param(isChecked: true);
  }

  void AllDispose() {
    state = Param(isChecked: true);
  }
}

final paramProvider = StateNotifierProvider<ParamStore, Param?>((ref) {
  return ParamStore(Param(isChecked: true));
});
