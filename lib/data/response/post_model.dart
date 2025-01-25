class PopularModel {
  int? currentPage;
  List<PopularData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  PopularModel(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  PopularModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <PopularData>[];
      json['data'].forEach((v) {
        data!.add(PopularData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class PopularData {
  int? id;
  int? userId;
  String? thumbnail;
  String? title;
  String? audio;
  String? audioImageUrl;
  String? audioUrl;
  int? audioLength;
  int? locationId;
  String? video;
  int? views;
  int? share;
  String? heart;
  String? diamond;
  String? description;
  String? createdAt;
  String? name;
  String? photo;
  int? followCount;
  int? commentStatus;
  String? divisionName;
  int? communityId;
  int? isPrivacy;
  String? communityName;
  String? communityPhoto;
  int? commentCount;
  int? likeCount;
  int? likeCheck;
  int? followingcheckCount;
  List<Images>? images;
  // List<Comments>? comments;
  List<Taglist>? taglist;
  bool isLink = false;

  PopularData(
      {this.id,
        this.userId,
        this.thumbnail,
        this.title,
        this.audio,
        this.audioImageUrl,
        this.audioUrl,
        this.audioLength,
        this.locationId,
        this.video,
        this.views,
        this.share,
        this.heart,
        this.diamond,
        this.description,
        this.createdAt,
        this.name,
        this.photo,
        this.followCount,
        this.commentStatus,
        this.divisionName,
        this.communityId,
        this.isPrivacy,
        this.communityName,
        this.communityPhoto,
        this.commentCount,
        this.likeCount,
        this.likeCheck,
        this.followingcheckCount,
        this.images,
        this.taglist,
        this.isLink = false,
        //this.comments
      });

  PopularData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    audio = json['audio'];
    audioImageUrl = json['audio_image_url'];
    audioUrl = json['audio_url'];
    audioLength = json['audio_length'];
    locationId = json['location_id'];
    video = json['video'];
    views = json['views'];
    share = json['share'];
    heart = json['heart'];
    diamond = json['diamond'];
    description = json['description'];
    createdAt = json['created_at'];
    name = json['name'];
    photo = json['photo'];
    followCount = json['followingcheck_count'];
    commentStatus = json['post_commentstatus'];
    divisionName = json['division_name'];
    communityId = json['community_id'];
    isPrivacy = json['privacy_policy'];
    communityName = json['communities_name'];
    communityPhoto = json['community_photo'];
    commentCount = json['comments_count_count'];
    likeCount = json['like_count_count'];
    followingcheckCount = json['followingcheck_count'];
    likeCheck = json['likecheck_count'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }

    if (json['taglist'] != null) {
      taglist = <Taglist>[];
      json['taglist'].forEach((v) {
        taglist!.add(Taglist.fromJson(v));
      });
    }
    // if (json['comments'] != null) {
    //   comments = <Comments>[];
    //   json['comments'].forEach((v) {
    //     comments!.add(Comments.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['thumbnail'] = thumbnail;
    data['title'] = title;
    data['audio'] = audio;
    data['audio_image_url'] = audioImageUrl;
    data['audio_url'] = audioUrl;
    data['audio_length'] = audioLength;
    data['location_id'] = locationId;
    data['video'] = video;
    data['views'] = views;
    data['share'] = share;
    data['heart'] = heart;
    data['diamond'] = diamond;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['name'] = name;
    data['photo'] = photo;
    data['followingcheck_count'] = followCount;
    data['post_commentstatus'] = commentStatus;
    data['division_name'] = divisionName;
    data['communities_name'] = communityName;
    data['community_id'] = communityId;
    data['privacy_policy'] = isPrivacy;
    data['community_photo'] = communityPhoto;
    data['comments_count_count'] = commentCount;
    data['like_count_count'] = likeCount;
    data['followingcheck_count'] = followingcheckCount;
    data['likecheck_count'] = likeCheck;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (taglist != null) {
      data['taglist'] = taglist!.map((v) => v.toJson()).toList();
    }
    // if (comments != null) {
    //   data['comments'] = comments!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Images {
  String? fileUrl;
  String? fileName;

  Images({this.fileUrl, this.fileName});

  Images.fromJson(Map<String, dynamic> json) {
    fileUrl = json['file_url'];
    fileName = json['file_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file_url'] = fileUrl;
    data['file_name'] = fileName;
    return data;
  }
}

class Taglist {
  String? postId;
  String? userId;
  UserTag? user;

  Taglist({this.postId, this.userId, this.user});

  Taglist.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    userId = json['user_id'];
    user = json['user'] != null ? UserTag.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_id'] = postId;
    data['user_id'] = userId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class UserTag {
  int? id;
  String? name;
  String? photo;

  UserTag({this.id, this.name, this.photo});

  UserTag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}


class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
