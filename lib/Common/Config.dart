import 'package:http/http.dart' as http;

class Config{

  //base url
  static String baseUrl = "https://jsonplaceholder.typicode.com";

  //end url
  static String postUrl = "/posts";
  static String commentUrl = "/comments";

  //http client
  static var client = http.Client();

  //status code
  static var TWO_HUNDRED_STATUS = 200;
  static var THREE_HUNDRED_STATUS = 300;
  static var FOUR_HUNDRED_STATUS = 400;

}