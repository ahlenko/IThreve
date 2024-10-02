import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
    List<Token> token;

    LoginResponse({
        required this.token,
    });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Token {
    String type;
    String value;

    Token({
        required this.type,
        required this.value,
    });

  factory Token.fromJson(Map<String, dynamic> json) =>
      _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
