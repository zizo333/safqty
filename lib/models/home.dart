class Home {
  final bool value;
  final HomeData data;
  final int code;

  Home({this.value, this.data, this.code});

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      value: json['value'],
      data: HomeData.fromJson(json['data']),
      code: json['code'],
    );
  }
}

class HomeData {
  final List<dynamic> limit;
  final List<OpenAuctionData> open;
  final List<dynamic> request;

  HomeData({this.limit, this.open, this.request});

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      limit: json['limit'],
      open: (json['open'] as List)
          .map((e) => OpenAuctionData.fromJson(e))
          .toList(),
      request: json['request'],
    );
  }
}

class LimitAuctionData {}

class RequestAuctionData {}

class OpenAuctionData {
  final int id;
  final String title;
  final String startDate;
  final String endDate;
  final int endDays;
  final String description;
  final String startPrice;
  final String lastPrice;
  final int count;
  final int userId;
  final String userName;
  final int cityId;
  final String cityName;
  final String type;
  final int winnerId;
  final String winnerName;
  final int categoryId;
  final String categoryName;
  final String address;
  final String status;
  final String auctionStatus;
  final int idFirebase;
  final List<AuctionImage> images;
  final String isFollow;

  OpenAuctionData({
    this.id,
    this.title,
    this.startDate,
    this.endDate,
    this.endDays,
    this.description,
    this.startPrice,
    this.lastPrice,
    this.count,
    this.userId,
    this.userName,
    this.cityId,
    this.cityName,
    this.type,
    this.winnerId,
    this.winnerName,
    this.categoryId,
    this.categoryName,
    this.address,
    this.status,
    this.auctionStatus,
    this.idFirebase,
    this.images,
    this.isFollow,
  });

  factory OpenAuctionData.fromJson(Map<String, dynamic> json) {
    return OpenAuctionData(
      id: json['id'],
      title: json['title'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      endDays: json['endDays'],
      description: json['description'],
      startPrice: json['start_price'],
      lastPrice: json['last_price'],
      count: json['count'],
      userId: json['user_id'],
      userName: json['user_name'],
      cityId: json['city_id'],
      cityName: json['city_name'],
      type: json['type'],
      winnerId: json['winner_id'],
      winnerName: json['winner_name'],
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      address: json['address'],
      status: json['status'],
      auctionStatus: json['auction_status'],
      idFirebase: json['id_firebase'],
      images: (json['images'] as List)
          .map((e) => AuctionImage.fromJson(e))
          .toList(),
      isFollow: json['is_follow'],
    );
  }
}

class AuctionImage {
  final int id;
  final String image;
  final int auctionId;

  AuctionImage({
    this.id,
    this.image,
    this.auctionId,
  });

  factory AuctionImage.fromJson(Map<String, dynamic> json) {
    return AuctionImage(
      id: json['id'],
      image: json['image'],
      auctionId: json['auction_id'],
    );
  }
}

class AuctionSlider {
  final bool value;
  final List<SliderImage> data;
  final int code;

  AuctionSlider({
    this.value,
    this.data,
    this.code,
  });

  factory AuctionSlider.fromJson(Map<String, dynamic> json) {
    return AuctionSlider(
      value: json['value'],
      data: (json['data'] as List).map((e) => SliderImage.fromJson(e)).toList(),
      code: json['code'],
    );
  }

  Map<int, String> getImages() {
    int index = 0;
    return Map.fromIterable(
      data,
      key: (k) => index++,
      value: (v) => v.imagePath,
    );
  }
}

class SliderImage {
  final int id;
  final int auctionId;
  final String auctionTitle;
  final String imagePath;
  final String url;
  final String type;

  SliderImage({
    this.id,
    this.auctionId,
    this.auctionTitle,
    this.imagePath,
    this.url,
    this.type,
  });

  factory SliderImage.fromJson(Map<String, dynamic> json) {
    return SliderImage(
      id: json['id'],
      auctionId: json['auction_id'],
      auctionTitle: json['auction_title'],
      imagePath: json['image'],
      url: json['url'],
      type: json['type'],
    );
  }
}
