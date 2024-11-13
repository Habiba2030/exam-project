class Productmodel
{
  List<dynamic>?data;
  Productmodel({required this.data});
  factory Productmodel.fromjson(Map<String,dynamic>json)
  {
    return Productmodel(data: json['data']['products']);
  }

}