// 창고
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Param {
  bool? isChecked;
  String? gender ="MAN";
  DateTime? birth = DateTime.now();
  Param({this.isChecked, this.gender, this.birth});
}

// 창고데이터
class ParamStore extends StateNotifier<Param?> {
  ParamStore(super._state);


  void saveDateTime(DateTime userBirth) {
    state = Param(birth: userBirth);
  }

  void selectedGenderMan(){
    state = Param(gender: "MAN");
  }

  void selectedGenderWoman(){
    state = Param(gender: "Woman");
  }

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
  return ParamStore(null);
});
