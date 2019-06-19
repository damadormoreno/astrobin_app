class IssPositioned {
  int _timestamp;
  String _message;
  IssPosition _issPosition;

  IssPositioned({int timestamp, String message, IssPosition issPosition}) {
    this._timestamp = timestamp;
    this._message = message;
    this._issPosition = issPosition;
  }

  int get timestamp => _timestamp;
  set timestamp(int timestamp) => _timestamp = timestamp;
  String get message => _message;
  set message(String message) => _message = message;
  IssPosition get issPosition => _issPosition;
  set issPosition(IssPosition issPosition) => _issPosition = issPosition;

  IssPositioned.fromJson(Map<String, dynamic> json) {
    _timestamp = json['timestamp'];
    _message = json['message'];
    _issPosition = json['iss_position'] != null
        ? new IssPosition.fromJson(json['iss_position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this._timestamp;
    data['message'] = this._message;
    if (this._issPosition != null) {
      data['iss_position'] = this._issPosition.toJson();
    }
    return data;
  }
}

class IssPosition {
  String _latitude;
  String _longitude;

  IssPosition({String latitude, String longitude}) {
    this._latitude = latitude;
    this._longitude = longitude;
  }

  String get latitude => _latitude;
  set latitude(String latitude) => _latitude = latitude;
  String get longitude => _longitude;
  set longitude(String longitude) => _longitude = longitude;

  IssPosition.fromJson(Map<String, dynamic> json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    return data;
  }
}
