class CoinRankModel {
  String? symbol;
  String? address;
  String? imageUrl;
  String? name;
  int? decimals;
  String? ethPrice;
  String? usdPrice;

  CoinRankModel({this.symbol, this.address, this.imageUrl, this.name, this.decimals, this.ethPrice, this.usdPrice});

  CoinRankModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    address = json['address'];
    imageUrl = json['image_url'];
    name = json['name'];
    decimals = json['decimals'];
    ethPrice = json['eth_price'];
    usdPrice = json['usd_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['address'] = address;
    data['image_url'] = imageUrl;
    data['name'] = name;
    data['decimals'] = decimals;
    data['eth_price'] = ethPrice;
    data['usd_price'] = usdPrice;
    return data;
  }
}
