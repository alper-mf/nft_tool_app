import 'package:background_json_parser/background_json_parser.dart';

class CoinRankModel extends IBaseModel<CoinRankModel> {
  CoinRankModel({
    this.currentPage,
    this.totalPage,
    this.limit,
    this.totalItem,
    this.token,
  });

  int? currentPage;
  int? totalPage;
  int? limit;
  int? totalItem;
  List<Token>? token;

  CoinRankModel copyWith({
    int? currentPage,
    int? totalPage,
    int? limit,
    int? totalItem,
    List<Token>? token,
  }) =>
      CoinRankModel(
        currentPage: currentPage ?? this.currentPage,
        totalPage: totalPage ?? this.totalPage,
        limit: limit ?? this.limit,
        totalItem: totalItem ?? this.totalItem,
        token: token ?? this.token,
      );

  @override
  CoinRankModel fromJson(Map<String, dynamic> json) => CoinRankModel(
        currentPage: json["current_page"],
        totalPage: json["total_page"],
        limit: json["limit"],
        totalItem: json["total_item"],
        token: List<Token>.from(json["token"].map((x) => Token.fromMap(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "total_page": totalPage,
        "limit": limit,
        "total_item": totalItem,
        "token": List<dynamic>.from(token!.map((x) => x.toMap())),
      };
}

class Token {
  Token({
    this.symbol,
    this.imageUrl,
    this.decimals,
    this.ethPrice,
    this.usdPrice,
    this.rarestNfts,
    this.address,
  });

  String? symbol;

  String? imageUrl;
  int? decimals;
  String? ethPrice;
  String? usdPrice;
  List<RarestNft>? rarestNfts;
  String? address;

  factory Token.fromMap(Map<String, dynamic> json) => Token(
        symbol: json["symbol"],
        imageUrl: json["image_url"],
        decimals: json["decimals"],
        ethPrice: json["eth_price"],
        usdPrice: json["usd_price"],
        rarestNfts: List<RarestNft>.from(json["rarest_nfts"].map((x) => RarestNft.fromMap(x))),
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "symbol": symbol,
        "image_url": imageUrl,
        "decimals": decimals,
        "eth_price": ethPrice,
        "usd_price": usdPrice,
        "rarest_nfts": List<dynamic>.from(rarestNfts!.map((x) => x.toMap())),
        "address": address,
      };
}

class RarestNft {
  RarestNft({
    this.nftName,
    this.imageUrl,
  });

  String? nftName;
  String? imageUrl;

  factory RarestNft.fromMap(Map<String, dynamic> json) => RarestNft(
        nftName: json["nft_name"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toMap() => {
        "nft_name": nftName,
        "image_url": imageUrl,
      };
}
