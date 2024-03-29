class ApiResponse {
  int? code;
  String? status;
  Results? results;

  ApiResponse({required this.code, required this.status, required this.results});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    results = json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  List<Datetime>? datetime;
  Location? location;
  Settings? settings;

  Results({required this.datetime, required this.location, required this.settings});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['datetime'] != null) {
      datetime = <Datetime>[];
      json['datetime'].forEach((v) {
        datetime!.add(Datetime.fromJson(v));
      });
    }
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.datetime != null) {
      data['datetime'] = this.datetime!.map((v) => v.toJson()).toList();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    return data;
  }
}

class Datetime {
  Times? times;
  Date? date;

  Datetime({required this.times, required this.date});

  Datetime.fromJson(Map<String, dynamic> json) {
    times = json['times'] != null ? Times.fromJson(json['times']) : null;
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.times != null) {
      data['times'] = this.times!.toJson();
    }
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    return data;
  }
}

class Times {
  String? imsak;
  String? sunrise;
  String? fajr;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? midnight;

  Times(
      {
        required this.imsak,
        required this.sunrise,
        required this.fajr,
        required this.dhuhr,
        required this.asr,
        required this.sunset,
        required this.maghrib,
        required this.isha,
        required this.midnight});

  Times.fromJson(Map<String, dynamic> json) {
    imsak = json['Imsak'];
    sunrise = json['Sunrise'];
    fajr = json['Fajr'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    sunset = json['Sunset'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
    midnight = json['Midnight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Imsak'] = this.imsak;
    data['Sunrise'] = this.sunrise;
    data['Fajr'] = this.fajr;
    data['Dhuhr'] = this.dhuhr;
    data['Asr'] = this.asr;
    data['Sunset'] = this.sunset;
    data['Maghrib'] = this.maghrib;
    data['Isha'] = this.isha;
    data['Midnight'] = this.midnight;
    return data;
  }
}

class Date {
  int? timestamp;
  String? gregorian;
  String? hijri;

  Date({this.timestamp, this.gregorian, this.hijri});

  Date.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    gregorian = json['gregorian'];
    hijri = json['hijri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['gregorian'] = this.gregorian;
    data['hijri'] = this.hijri;
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;
  double? elevation;
  String? city;
  String? country;
  String? countryCode;
  String? timezone;
  double? localOffset;

  Location(
      {this.latitude,
        this.longitude,
        this.elevation,
        this.city,
        this.country,
        this.countryCode,
        this.timezone,
        this.localOffset});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    elevation = json['elevation'];
    city = json['city'];
    country = json['country'];
    countryCode = json['country_code'];
    timezone = json['timezone'];
    localOffset = json['local_offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['elevation'] = this.elevation;
    data['city'] = this.city;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['timezone'] = this.timezone;
    data['local_offset'] = this.localOffset;
    return data;
  }
}

class Settings {
  String? timeformat;
  String? school;
  String? juristic;
  String? highlat;
  double? fajrAngle;
  double? ishaAngle;

  Settings(
      {this.timeformat,
        this.school,
        this.juristic,
        this.highlat,
        this.fajrAngle,
        this.ishaAngle});

  Settings.fromJson(Map<String, dynamic> json) {
    timeformat = json['timeformat'];
    school = json['school'];
    juristic = json['juristic'];
    highlat = json['highlat'];
    fajrAngle = json['fajr_angle'];
    ishaAngle = json['isha_angle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeformat'] = this.timeformat;
    data['school'] = this.school;
    data['juristic'] = this.juristic;
    data['highlat'] = this.highlat;
    data['fajr_angle'] = this.fajrAngle;
    data['isha_angle'] = this.ishaAngle;
    return data;
  }
}