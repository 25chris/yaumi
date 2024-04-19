import 'dart:convert';

class AbsenStrapi {
  final List<Datum>? data;
  final Meta? meta;

  AbsenStrapi({
    this.data,
    this.meta,
  });

  AbsenStrapi copyWith({
    List<Datum>? data,
    Meta? meta,
  }) =>
      AbsenStrapi(
        data: data ?? this.data,
        meta: meta ?? this.meta,
      );

  factory AbsenStrapi.fromRawJson(String str) =>
      AbsenStrapi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AbsenStrapi.fromJson(Map<String, dynamic> json) => AbsenStrapi(
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
  final DateTime? date;
  final DateTime? timeStamp;
  final String? jamMasuk;
  final String? jamPulang;
  final String? statusKehadiran;
  final dynamic lokasi;
  final dynamic udzurKeterlambatan;
  final dynamic udzurIjin;
  final dynamic namaPenyakit;
  final dynamic udzurWfh;
  final dynamic approval;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final dynamic udzurPulangAwal;
  final DokumenIjin? selfieMasuk;
  final DokumenIjin? selfiePulang;
  final DokumenIjin? dokumenIjin;
  final DokumenIjin? dokumenSakit;
  final DokumenIjin? dokumenWfh;
  final DokumenIjin? yaumiUser;

  DatumAttributes({
    this.date,
    this.timeStamp,
    this.jamMasuk,
    this.jamPulang,
    this.statusKehadiran,
    this.lokasi,
    this.udzurKeterlambatan,
    this.udzurIjin,
    this.namaPenyakit,
    this.udzurWfh,
    this.approval,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.udzurPulangAwal,
    this.selfieMasuk,
    this.selfiePulang,
    this.dokumenIjin,
    this.dokumenSakit,
    this.dokumenWfh,
    this.yaumiUser,
  });

  DatumAttributes copyWith({
    DateTime? date,
    DateTime? timeStamp,
    String? jamMasuk,
    String? jamPulang,
    String? statusKehadiran,
    dynamic lokasi,
    dynamic udzurKeterlambatan,
    dynamic udzurIjin,
    dynamic namaPenyakit,
    dynamic udzurWfh,
    dynamic approval,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    dynamic udzurPulangAwal,
    DokumenIjin? selfieMasuk,
    DokumenIjin? selfiePulang,
    DokumenIjin? dokumenIjin,
    DokumenIjin? dokumenSakit,
    DokumenIjin? dokumenWfh,
    DokumenIjin? yaumiUser,
  }) =>
      DatumAttributes(
        date: date ?? this.date,
        timeStamp: timeStamp ?? this.timeStamp,
        jamMasuk: jamMasuk ?? this.jamMasuk,
        jamPulang: jamPulang ?? this.jamPulang,
        statusKehadiran: statusKehadiran ?? this.statusKehadiran,
        lokasi: lokasi ?? this.lokasi,
        udzurKeterlambatan: udzurKeterlambatan ?? this.udzurKeterlambatan,
        udzurIjin: udzurIjin ?? this.udzurIjin,
        namaPenyakit: namaPenyakit ?? this.namaPenyakit,
        udzurWfh: udzurWfh ?? this.udzurWfh,
        approval: approval ?? this.approval,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        publishedAt: publishedAt ?? this.publishedAt,
        udzurPulangAwal: udzurPulangAwal ?? this.udzurPulangAwal,
        selfieMasuk: selfieMasuk ?? this.selfieMasuk,
        selfiePulang: selfiePulang ?? this.selfiePulang,
        dokumenIjin: dokumenIjin ?? this.dokumenIjin,
        dokumenSakit: dokumenSakit ?? this.dokumenSakit,
        dokumenWfh: dokumenWfh ?? this.dokumenWfh,
        yaumiUser: yaumiUser ?? this.yaumiUser,
      );

  factory DatumAttributes.fromRawJson(String str) =>
      DatumAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        timeStamp: json["timeStamp"] == null
            ? null
            : DateTime.parse(json["timeStamp"]),
        jamMasuk: json["jamMasuk"],
        jamPulang: json["jamPulang"],
        statusKehadiran: json["statusKehadiran"],
        lokasi: json["lokasi"],
        udzurKeterlambatan: json["udzurKeterlambatan"],
        udzurIjin: json["udzurIjin"],
        namaPenyakit: json["namaPenyakit"],
        udzurWfh: json["udzurWfh"],
        approval: json["approval"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        udzurPulangAwal: json["udzurPulangAwal"],
        selfieMasuk: json["selfieMasuk"] == null
            ? null
            : DokumenIjin.fromJson(json["selfieMasuk"]),
        selfiePulang: json["selfiePulang"] == null
            ? null
            : DokumenIjin.fromJson(json["selfiePulang"]),
        dokumenIjin: json["dokumenIjin"] == null
            ? null
            : DokumenIjin.fromJson(json["dokumenIjin"]),
        dokumenSakit: json["dokumenSakit"] == null
            ? null
            : DokumenIjin.fromJson(json["dokumenSakit"]),
        dokumenWfh: json["dokumenWfh"] == null
            ? null
            : DokumenIjin.fromJson(json["dokumenWfh"]),
        yaumiUser: json["yaumi_user"] == null
            ? null
            : DokumenIjin.fromJson(json["yaumi_user"]),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "timeStamp": timeStamp?.toIso8601String(),
        "jamMasuk": jamMasuk,
        "jamPulang": jamPulang,
        "statusKehadiran": statusKehadiran,
        "lokasi": lokasi,
        "udzurKeterlambatan": udzurKeterlambatan,
        "udzurIjin": udzurIjin,
        "namaPenyakit": namaPenyakit,
        "udzurWfh": udzurWfh,
        "approval": approval,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "udzurPulangAwal": udzurPulangAwal,
        "selfieMasuk": selfieMasuk?.toJson(),
        "selfiePulang": selfiePulang?.toJson(),
        "dokumenIjin": dokumenIjin?.toJson(),
        "dokumenSakit": dokumenSakit?.toJson(),
        "dokumenWfh": dokumenWfh?.toJson(),
        "yaumi_user": yaumiUser?.toJson(),
      };
}

class DokumenIjin {
  final Data? data;

  DokumenIjin({
    this.data,
  });

  DokumenIjin copyWith({
    Data? data,
  }) =>
      DokumenIjin(
        data: data ?? this.data,
      );

  factory DokumenIjin.fromRawJson(String str) =>
      DokumenIjin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DokumenIjin.fromJson(Map<String, dynamic> json) => DokumenIjin(
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
  final String? name;
  final dynamic alternativeText;
  final dynamic caption;
  final int? width;
  final int? height;
  final Formats? formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final double? size;
  final String? url;
  final dynamic previewUrl;
  final String? provider;
  final dynamic providerMetadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? nama;
  final String? email;
  final String? uid;
  final String? group;
  final DateTime? publishedAt;
  final String? gid;

  DataAttributes({
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
    this.nama,
    this.email,
    this.uid,
    this.group,
    this.publishedAt,
    this.gid,
  });

  DataAttributes copyWith({
    String? name,
    dynamic alternativeText,
    dynamic caption,
    int? width,
    int? height,
    Formats? formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    dynamic previewUrl,
    String? provider,
    dynamic providerMetadata,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? nama,
    String? email,
    String? uid,
    String? group,
    DateTime? publishedAt,
    String? gid,
  }) =>
      DataAttributes(
        name: name ?? this.name,
        alternativeText: alternativeText ?? this.alternativeText,
        caption: caption ?? this.caption,
        width: width ?? this.width,
        height: height ?? this.height,
        formats: formats ?? this.formats,
        hash: hash ?? this.hash,
        ext: ext ?? this.ext,
        mime: mime ?? this.mime,
        size: size ?? this.size,
        url: url ?? this.url,
        previewUrl: previewUrl ?? this.previewUrl,
        provider: provider ?? this.provider,
        providerMetadata: providerMetadata ?? this.providerMetadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        nama: nama ?? this.nama,
        email: email ?? this.email,
        uid: uid ?? this.uid,
        group: group ?? this.group,
        publishedAt: publishedAt ?? this.publishedAt,
        gid: gid ?? this.gid,
      );

  factory DataAttributes.fromRawJson(String str) =>
      DataAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats:
            json["formats"] == null ? null : Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        nama: json["nama"],
        email: json["email"],
        uid: json["uid"],
        group: json["group"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        gid: json["gid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats?.toJson(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "nama": nama,
        "email": email,
        "uid": uid,
        "group": group,
        "publishedAt": publishedAt?.toIso8601String(),
        "gid": gid,
      };
}

class Formats {
  final Large? thumbnail;
  final Large? large;
  final Large? medium;
  final Large? small;

  Formats({
    this.thumbnail,
    this.large,
    this.medium,
    this.small,
  });

  Formats copyWith({
    Large? thumbnail,
    Large? large,
    Large? medium,
    Large? small,
  }) =>
      Formats(
        thumbnail: thumbnail ?? this.thumbnail,
        large: large ?? this.large,
        medium: medium ?? this.medium,
        small: small ?? this.small,
      );

  factory Formats.fromRawJson(String str) => Formats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: json["thumbnail"] == null
            ? null
            : Large.fromJson(json["thumbnail"]),
        large: json["large"] == null ? null : Large.fromJson(json["large"]),
        medium: json["medium"] == null ? null : Large.fromJson(json["medium"]),
        small: json["small"] == null ? null : Large.fromJson(json["small"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail?.toJson(),
        "large": large?.toJson(),
        "medium": medium?.toJson(),
        "small": small?.toJson(),
      };
}

class Large {
  final String? name;
  final String? hash;
  final String? ext;
  final String? mime;
  final dynamic path;
  final int? width;
  final int? height;
  final double? size;
  final String? url;

  Large({
    this.name,
    this.hash,
    this.ext,
    this.mime,
    this.path,
    this.width,
    this.height,
    this.size,
    this.url,
  });

  Large copyWith({
    String? name,
    String? hash,
    String? ext,
    String? mime,
    dynamic path,
    int? width,
    int? height,
    double? size,
    String? url,
  }) =>
      Large(
        name: name ?? this.name,
        hash: hash ?? this.hash,
        ext: ext ?? this.ext,
        mime: mime ?? this.mime,
        path: path ?? this.path,
        width: width ?? this.width,
        height: height ?? this.height,
        size: size ?? this.size,
        url: url ?? this.url,
      );

  factory Large.fromRawJson(String str) => Large.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        path: json["path"],
        width: json["width"],
        height: json["height"],
        size: json["size"]?.toDouble(),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "path": path,
        "width": width,
        "height": height,
        "size": size,
        "url": url,
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
