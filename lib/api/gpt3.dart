import 'package:http/http.dart' as http;

getQuery(String url) async {
  var response = await http.get(Uri.parse(url));
  return response.body;
}
