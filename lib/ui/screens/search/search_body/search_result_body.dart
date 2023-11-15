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

    return CustomScrollView(
      slivers: [
        SearchTextForm(),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 0,
                childAspectRatio: 0.43,),

              itemCount: searchModel!.productSearchDTOS.length,
              itemBuilder: (context, index) {
                 Logger().d("$index 번째 아이템 생성 중");
                 return Padding(
                   padding: const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 10.0),
                   child: CustomProductItem(
                      productId: searchModel!.productSearchDTOS[index].productId,
                      images: "${imgUrl}${searchModel!.productSearchDTOS[index].productThumbnail}",
                      sellerName: searchModel!.productSearchDTOS[index].productName,
                      discountRate: searchModel!.productSearchDTOS[index].discountRate,
                      disablePrice: searchModel!.productSearchDTOS[index].minOptionPrice,
                      productTitle: searchModel!.productSearchDTOS[index].productName,
                      totalPrice: searchModel!.productSearchDTOS[index].discountedminOptionPrice,
                      reviewGrade: searchModel!.productSearchDTOS[index].avgStarCount,
            ),
                 );
      },
            ),
          ),
        ),
    ]);
  }
}
