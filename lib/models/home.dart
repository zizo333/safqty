class Home {

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
