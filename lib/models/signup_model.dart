class Signupandlogin_model
{
  bool? token;

  Signupandlogin_model({required this.token});
  factory Signupandlogin_model.fromjson(Map<String,dynamic>json)
  {
    return Signupandlogin_model(token: json['token']);
  }
}