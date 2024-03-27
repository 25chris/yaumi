import 'dart:convert';

class YaumiStrapi {
  final List<Datum>? data;
  final Meta? meta;

  YaumiStrapi({
    this.data,
    this.meta,
  });

  YaumiStrapi copyWith({
    List<Datum>? data,
    Meta? meta,
  }) =>
      YaumiStrapi(
        data: data ?? this.data,
        meta: meta ?? this.meta,
      );

  factory YaumiStrapi.fromRawJson(String str) =>
      YaumiStrapi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory YaumiStrapi.fromJson(Map<String, dynamic> json) => YaumiStrapi(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class Datum {
  final int? id;
  final DatumAttributes? attributes;

  Datum({
    this.id,
    this.attributes,
  });

  Datum copyWith({
    int? id,
    DatumAttributes? attributes,
  }) =>
      Datum(
        id: id ?? this.id,
        attributes: attributes ?? this.attributes,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : DatumAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class DatumAttributes {
  final bool? shubuh;
  final bool? dhuhur;
  final bool? ashar;
  final bool? maghrib;
  final bool? isya;
  final int? tahajud;
  final int? dhuha;
  final bool? qshubuh;
  final bool? qdhuhur;
  final bool? bdhuhur;
  final bool? bmaghrib;
  final bool? bisya;
  final int? tilawah;
  final String? shaum;
  final bool? sedekah;
  final String? taklim;
  final bool? istighfar;
  final bool? shalawat;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final DateTime? date;
  final double? poin;
  final YaumiUser? yaumiUser;

  DatumAttributes({
    this.shubuh,
    this.dhuhur,
    this.ashar,
    this.maghrib,
    this.isya,
    this.tahajud,
    this.dhuha,
    this.qshubuh,
    this.qdhuhur,
    this.bdhuhur,
    this.bmaghrib,
    this.bisya,
    this.tilawah,
    this.shaum,
    this.sedekah,
    this.taklim,
    this.istighfar,
    this.shalawat,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.date,
    this.poin,
    this.yaumiUser,
  });

  DatumAttributes copyWith({
    bool? shubuh,
    bool? dhuhur,
    bool? ashar,
    bool? maghrib,
    bool? isya,
    int? tahajud,
    int? dhuha,
    bool? qshubuh,
    bool? qdhuhur,
    bool? bdhuhur,
    bool? bmaghrib,
    bool? bisya,
    int? tilawah,
    String? shaum,
    bool? sedekah,
    String? taklim,
    bool? istighfar,
    bool? shalawat,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    DateTime? date,
    double? poin,
    YaumiUser? yaumiUser,
  }) =>
      DatumAttributes(
        shubuh: shubuh ?? this.shubuh,
        dhuhur: dhuhur ?? this.dhuhur,
        ashar: ashar ?? this.ashar,
        maghrib: maghrib ?? this.maghrib,
        isya: isya ?? this.isya,
        tahajud: tahajud ?? this.tahajud,
        dhuha: dhuha ?? this.dhuha,
        qshubuh: qshubuh ?? this.qshubuh,
        qdhuhur: qdhuhur ?? this.qdhuhur,
        bdhuhur: bdhuhur ?? this.bdhuhur,
        bmaghrib: bmaghrib ?? this.bmaghrib,
        bisya: bisya ?? this.bisya,
        tilawah: tilawah ?? this.tilawah,
        shaum: shaum ?? this.shaum,
        sedekah: sedekah ?? this.sedekah,
        taklim: taklim ?? this.taklim,
        istighfar: istighfar ?? this.istighfar,
        shalawat: shalawat ?? this.shalawat,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        publishedAt: publishedAt ?? this.publishedAt,
        date: date ?? this.date,
        poin: poin ?? this.poin,
        yaumiUser: yaumiUser ?? this.yaumiUser,
      );

  factory DatumAttributes.fromRawJson(String str) =>
      DatumAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        shubuh: json["shubuh"],
        dhuhur: json["dhuhur"],
        ashar: json["ashar"],
        maghrib: json["maghrib"],
        isya: json["isya"],
        tahajud: json["tahajud"],
        dhuha: json["dhuha"],
        qshubuh: json["qshubuh"],
        qdhuhur: json["qdhuhur"],
        bdhuhur: json["bdhuhur"],
        bmaghrib: json["bmaghrib"],
        bisya: json["bisya"],
        tilawah: json["tilawah"],
        shaum: json["shaum"],
        sedekah: json["sedekah"],
        taklim: json["taklim"],
        istighfar: json["istighfar"],
        shalawat: json["shalawat"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        poin: json["poin"]?.toDouble(),
        yaumiUser: json["yaumi_user"] == null
            ? null
            : YaumiUser.fromJson(json["yaumi_user"]),
      );

  Map<String, dynamic> toJson() => {
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
        "shaum": shaum,
        "sedekah": sedekah,
        "taklim": taklim,
        "istighfar": istighfar,
        "shalawat": shalawat,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "poin": poin,
        "yaumi_user": yaumiUser?.toJson(),
      };
}

class YaumiUser {
  final Data? data;

  YaumiUser({
    this.data,
  });

  YaumiUser copyWith({
    Data? data,
  }) =>
      YaumiUser(
        data: data ?? this.data,
      );

  factory YaumiUser.fromRawJson(String str) =>
      YaumiUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory YaumiUser.fromJson(Map<String, dynamic> json) => YaumiUser(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final int? id;
  final DataAttributes? attributes;

  Data({
    this.id,
    this.attributes,
  });

  Data copyWith({
    int? id,
    DataAttributes? attributes,
  }) =>
      Data(
        id: id ?? this.id,
        attributes: attributes ?? this.attributes,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : DataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class DataAttributes {
  final String? nama;
  final String? email;
  final String? uid;
  final String? group;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? gid;

  DataAttributes({
    this.nama,
    this.email,
    this.uid,
    this.group,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.gid,
  });

  DataAttributes copyWith({
    String? nama,
    String? email,
    String? uid,
    String? group,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    String? gid,
  }) =>
      DataAttributes(
        nama: nama ?? this.nama,
        email: email ?? this.email,
        uid: uid ?? this.uid,
        group: group ?? this.group,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        publishedAt: publishedAt ?? this.publishedAt,
        gid: gid ?? this.gid,
      );

  factory DataAttributes.fromRawJson(String str) =>
      DataAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        nama: json["nama"],
        email: json["email"],
        uid: json["uid"],
        group: json["group"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        gid: json["gid"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "email": email,
        "uid": uid,
        "group": group,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "gid": gid,
      };
}

class Meta {
  final Pagination? pagination;

  Meta({
    this.pagination,
  });

  Meta copyWith({
    Pagination? pagination,
  }) =>
      Meta(
        pagination: pagination ?? this.pagination,
      );

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
      };
}

class Pagination {
  final int? page;
  final int? pageSize;
  final int? pageCount;
  final int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  Pagination copyWith({
    int? page,
    int? pageSize,
    int? pageCount,
    int? total,
  }) =>
      Pagination(
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        pageCount: pageCount ?? this.pageCount,
        total: total ?? this.total,
      );

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
