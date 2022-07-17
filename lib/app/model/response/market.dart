class Market {
  Market({
    this.marketName,
    this.marketLogo,
    this.marketUrl,
  });

  String? marketName;
  String? marketLogo;
  String? marketUrl;

  factory Market.fromMap(Map<String, dynamic> json) => Market(
        marketName: json["market_name"],
        marketLogo: json["market_logo"],
        marketUrl: json["market_url"],
      );

  Map<String, dynamic> toMap() => {
        "market_name": marketName,
        "market_logo": marketLogo,
        "market_url": marketUrl,
      };
}
