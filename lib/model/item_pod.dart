class ItemPod {
  Meta meta;
  List<Objects> objects;

  ItemPod({this.meta, this.objects});

  ItemPod.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['objects'] != null) {
      objects = new List<Objects>();
      json['objects'].forEach((v) {
        objects.add(new Objects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.objects != null) {
      data['objects'] = this.objects.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  int limit;
  String next;
  int offset;
  Null previous;
  int totalCount;

  Meta({this.limit, this.next, this.offset, this.previous, this.totalCount});

  Meta.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['next'] = this.next;
    data['offset'] = this.offset;
    data['previous'] = this.previous;
    data['total_count'] = this.totalCount;
    return data;
  }
}

class Objects {
  String date;
  String image;
  String resourceUri;
  Null runnerup1;
  Null runnerup2;

  Objects(
      {this.date,
      this.image,
      this.resourceUri,
      this.runnerup1,
      this.runnerup2});

  Objects.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    image = json['image'];
    resourceUri = json['resource_uri'];
    runnerup1 = json['runnerup_1'];
    runnerup2 = json['runnerup_2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['image'] = this.image;
    data['resource_uri'] = this.resourceUri;
    data['runnerup_1'] = this.runnerup1;
    data['runnerup_2'] = this.runnerup2;
    return data;
  }
}
