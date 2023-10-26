
import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request/user_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_radio_button_item.dart';
import 'package:logger/logger.dart';

void main() async {
  JoinReqDTO requestDTO = JoinReqDTO(userId: "as32df", userPassword: "1234", username: "ssar123", userEmail: "12342@naver.com", userBirth: "1992-01-20", userGender: "MAN");
  await fetchJoin(requestDTO);
}


Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
  try {
    Logger().d("이까지완료");
    Logger().d(requestDTO.username);
    // dynamic -> http body
    final response = await dio.post("/api/userJoin", data: requestDTO.toJson());
    Logger().d("이까지완료22");
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    // responseDTO.data = User.fromJson(responseDTO.data);

    return responseDTO;
  } catch (e) {
    // 200이 아니면 catch로 감
    return ResponseDTO(success: false, response: null, error: "중복된 유저명입니다.");
  }
}