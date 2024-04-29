import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/models/strapi/yaumi_strapi.dart' as yaumiStrapi;
import 'package:yaumi/models/yaumi_user.dart';

class HttpService {
  final _dialogService = locator<DialogService>();

  //===YAUMI====GET
  Future<yaumiStrapi.YaumiStrapi?> getYaumiByDateAndMail(
      {required String email, required String date}) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://amala-api.online/api/yaumis?filters[yaumi_user][email][\$eq]=$email&filters[date][\$eq]=$date'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      return yaumiStrapi.YaumiStrapi.fromJson(json.decode(responseBody));
    } else {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Data tidak dapat diambil",
          description:
              "Error dengan kode: ${response.statusCode}, cek koneksi internet anda lalu coba beberapa saat lagi. Atau hubungi bagian administrasi.");
      // print(response.reasonPhrase);
    }
    return null;
  }

  Future<yaumiStrapi.YaumiStrapi?> getYaumiByMail(
      {required String email}) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://amala-api.online/api/yaumis?filters[yaumi_user][email][\$eq]=$email'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      return yaumiStrapi.YaumiStrapi.fromJson(json.decode(responseBody));
    } else {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Data tidak dapat diambil",
          description:
              "Error dengan kode: ${response.statusCode}, cek koneksi internet anda lalu coba beberapa saat lagi. Atau hubungi bagian administrasi.");
      // print(response.reasonPhrase);
    }
    return null;
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
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Data tidak dapat diambil",
          description:
              "Error dengan kode: ${response.statusCode}, cek koneksi internet anda lalu coba beberapa saat lagi. Atau hubungi bagian administrasi.");
      // print(response.reasonPhrase);
      return null;
    }
  }

  //======YAUMI======PUT
  Future putYaumi(
      {required String id,
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
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT', Uri.parse('https://amala-api.online/api/yaumis/$id'));
    request.body = json.encode({
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
        "shaum": shaumSunnah,
        "sedekah": sedekah,
        "taklim": taklim,
        "istighfar": istighfar,
        "shalawat": shalawat,
        "poin": poin
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
    } else {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Data tidak dapat diambil",
          description:
              "Error dengan kode: ${response.statusCode}, cek koneksi internet anda lalu coba beberapa saat lagi. Atau hubungi bagian administrasi.");
      // print(response.reasonPhrase);
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
      // print("Success");
      // print(await response.stream.bytesToString());
    } else {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Data tidak dapat diambil",
          description:
              "Error dengan kode: ${response.statusCode}, cek koneksi internet anda lalu coba beberapa saat lagi. Atau hubungi bagian administrasi.");
      // print(response.reasonPhrase);
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
            _dialogService.showCustomDialog(
                variant: DialogType.infoAlert,
                title: "Email Sudah Terdaftar",
                description:
                    "$email sudah terdaftar di database dengan id: ${user['id']}");
          } else {
            _dialogService.showCustomDialog(
                variant: DialogType.infoAlert,
                title: "$email Belum Terdaftar",
                description: "$email belum terdaftar di database.");
          }
        } else {
          _dialogService.showCustomDialog(
              variant: DialogType.infoAlert,
              title: "Terjadi Kesalahan",
              description:
                  "Sepertinya server kami bermasalah. Silahkan hubungi bagian administrasi.");
        }
      } else {
        _dialogService.showCustomDialog(
            variant: DialogType.infoAlert,
            title: "Gagal Mengambil Data User",
            description:
                "Gagal mengambil data user dengan kode error: ${response.statusCode}");
      }
    } catch (e) {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Terjadi Error",
          description:
              "Error saat mengambil data user. Silahkan cek koneksi internet anda lalu coba beberapa saat lagi. Jika masalah berlanjut hubungi bagian administrasi.");
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
                  "shaum": shaumSunnah,
                  "sedekah": sedekah,
                  "taklim": taklim,
                  "istighfar": istighfar,
                  "shalawat": shalawat,
                  "date": date,
                  "poin": poin,
                  "yaumi_user": user['id']
                }
              }),
            );
            if (postResponse.statusCode == 200) {
              // print('submitted');
            } else {
              _dialogService.showCustomDialog(
                  variant: DialogType.infoAlert,
                  title: "Submit Fail",
                  description:
                      "Code ${postResponse.statusCode}, Bad Request!!");
            }
          } else {
            _dialogService.showCustomDialog(
                variant: DialogType.infoAlert,
                title: "Tidak Terdaftar",
                description: "User belum terdaftar, silahkan coba lagi.");
          }
        } else {
          _dialogService.showCustomDialog(
              variant: DialogType.infoAlert,
              title: "Terjadi Kesalahan",
              description:
                  "Sepertinya server kami bermasalah. Silahkan hubungi bagian administrasi.");
        }
      } else {
        _dialogService.showCustomDialog(
            variant: DialogType.infoAlert,
            title: "No User",
            description:
                "User anda tidak dapat ditemukan, coba logout dahulu atau hubungi Administrasi PT. GSP");
      }
    } catch (e) {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Cek Koneksi Internet Anda",
          description:
              "Koneksi internet anda bermasalah, silahkan cek koneksi internet anda lalu coba beberapa saat lagi.");
    }
  }

// ░█████╗░██████╗░░██████╗███████╗███╗░░██╗
// ██╔══██╗██╔══██╗██╔════╝██╔════╝████╗░██║
// ███████║██████╦╝╚█████╗░█████╗░░██╔██╗██║
// ██╔══██║██╔══██╗░╚═══██╗██╔══╝░░██║╚████║
// ██║░░██║██████╦╝██████╔╝███████╗██║░╚███║
// ╚═╝░░╚═╝╚═════╝░╚═════╝░╚══════╝╚═╝░░╚══╝

  Future<AbsenStrapi?> getAbsenByDateAndMail(
      {required String email, required String date}) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://amala-api.online/api/absens?filters[yaumi_user][email][\$eq]=$email&filters[date][\$eq]=$date&populate=*'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      return AbsenStrapi.fromJson(json.decode(responseBody));
    } else {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Data tidak dapat diambil",
          description:
              "Error dengan kode: ${response.statusCode}, cek koneksi internet anda lalu coba beberapa saat lagi. Atau hubungi bagian administrasi.");
    }
    return null;
  }

// ░██╗░░░░░░░██╗███████╗░█████╗░
// ░██║░░██╗░░██║██╔════╝██╔══██╗
// ░╚██╗████╗██╔╝█████╗░░██║░░██║
// ░░████╔═████║░██╔══╝░░██║░░██║
// ░░╚██╔╝░╚██╔╝░██║░░░░░╚█████╔╝
// ░░░╚═╝░░░╚═╝░░╚═╝░░░░░░╚════╝░

  Future postAbsenMasukData(
      {required String date,
      required String timestamp,
      required String? jamMasuk,
      required String? statusKehadiran,
      required String? lokasi,
      String? udzurKeterlambatan,
      required int checkInDifference,
      required String pathToImage,
      required int yaumiUser}) async {
    var imagePath = pathToImage;
    var uri = Uri.parse('https://amala-api.online/api/absens');

// Create a new multipart request
    var request = http.MultipartRequest('POST', uri);

// Add text fields
    request.fields['data'] = json.encode({
      "date": date,
      "timeStamp": timestamp,
      "jamMasuk": jamMasuk,
      "statusKehadiran": statusKehadiran,
      "lokasi": lokasi,
      "udzurKeterlambatan": udzurKeterlambatan,
      "approval": false,
      "perbedaanWaktuMasuk": checkInDifference,
      "yaumi_user": yaumiUser
    });

// Add the image file to the request
    var file =
        await http.MultipartFile.fromPath('files.selfieMasuk', imagePath);
    request.files.add(file);

// Send the request
    http.StreamedResponse response = await request.send();

// Handle the response
    if (response.statusCode == 200) {
    } else {
      // String responseBody = await response.stream.bytesToString();
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Data tidak dapat diambil",
          description:
              "Error dengan kode: ${response.statusCode}, cek koneksi internet anda lalu coba beberapa saat lagi. Atau hubungi bagian administrasi.");
    }
  }

  Future putAbsenKeluarData(
      {required int id,
      required String pathToImage,
      required int calculateDuration,
      String? pulangLebihAwal,
      required int calculateOvertime}) async {
    var imagePath = pathToImage;
    var uri = Uri.parse('https://amala-api.online/api/absens/$id');

// Create a new multipart request
    var request = http.MultipartRequest('PUT', uri);

// Add text fields
    request.fields['data'] = json.encode({
      "jamPulang": DateFormat("HH:mm:ss").format(DateTime.now()),
      "durasiKerja": calculateDuration,
      "perbedaanWaktuPulang": calculateOvertime,
      "udzurPulangAwal": pulangLebihAwal
    });

// Add the image file to the request
    var file =
        await http.MultipartFile.fromPath('files.selfiePulang', imagePath);
    request.files.add(file);

// Send the request
    http.StreamedResponse response = await request.send();

// Handle the response
    if (response.statusCode == 200) {
    } else {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Data tidak dapat diambil",
          description:
              "Error dengan kode: ${response.statusCode}, cek koneksi internet anda lalu coba beberapa saat lagi. Atau hubungi bagian administrasi.");
    }
  }

  Future putAlasanKeterlambatan(
      {required int id, required String keterlambatan}) async {
    var headers = {'Content-Type': 'application/json'};
    var uri = Uri.parse('https://amala-api.online/api/absens/$id');

// Create a new multipart request
    var request = http.Request('PUT', uri);

    request.body = json.encode({
      "data": {"udzurKeterlambatan": keterlambatan}
    });
    request.headers.addAll(headers);

// Send the request
    http.StreamedResponse response = await request.send();

// Handle the response
    if (response.statusCode == 200) {
    } else {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Gagal Mengambil Data User",
          description:
              "Gagal mengambil data user dengan kode error: ${response.statusCode}");
    }
  }

// ██╗░░░░░██╗██╗███╗░░██╗  ░█████╗░██╗░░░██╗████████╗██╗
// ██║░░░░░██║██║████╗░██║  ██╔══██╗██║░░░██║╚══██╔══╝██║
// ██║░░░░░██║██║██╔██╗██║  ██║░░╚═╝██║░░░██║░░░██║░░░██║
// ██║██╗░░██║██║██║╚████║  ██║░░██╗██║░░░██║░░░██║░░░██║
// ██║╚█████╔╝██║██║░╚███║  ╚█████╔╝╚██████╔╝░░░██║░░░██║
// ╚═╝░╚════╝░╚═╝╚═╝░░╚══╝  ░╚════╝░░╚═════╝░░░░╚═╝░░░╚═╝

  Future postCutiKerja(
      {required String date,
      required String timestamp,
      required String? statusKehadiran,
      required String? lokasi,
      required String alasanIjin,
      required String tanggalMulaiIjin,
      required String tanggalAkhirIjin,
      required int yaumiUser}) async {
    var headers = {'Content-Type': 'application/json'};
    var uri = Uri.parse('https://amala-api.online/api/absens');

    // Create a new multipart request
    var request = http.Request('POST', uri);

    // Add text fields
    request.body = json.encode({
      "data": {
        "date": date,
        "timeStamp": timestamp,
        "statusKehadiran": statusKehadiran,
        "lokasi": lokasi,
        "approval": null,
        "yaumi_user": yaumiUser,
        "udzurIjin": alasanIjin,
        "tanggalMulaiIjin": tanggalMulaiIjin,
        "tanggalAkhirIjin": tanggalAkhirIjin
      }
    });
    request.headers.addAll(headers);

    // Send the request
    http.StreamedResponse response = await request.send();

    // Handle the response
    if (response.statusCode == 200) {
    } else {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Gagal Mengambil Data User",
          description:
              "Gagal mengambil data user dengan kode error: ${response.statusCode}");
    }
  }

  Future deleteAbsenById({required int absenId}) async {
    try {
      var request = http.Request(
          'DELETE', Uri.parse('https://amala-api.online/api/absens/$absenId'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return;
        // print(await response.stream.bytesToString());
      } else {
        // print(response.reasonPhrase);
        return;
      }
    } catch (e) {
      return;
    }
  }

// ░██████╗░█████╗░██╗░░██╗██╗████████╗
// ██╔════╝██╔══██╗██║░██╔╝██║╚══██╔══╝
// ╚█████╗░███████║█████═╝░██║░░░██║░░░
// ░╚═══██╗██╔══██║██╔═██╗░██║░░░██║░░░
// ██████╔╝██║░░██║██║░╚██╗██║░░░██║░░░
// ╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░╚═╝░░░

  Future postIjinSakit(
      {required String date,
      required String namaPenyakit,
      required String tanggalMulaiIjin,
      required String tanggalAkhirIjin,
      required int yaumiUser}) async {
    var headers = {'Content-Type': 'application/json'};
    var uri = Uri.parse('https://amala-api.online/api/absens');

    // Create a new multipart request
    var request = http.Request('POST', uri);

    // Add text fields
    request.body = json.encode({
      "data": {
        "date": date,
        "timeStamp": DateTime.now().toString(),
        "statusKehadiran": StatusKehadiran.sakit.name,
        "approval": null,
        "yaumi_user": yaumiUser,
        "namaPenyakit": namaPenyakit,
        "tanggalMulaiIjin": tanggalMulaiIjin,
        "tanggalAkhirIjin": tanggalAkhirIjin
      }
    });
    request.headers.addAll(headers);

    // Send the request
    http.StreamedResponse response = await request.send();

    // Handle the response
    if (response.statusCode == 200) {
    } else {}
  }

// ██╗░░░░░░█████╗░░█████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗
// ██║░░░░░██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║
// ██║░░░░░██║░░██║██║░░╚═╝███████║░░░██║░░░██║██║░░██║██╔██╗██║
// ██║░░░░░██║░░██║██║░░██╗██╔══██║░░░██║░░░██║██║░░██║██║╚████║
// ███████╗╚█████╔╝╚█████╔╝██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║
// ╚══════╝░╚════╝░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    const apiKey = 'AIzaSyB-GOvaf_jtS1cIPAVpD5V0FVv_m25tVu4';
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // print("location data: $data");
      if (data['results'].isNotEmpty) {
        // This will give you full address.
        String formattedAddress = data['results'][0]['formatted_address'];
        return formattedAddress;
      } else {
        return 'No address available';
      }
    } else {
      throw Exception('Failed to fetch address');
    }
  }

  Future<String> showAddress() async {
    try {
      Position position = await _determinePosition();
      String address =
          await getAddressFromLatLng(position.latitude, position.longitude);
      // print('Address: $address');
      return address;
    } catch (e) {
      // print('Error occurred: $e');
      return '';
    }
  }
}
