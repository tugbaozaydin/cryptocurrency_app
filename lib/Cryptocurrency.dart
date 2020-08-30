import 'dart:convert';

Cryptocurrency cryptocurrencyFromJson(String str) => Cryptocurrency.fromJson(json.decode(str));

String cryptocurrencyToJson(Cryptocurrency data) => json.encode(data.toJson());

class Cryptocurrency {
  Cryptocurrency({
    this.data,
    this.status,
  });

  List<Datum> data;
  Status status;

  factory Cryptocurrency.fromJson(Map<String, dynamic> json) => Cryptocurrency(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    status: Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status.toJson(),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.isActive,
    this.platform,
  });

  int id;
  String name;
  String symbol;
  String slug;
  int isActive;
  Platform platform;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    slug: json["slug"],
    isActive: json["is_active"],
    platform: json["platform"] == null ? null : Platform.fromJson(json["platform"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "slug": slug,
    "is_active": isActive,
    "platform": platform == null ? null : platform.toJson(),
  };
}

class Platform {
  Platform({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.tokenAddress,
  });

  int id;
  String name;
  String symbol;
  String slug;
  String tokenAddress;

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    slug: json["slug"],
    tokenAddress: json["token_address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "slug": slug,
    "token_address": tokenAddress,
  };
}

class Status {
  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
  });

  DateTime timestamp;
  int errorCode;
  String errorMessage;
  int elapsed;
  int creditCount;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    timestamp: DateTime.parse(json["timestamp"]),
    errorCode: json["error_code"],
    errorMessage: json["error_message"],
    elapsed: json["elapsed"],
    creditCount: json["credit_count"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "error_code": errorCode,
    "error_message": errorMessage,
    "elapsed": elapsed,
    "credit_count": creditCount,
  };
}
