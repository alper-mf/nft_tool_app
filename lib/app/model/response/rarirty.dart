class Rarirty {
  Rarirty(
      {this.traitType,
      this.value,
      this.displayType,
      this.maxValue,
      this.traitCount,
      this.order,
      this.rarirtyPercent});

  String? traitType;
  String? value;
  String? displayType;
  int? maxValue;
  int? traitCount;
  String? order;
  String? rarirtyPercent;

  factory Rarirty.fromMap(Map<String, dynamic> json) => Rarirty(
        traitType: json["trait_type"],
        value: json["value"],
        displayType: json["display_type"],
        maxValue: json["max_value"],
        traitCount: json["trait_count"],
        order: json["order"],
        rarirtyPercent: json["rarirty_percent"],
      );

  Map<String, dynamic> toMap() => {
        "trait_type": traitType,
        "value": value,
        "display_type": displayType,
        "max_value": maxValue,
        "trait_count": traitCount,
        "order": order,
      };
}
