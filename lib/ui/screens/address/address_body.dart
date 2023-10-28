import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/address.dart';
import 'package:flutter_blog/ui/screens/address/address_detail.dart';
import 'package:flutter_blog/ui/screens/address/address_detail_setting.dart';
import 'package:flutter_blog/ui/screens/address/address_list_view_model.dart';
import 'package:flutter_blog/ui/screens/address/widget/address_caption.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class AddressBody extends ConsumerWidget {
  AddressBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Form State
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Map<String, String> formData = {};

    AddressModel? model = ref.watch(addressListProvider);

    List<Address> addresses = [];

    if (model != null) {
      addresses = model.addresses;
    }

    /// Controller
    // _postcodeController 지번을 받음
    final TextEditingController _postcodeController = TextEditingController();
    // _postcodeController 주소를 받음
    final TextEditingController _addressController = TextEditingController();
    // _addressDetailController 상세 주소를 받음
    final TextEditingController _addressDetailController =
        TextEditingController();

    // 더미 데이터
    // List<String> addresses = [
    //   "서울 관악",
    //   "부산 동래",
    //   "전남 광주",
    //   "경북 경산",
    //   "경기 김포",
    //   "제주 서귀포",
    //   "강원 태백",
    //   "경남 마산",
    //   "충북 청주",
    //   "충남 태안",
    //   "강원 동해",
    //   "전북 무주",
    // ];

    return CustomScrollView(
      slivers: [
        CustomNavAppBar(
          text: "배송지 관리",
          onPressed: () {
            Navigator.pop(context);
          },
          actions: [
            TextButton(
              onPressed: () async {
                KopoModel? model = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RemediKopo(),
                  ),
                );
                if (model != null) {
                  final postcode = model.zonecode ?? '';
                  _postcodeController.value = TextEditingValue(
                    text: postcode,
                  );
                  formData['postcode'] = postcode;

                  final address = model.address ?? '';
                  _addressController.value = TextEditingValue(
                    text: address,
                  );
                  formData['address'] = address;

                  final buildingName = model.buildingName ?? '';
                  _addressDetailController.value = TextEditingValue(
                    text: buildingName,
                  );
                  formData['address_detail'] = buildingName;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddressDetailSetForm(model: model),
                    ),
                  );
                }
              },
              child: Text(
                "추가",
                style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            constraints: BoxConstraints(minHeight: 35),
            child: AddressCaption(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        SizedBox(height: smallGap),
                        InkWell(
                          onTap: () {},
                          child: AddressDetail(
                            destination: addresses[index].destination,
                            destinationDetail:
                                addresses[index].destinationDetail,
                            isDefaultAddress: addresses[index].isDefaultAddress,
                          ),
                        ),
                        SizedBox(height: smallGap),
                      ],
                    ),
                  )
                ],
              ),
            );
          }, childCount: addresses.length),
        )
      ],
    );
  }
}
