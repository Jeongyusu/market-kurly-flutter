import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/ui/screens/search/search_view_model.dart';
import 'package:flutter_blog/ui/screens/search/widget/search_text_form.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_count_and_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../data/dto/model_dto/product_dto/product_search_dto.dart';

class SearchResultBody extends ConsumerStatefulWidget {
  List<ProductSearchDTO>? productSearchDTOS;
  SearchResultBody({
    this.productSearchDTOS,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends ConsumerState<SearchResultBody> {
  String _selectedValue = "평점순";

  @override
  Widget build(BuildContext context) {
    SearchModel? searchModel = ref.watch(searchProvider);
    String imgUrl = dio.options.baseUrl;

    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: searchModel!.productSearchDTOS.length,
      itemBuilder: (context, index) {
        Logger().d("$index 번째 아이템 생성 중");
        return CustomProductItem(
          productId: searchModel!.productSearchDTOS[index].productId,
          images: "assets/images/1.jpg",
          // "${imgUrl}${searchModel!.productSearchDTOS[index].productThumnail}",
          sellerName: searchModel!.productSearchDTOS[index].productName,
          discountRate: searchModel!.productSearchDTOS[index].discountRate,
          disablePrice: searchModel!.productSearchDTOS[index].minOptionPrice,
          productTitle: searchModel!.productSearchDTOS[index].productName,
          totalPrice:
              searchModel!.productSearchDTOS[index].discountedminOptionPrice,
        );
      },
    );
  }
}
