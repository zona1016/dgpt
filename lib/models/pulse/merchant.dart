import 'package:json_annotation/json_annotation.dart';

part 'merchant.g.dart';

@JsonSerializable()
class Merchant extends Object {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'currency', defaultValue: '')
  String? currency;

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'minAmount')
  int? minAmount;

  @JsonKey(name: 'maxAmount')
  int? maxAmount;

  Merchant(this.id,this.name,this.currency,this.address,this.minAmount,this.maxAmount,);

  factory Merchant.fromJson(Map<String, dynamic> srcJson) => _$MerchantFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MerchantToJson(this);

}


