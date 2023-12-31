import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/request_dto/address_request.dart';
import 'package:flutter_blog/ui/screens/address/address_list_view_model.dart';
import 'package:flutter_blog/ui/screens/address/widget/address_detail_text_form.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

// class AddressDetailSetForm extends StatelessWidget {
//   KopoModel? model;
//   AddressDetailSetForm({super.key, this.model});
//   final datailAddress = TextEditingController();
//   final receiver = TextEditingController();
//   final receiverTel = TextEditingController();
//   bool isDefaultAddress = false;

class AddressDetailSetForm extends StatefulWidget {
  final KopoModel? model;
  AddressDetailSetForm({Key? key, required this.model}) : super(key: key);

  @override
  _AddressDetailSetFormState createState() => _AddressDetailSetFormState();
}

class _AddressDetailSetFormState extends State<AddressDetailSetForm> {
  final destinationDetail = TextEditingController();
  final receiverName = TextEditingController();
  final receiverTel = TextEditingController();
  bool isDefaultAddress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomNavAppBar(
            text: "배송지",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  AddressDetailTextForm(
                      hintText: "상세주소를 입력하세요",
                      title: "${widget.model!.address}",
                      controller: destinationDetail),
                  AddressDetailTextForm(
                      hintText: "받는사람 이름을 입력하세요",
                      title: "받으실분",
                      controller: receiverName),
                  AddressDetailTextForm(
                      title: "연락처",
                      hintText: "'-' 를 제외한 번호를 입력하세요",
                      controller: receiverTel),
                  SizedBox(height: 50),
                  Container(
                      child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CheckBoxRounded(
                                    onTap: (bool? value) {
                                      setState(() {
                                        isDefaultAddress = value ?? false;
                                      });
                                    },
                                    checkedColor: primaryColor02,
                                    size: 24.0,
                                    uncheckedWidget: Icon(
                                      Icons.check,
                                      size: 20,
                                      color: basicColorB9,
                                    ),
                                  ),
                                  SizedBox(
                                    width: smallGap,
                                  ),
                                  Text(
                                    "기본 배송지로 저장",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  Consumer(
                    builder: (context, ref, child) {
                      return CustomElevatedButton(
                        text: "저장",
                        funPageRoute: () {
                          submit(ref);
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void submit(WidgetRef ref) {
    print("destination : ${widget.model!.address}");
    print("destinationDatail : ${destinationDetail.text}");
    print("receiverName : ${receiverName.text}");
    print("receiverTel : ${receiverTel.text}");
    print("isDefaultAddress : ${isDefaultAddress}");
    AddressSaveReqDTO dto = AddressSaveReqDTO(
        destination: "${widget.model!.address}",
        receiverName: "${receiverName.text}",
        isDefaultAddress: isDefaultAddress,
        receiverTel: "${receiverTel.text}",
        destinationDetail: "${destinationDetail.text}");

    ref.read(addressListProvider.notifier).notifyAdd(dto);
    Navigator.pop(context);
  }
}
