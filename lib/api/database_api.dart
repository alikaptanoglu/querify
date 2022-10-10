import 'package:http/http.dart' as http;

exQuery(String query) async {
  var response = await http.get(Uri.parse(query));
  return response.body;
}
