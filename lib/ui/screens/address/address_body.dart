import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/address.dart';
import 'package:flutter_blog/ui/screens/address/address_detail.dart';
import 'package:flutter_blog/ui/screens/address/address_detail_setting.dart';
import 'package:flutter_blog/ui/screens/address/address_list_view_model.dart';
import 'package:flutter_blog/ui/screens/address/widget/address_caption.dart';
import 'package:flutter_blog/ui/screens/address/widget/address_nav_appbar.dart';
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

    AddressListModel? model = ref.watch(addressListProvider);

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

    return CustomScrollView(
      slivers: [
        AddressNavAppbar(
          text: "배송지 관리",
          onPressed: () {
            Navigator.pop(context);
          },
          actions: [
            Container(
              width: 50,
              child: TextButton(
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
                        builder: (context) =>
                            AddressDetailSetForm(model: model),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide.none),
                ),
                child: Text(
                  "추가",
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                ),
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
