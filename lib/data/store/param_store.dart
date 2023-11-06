// 창고
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Param {
  bool? isChecked;
  List<int>? removeList;
  Param({this.isChecked, this.removeList});
}

// 창고데이터
class ParamStore extends StateNotifier<Param?> {
  ParamStore(super._state);

  void removeListAdd(int index) {
    List<int> updatedRemoveList = [...state!.removeList ?? [], index];
    state = Param(removeList: updatedRemoveList);
  }
  void removeListRemove(int index) {
    List<int> currentRemoveList = state!.removeList!;
    if (currentRemoveList != null && currentRemoveList.contains(index)) {
      currentRemoveList.remove(index);
      state = Param(removeList: currentRemoveList);
    }
  }

  void AllChecked(bool value) {
    if(state!.isChecked == value) {
      state = Param(isChecked: !value);
    }else{
      state = Param(isChecked: value);
    }

  }

  void AllDispose() {
    state = Param(isChecked: true);
  }
}

final paramProvider = StateNotifierProvider<ParamStore, Param?>((ref) {
  return ParamStore(Param(isChecked: true, removeList: []));
});
