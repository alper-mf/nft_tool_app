class Rarirty {
  Rarirty({
    this.traitCount,
    this.hair,
    this.ear,
    this.special,
    this.type,
    this.neck,
    this.clothing,
    this.background,
  });

  int? traitCount;
  String? hair;
  String? ear;
  String? special;
  String? type;
  String? neck;
  String? clothing;
  String? background;

  factory Rarirty.fromMap(Map<String, dynamic> json) => Rarirty(
        traitCount: json["trait_count"],
        hair: json["hair"],
        ear: json["ear"],
        special: json["special"],
        type: json["type"],
        neck: json["neck"],
        clothing: json["clothing"],
        background: json["background"],
      );

  Map<String, dynamic> toMap() => {
        "trait_count": traitCount,
        "hair": hair,
        "ear": ear,
        "special": special,
        "type": type,
        "neck": neck,
        "clothing": clothing,
        "background": background,
      };
}
