import 'package:http/http.dart' as http;
import 'dart:convert';

String _url =
    "http://phoblockcloudserver-env.eba-3ibk4ivu.us-east-2.elasticbeanstalk.com/Users";

class UserData {
  static List data = [];
  Future<List> getCode() async {
    var res = await http.get(_url);
    var res_json = json.decode(res.body);
    return res_json;
  }
}
