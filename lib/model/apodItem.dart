class ApodItem {
  String _date;
  String _explanation;
  String _mediaType;
  String _serviceVersion;
  String _title;
  String _url;

  ApodItem(
      {String date,
      String explanation,
      String mediaType,
      String serviceVersion,
      String title,
      String url}) {
    this._date = date;
    this._explanation = explanation;
    this._mediaType = mediaType;
    this._serviceVersion = serviceVersion;
    this._title = title;
    this._url = url;
  }

  String get date => _date;
  set date(String date) => _date = date;
  String get explanation => _explanation;
  set explanation(String explanation) => _explanation = explanation;
  String get mediaType => _mediaType;
  set mediaType(String mediaType) => _mediaType = mediaType;
  String get serviceVersion => _serviceVersion;
  set serviceVersion(String serviceVersion) => _serviceVersion = serviceVersion;
  String get title => _title;
  set title(String title) => _title = title;
  String get url => _url;
  set url(String url) => _url = url;

  ApodItem.fromJson(Map<String, dynamic> json) {
    _date = json['date'];
    _explanation = json['explanation'];
    _mediaType = json['media_type'];
    _serviceVersion = json['service_version'];
    _title = json['title'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this._date;
    data['explanation'] = this._explanation;
    data['media_type'] = this._mediaType;
    data['service_version'] = this._serviceVersion;
    data['title'] = this._title;
    data['url'] = this._url;
    return data;
  }
}
