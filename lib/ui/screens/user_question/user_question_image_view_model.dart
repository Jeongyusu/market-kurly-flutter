// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';
//
// class UserQuestionImageModel {
//   List<XFile> list;
//
//   UserQuestionImageModel(this.list);
// }
//
// class UserQuestionImageViewModel extends StateNotifier<List<XFile>> {
//   UserQuestionImageViewModel() : super([]);
//
//   void insertImg(List<XFile> list) {
//     state = list;
//   }
//
//   removeImg(int idx) {
//     var temp = [...state];
//     temp.removeAt(idx);
//     state = temp;
//   }
// }
//
// final selectedImgProvider =
//     StateNotifierProvider<UserQuestionImageViewModel, List<XFile>>((ref) {
//   return UserQuestionImageViewModel();
// });
