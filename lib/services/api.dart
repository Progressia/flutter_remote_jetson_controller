import 'package:http/http.dart' as http;

Future GetData(url) async {
  try {
    http.Response Response = await http.get(Uri.parse(url));
    return Response.body;
  } catch (e) {
    print('API GetData: Error');
  }
}

Future PostData(url) async {
  try {
    http.Response Response = await http.post(Uri.parse(url));
    return Response.body;
  } catch (e) {
    print('API PostData: Error');
  }
}
