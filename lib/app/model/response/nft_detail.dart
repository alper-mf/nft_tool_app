import 'package:background_json_parser/background_json_parser.dart';
import 'package:nft_tool_app/app/model/response/market.dart';
import 'package:nft_tool_app/app/model/response/rarirty.dart';

class NftDetailModel extends IBaseModel<NftDetailModel> {
  NftDetailModel({
    this.itemDetail,
  });

  ItemDetail? itemDetail;

  @override
  NftDetailModel fromJson(Map<String, dynamic> json) => NftDetailModel(
        itemDetail: ItemDetail.fromMap(json["item_detail"]),
      );

  @override
  Map<String, dynamic> toJson() => {
        "item_detail": itemDetail!.toMap(),
      };
}

class ItemDetail {
  ItemDetail({
    this.nftName,
    this.nftNumber,
    this.isCreator,
    this.owner,
    this.adress,
    this.description,
    this.imageUrl,
    this.ownerLogo,
    this.priceType,
    this.lastBid,
    this.market,
    this.rarirty,
  });

  String? nftName;
  int? nftNumber;
  bool? isCreator;
  String? owner;
  String? adress;
  String? description;
  String? imageUrl;
  String? ownerLogo;
  String? priceType;
  int? lastBid;
  List<Market>? market;
  Rarirty? rarirty;

  factory ItemDetail.fromMap(Map<String, dynamic> json) => ItemDetail(
      nftName: json["nft_name"],
      nftNumber: json["nft_number"],
      isCreator: json["is_creator"],
      owner: json["owner"],
      adress: json["adress"],
      description: json["description"],
      imageUrl: json["image_url"],
      ownerLogo: json["owner_logo"],
      priceType: json["price_type"],
      lastBid: json["last_bid"],
      market: List<Market>.from(json["market"].map((x) => Market.fromMap(x))),
      rarirty: Rarirty.fromMap(json["rarirty"]));

  Map<String, dynamic> toMap() => {
        "nft_name": nftName,
        "nft_number": nftNumber,
        "is_creator": isCreator,
        "owner": owner,
        "adress": adress,
        "description": description,
        "image_url": imageUrl,
        "owner_logo": ownerLogo,
        "price_type": priceType,
        "last_bid": lastBid,
      };
}
