import 'package:http/http.dart' as http;
import 'package:kursach/data/headers/login_header.dart';

///Data looks like:
///{
///'token':String,
///'title':String,
///'priv':bool,
///}
///Response looks like:
///int - board id
///token - user`s auth token;
///title - name of board;
///priv - if true - board will be user`s, else it`ll be companies;
Future<http.Response> createBoard(String data)async{
  var url = Uri.parse("http://217.25.89.68:25448/Board/board");
  var response = await http.post(url, headers: loginHeaders, body: data);
  return response;
}