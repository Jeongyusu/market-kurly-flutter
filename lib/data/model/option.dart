
import 'package:flutter_blog/data/model/product.dart';

class Option {

int id;
String optionName;
int optionPrice;
int optionStack;
int optionQuantity = 0;
Product? product;

Option(this.id, this.optionName, this.optionPrice, this.optionStack, this.product, this.optionQuantity);

Option.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      optionName = json["optionName"],
      optionPrice = json["optionPrice"],
      optionStack = json["optionStack"];
      // product = json["product"];
}
