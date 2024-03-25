// To parse this JSON data, do
//
//     final yaumiUser = yaumiUserFromJson(jsonString);

import 'dart:convert';

YaumiUser yaumiUserFromJson(String str) => YaumiUser.fromJson(json.decode(str));

String yaumiUserToJson(YaumiUser data) => json.encode(data.toJson());

class YaumiUser {
  final List<Datum>? data;
  final Meta? meta;

  YaumiUser({
    this.data,
    this.meta,
  });

  factory YaumiUser.fromJson(Map<String, dynamic> json) => YaumiUser(
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
  final String? nama;
  final String? email;
  final String? uid;
  final String? group;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? gid;
  final ProfilePicture? profilePicture;

  DatumAttributes({
    this.nama,
    this.email,
    this.uid,
    this.group,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.gid,
    this.profilePicture,
  });

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
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
        profilePicture: json["profilePicture"] == null
            ? null
            : ProfilePicture.fromJson(json["profilePicture"]),
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
        "profilePicture": profilePicture?.toJson(),
      };
}

class ProfilePicture {
  final Data? data;

  ProfilePicture({
    this.data,
  });

  factory ProfilePicture.fromJson(Map<String, dynamic> json) => ProfilePicture(
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
  });

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
