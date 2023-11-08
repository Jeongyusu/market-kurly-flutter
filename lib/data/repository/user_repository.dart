import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:logger/logger.dart';

// V -> P(전역프로바이더, 뷰모델) -> R
class UserRepository {
  Future<ResponseDTO> fetchUserUpdate(UserUpdateReqDTO userUpdateReqDTO) async {
    Logger().d(userUpdateReqDTO.userBirth);
    try {
      // dynamic -> http body
      Response<dynamic> response =
      await dio.post("/api/users/update", data: userUpdateReqDTO.toJson());
      Logger().d("요청완료됨111");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // responseDTO.data = User.fromJson(responseDTO.data);

      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "중복된 유저명입니다.");
    }
  }

  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    Logger().d(requestDTO.userBirth);
    try {
      // dynamic -> http body
      Response<dynamic> response =
      await dio.post("/api/users/join", data: requestDTO.toJson());
      Logger().d("요청완료됨111");
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
      Logger().d("fetchLogin요청됨");
      Response<dynamic> response = await dio.post<dynamic>("/api/users/login",
          data: requestDTO.toJson());

      Logger().d(response);
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("파싱완료1");
      responseDTO.response = User.fromJson(responseDTO.response);
      Logger().d("파싱완료2");

      final jwt = response.headers["Authorization"];

      if (jwt != null) {
        responseDTO.token = jwt.first;
      }
      Logger().d("jwt토큰 넣기");
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(success: false, response: null, error: "로그인실패.");
    }
  }
}
