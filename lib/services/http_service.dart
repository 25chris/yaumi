import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/models/strapi/yaumi_strapi.dart' as strapi;
import 'package:yaumi/models/yaumi_user.dart';
import 'package:yaumi/services/snacked_service.dart';

class HttpService {
  Future<strapi.YaumiStrapi?> getYaumiByDateAndMail(
      {required String email, required String date}) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://amala-api.online/api/yaumis?filters[yaumi_user][email][\$eq]=$email&filters[date][\$eq]=$date'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      return strapi.YaumiStrapi.fromJson(json.decode(responseBody));
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<YaumiUser?> getYaumiUser() async {
    var request = http.Request('GET',
        Uri.parse('https://amala-api.online/api/yaumi-users?populate=*'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      // print(responseBody); // Log the response body
      // Assuming you have a fromJson method that properly parses the JSON into a YaumiUser object
      return YaumiUser.fromJson(json.decode(responseBody));
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future registerToStrapi(
      {required String nama,
      required String email,
      required String uid,
      required String namaGroup,
      required String gid}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://amala-api.online/api/yaumi-users'));
    request.body = json.encode({
      "data": {"nama": nama, "email": email, "uid": uid, "group": "", "gid": ""}
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("Success");
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> checkUserRegistration({required String email}) async {
    try {
      final response =
          await http.get(Uri.parse('https://amala-api.online/api/yaumi-users'));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('data')) {
          final List<dynamic> users = responseData['data'];
          final user = users.firstWhere(
            (user) => user['attributes']['email'] == email,
            orElse: () => null,
          );
          if (user != null) {
            print(
                'User with email $email is already registered with ID: ${user['id']}');
          } else {
            print('User with email $email is not registered.');
          }
        } else {
          print('Unexpected response format.');
        }
      } else {
        print('Failed to fetch users. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future<void> postYaumi(
      {required String email,
      required String date,
      required bool shubuh,
      required bool dhuhur,
      required bool ashar,
      required bool maghrib,
      required bool isya,
      required int tahajud,
      required int dhuha,
      required bool qshubuh,
      required bool qdhuhur,
      required bool bdhuhur,
      required bool bmaghrib,
      required bool bisya,
      required int tilawah,
      required double poin,
      required String shaumSunnah,
      required bool sedekah,
      required bool dzikirPagi,
      required bool dzikirPetang,
      required String taklim,
      required bool istighfar,
      required bool shalawat}) async {
    try {
      final response = await http.get(
        Uri.parse('https://amala-api.online/api/yaumi-users'),
        headers: {'Content-Type': 'application/json'},
        // Include authorization header if needed
        // 'Authorization': 'Bearer your_token_here',
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('data')) {
          final List<dynamic> users = responseData['data'];
          final user = users.firstWhere(
            (user) => user['attributes']['email'] == email,
            orElse: () => null,
          );
          if (user != null) {
            final postResponse = await http.post(
              Uri.parse('https://amala-api.online/api/yaumis'),
              headers: {
                'Content-Type': 'application/json',
                // 'Authorization': 'Bearer your_token_here',
              },
              body: json.encode({
                "data": {
                  "shubuh": shubuh,
                  "dhuhur": dhuhur,
                  "ashar": ashar,
                  "maghrib": maghrib,
                  "isya": isya,
                  "tahajud": tahajud,
                  "dhuha": dhuha,
                  "qshubuh": qshubuh,
                  "qdhuhur": qdhuhur,
                  "bdhuhur": bdhuhur,
                  "bmaghrib": bmaghrib,
                  "bisya": bisya,
                  "tilawah": tilawah,
                  "shaum": "Ramadhan",
                  "sedekah": sedekah,
                  "taklim": "Taklim Online",
                  "istighfar": istighfar,
                  "shalawat": shalawat,
                  "date": date,
                  "yaumi_user": user['id']
                }
              }),
            );
            if (postResponse.statusCode == 200) {
              print('submitted');
            } else {
              print('submit fail with ${postResponse.statusCode}');
            }
          } else {
            print('user not registered');
          }
        } else {
          print('response unexpected');
        }
      } else {
        print('no user');
      }
    } catch (e) {
      print('internet');
    }
  }
}
