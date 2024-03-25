import 'package:http/http.dart' as http;
import 'package:yaumi/models/yaumi_user.dart';

class HttpService {
  Future getYaumi() async {
    var request = http.Request(
        'GET', Uri.parse('https://amala-api.online/api/yaumis?populate=*'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<YaumiUser?> getYaumiUser() async {
    var request = http.Request('GET',
        Uri.parse('https://amala-api.online/api/yaumi-users?populate=*'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
