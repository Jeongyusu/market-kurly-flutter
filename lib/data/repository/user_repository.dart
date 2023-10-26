import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request/user_request.dart';
import 'package:flutter_blog/data/model/user.dart';

// V -> P(전역프로바이더, 뷰모델) -> R
class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    try {
      // dynamic -> http body
      Response<dynamic> response =
          await dio.post("/api/userJoin", data: requestDTO.toJson());
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // responseDTO.data = User.fromJson(responseDTO.data);

      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "중복된 유저명입니다.");
    }
  }

  Future<ResponseDTO> fetchLogin(LoginReqDTO requestDTO) async {
    try {
      Response<dynamic> response =
          await dio.post<dynamic>("/login", data: requestDTO.toJson());

      print(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.response = User.fromJson(responseDTO.response);

      final jwt = response.headers["Authorization"];

      // if (jwt != null) {
      //   responseDTO.token = jwt.first;
      // }

      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "중복된 유저명입니다.");
    }
  }
}
