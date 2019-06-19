class AstrobinItem {
  bool animated;
  String dec;
  String description;
  int h;
  int id;
  List<String> imagingCameras;
  List<String> imagingTelescopes;
  bool isFinal;
  bool isSolved;
  int license;
  String link;
  String linkToFits;
  String orientation;
  String pixscale;
  String published;
  String ra;
  String radius;
  String resourceUri;
  List<String> subjects;
  String title;
  String updated;
  String uploaded;
  String urlDuckduckgo;
  String urlDuckduckgoSmall;
  String urlGallery;
  String urlHd;
  String urlReal;
  String urlRegular;
  String urlThumb;
  String user;
  int w;

  AstrobinItem(
      {this.animated,
      this.dec,
      this.description,
      this.h,
      this.id,
      this.imagingCameras,
      this.imagingTelescopes,
      this.isFinal,
      this.isSolved,
      this.license,
      this.link,
      this.linkToFits,
      this.orientation,
      this.pixscale,
      this.published,
      this.ra,
      this.radius,
      this.resourceUri,
      this.subjects,
      this.title,
      this.updated,
      this.uploaded,
      this.urlDuckduckgo,
      this.urlDuckduckgoSmall,
      this.urlGallery,
      this.urlHd,
      this.urlReal,
      this.urlRegular,
      this.urlThumb,
      this.user,
      this.w});

  AstrobinItem.fromJson(Map<String, dynamic> json) {
    animated = json['animated'];
    dec = json['dec'];
    description = json['description'];
    h = json['h'];
    id = json['id'];
    imagingCameras = json['imaging_cameras'].cast<String>();
    imagingTelescopes = json['imaging_telescopes'].cast<String>();
    isFinal = json['is_final'];
    isSolved = json['is_solved'];
    license = json['license'];
    link = json['link'];
    linkToFits = json['link_to_fits'];
    orientation = json['orientation'];
    pixscale = json['pixscale'];
    published = json['published'];
    ra = json['ra'];
    radius = json['radius'];
    resourceUri = json['resource_uri'];
    subjects = json['subjects'].cast<String>();
    title = json['title'];
    updated = json['updated'];
    uploaded = json['uploaded'];
    urlDuckduckgo = json['url_duckduckgo'];
    urlDuckduckgoSmall = json['url_duckduckgo_small'];
    urlGallery = json['url_gallery'];
    urlHd = json['url_hd'];
    urlReal = json['url_real'];
    urlRegular = json['url_regular'];
    urlThumb = json['url_thumb'];
    user = json['user'];
    w = json['w'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['animated'] = this.animated;
    data['dec'] = this.dec;
    data['description'] = this.description;
    data['h'] = this.h;
    data['id'] = this.id;
    data['imaging_cameras'] = this.imagingCameras;
    data['imaging_telescopes'] = this.imagingTelescopes;
    data['is_final'] = this.isFinal;
    data['is_solved'] = this.isSolved;
    data['license'] = this.license;
    data['link'] = this.link;
    data['link_to_fits'] = this.linkToFits;
    data['orientation'] = this.orientation;
    data['pixscale'] = this.pixscale;
    data['published'] = this.published;
    data['ra'] = this.ra;
    data['radius'] = this.radius;
    data['resource_uri'] = this.resourceUri;
    data['subjects'] = this.subjects;
    data['title'] = this.title;
    data['updated'] = this.updated;
    data['uploaded'] = this.uploaded;
    data['url_duckduckgo'] = this.urlDuckduckgo;
    data['url_duckduckgo_small'] = this.urlDuckduckgoSmall;
    data['url_gallery'] = this.urlGallery;
    data['url_hd'] = this.urlHd;
    data['url_real'] = this.urlReal;
    data['url_regular'] = this.urlRegular;
    data['url_thumb'] = this.urlThumb;
    data['user'] = this.user;
    data['w'] = this.w;
    return data;
  }
}
