import 'package:dgpt/screens/home/node_partner_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NodePartnerScreen extends GetView<NodePartnerScreenController> {
  const NodePartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      safeAreaTop: false,
      backgroundColor: BaseColors.primaryColor,
      appBar: BaseAppBar(
        title: 'Node Partner',
        color: Colors.white,
        backgroundColor: BaseColors.primaryColor,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: BaseColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: defaultPadding / 4,
                  ),
                  Center(
                    child: Text(
                      'Global Computing Power Building \nPartnership Program',
                      style: fontSFProMedium.copyWith(
                        fontSize: 20,
                        color: BaseColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding / 4,
                  ),
                  Center(
                    child: Text(
                      "In order to continue to expand into the world's largest distributed "
                          "computing power infrastructure platform and promote the global "
                          "AI data training market through the computing power partner model, "
                          "DGPT launched the Global Computing Power Building Partner Program.",
                      style: fontSFProMedium.copyWith(
                        fontSize: 14,
                        color: BaseColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  SizedBox(
                    width: 200,
                    child: BaseButton(
                      borderRadius: BorderRadius.circular(25),
                      onPressed: () async {
                        final uri = Uri.parse(controller.appleNow);
                        await launchUrl(uri, mode: LaunchMode.inAppWebView);
                      },
                      text: 'Apple Now',
                      type: BaseButtonType.golden,
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Container(
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: BaseColors.black
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Vision and Mission',
                          style: fontSFProMedium.copyWith(
                            fontSize: 20,
                            color: BaseColors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        Text(
                          "The arrival of the AI era will subvert all our previous "
                              "understanding of applications. "
                              "Computing power and data training will become the "
                              "key to the development of the AI industry. "
                              "DGPT allows everyone to participate in the "
                              "AI industry at their fingertips and obtain "
                              "sustainable economic benefits from it.",
                          style: fontSFProMedium.copyWith(
                            fontSize: 14,
                            color: BaseColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding,),
                ],
              ),
            ),
            SliverList.builder(
              itemCount: 3,
              itemBuilder: (_, index) {
                if (index == 0) {
                  return _yourRights();
                } else if (index == 1) {
                  return _descriptionOfAdditionalBenefits();
                } else {
                  return _weHopeYouAre();
                }
              },
            ),
            SliverToBoxAdapter(
              child: BaseButton(
                borderRadius: BorderRadius.circular(25),
                onPressed: () async {
                  final uri = Uri.parse(controller.appleNow);
                  await launchUrl(uri, mode: LaunchMode.inAppWebView);
                },
                text: 'Apple Now',
                type: BaseButtonType.golden,
              ),
            )
          ],
        ),
      ),
    );
  }

  _yourRights() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: BaseColors.black,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding / 2),
          child: Text(
            "YOUR RIGHTS",
            style: fontSFProMedium.copyWith(
              fontSize: 14,
              color: BaseColors.white,
            ),
          ),
        ),
        const SizedBox(height: defaultPadding / 2,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            border: TableBorder.all(
              color: Colors.black, // 边框颜色
              width: 1, // 边框宽度
            ),
            columns: const [
              DataColumn(label: Text('NODE TYPE', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('REQUIRE', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('MONTHLY SALARY(U)', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('GENERAL NODE PARTNER')),
                DataCell(Text('LV.3')),
                DataCell(Text('200')),
              ]),
              DataRow(cells: [
                DataCell(Text('BEGINNER NODE PARTNER', style: TextStyle(color: Colors.orange))),
                DataCell(Text('LV.4')),
                DataCell(Text('300')),
              ]),
              DataRow(cells: [
                DataCell(Text('INTERMEDIATE NODE PARTNER', style: TextStyle(color: Colors.green))),
                DataCell(Text('LV.5')),
                DataCell(Text('500')),
              ]),
              DataRow(cells: [
                DataCell(Text('ADVANCED NODE PARTNER', style: TextStyle(color: Colors.blue))),
                DataCell(Text('LV.6')),
                DataCell(Text('1000')),
              ]),
              DataRow(cells: [
                DataCell(Text('REGIONAL NODE PARTNER', style: TextStyle(color: Colors.purple))),
                DataCell(Text('2*LV.6')),
                DataCell(Text('5000')),
              ]),
              DataRow(cells: [
                DataCell(Text('GLOBAL NODE PARTNER', style: TextStyle(color: Colors.red))),
                DataCell(Text('2*REGIONAL NODE PARTNER')),
                DataCell(Text('10000')),
              ]),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding,),
      ],
    );
  }

  _descriptionOfAdditionalBenefits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: BaseColors.black,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding / 2),
          child: Text(
            "DESCRIPTION OF ADDITIONAL BENEFITS",
            style: fontSFProMedium.copyWith(
              fontSize: 14,
              color: BaseColors.white,
            ),
          ),
        ),
        const SizedBox(height: defaultPadding / 2,),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          // Prevent scrolling inside GridView
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: 1,
          ),
          itemCount: 4,
          // Number of items
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                color: BaseColors.black,
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: defaultPadding,),
                    Image.asset(
                      "assets/images/tab/data_inactive.png",
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(height: defaultPadding,),
                    Text(
                      controller.descriptionOfAdditionalBenefitList[index],
                      style: fontSFProMedium.copyWith(
                        fontSize: 14,
                        color: BaseColors.white,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: defaultPadding,),
      ],
    );
  }

  _weHopeYouAre() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: BaseColors.black,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding / 2),
          child: Text(
            "WE HOPE YOU ARE",
            style: fontSFProMedium.copyWith(
              fontSize: 14,
              color: BaseColors.white,
            ),
          ),
        ),
        const SizedBox(height: defaultPadding / 2,),
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: BaseColors.black
          ),
          child: Text(
            controller.weHopeYouAr,
            style: fontSFProMedium.copyWith(
              fontSize: 14,
              color: BaseColors.white,
            ),
          ),
        ),
        const SizedBox(height: defaultPadding,),
      ],
    );
  }
}


