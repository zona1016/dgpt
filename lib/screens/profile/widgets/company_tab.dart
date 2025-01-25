import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';

class CompanyTab extends StatefulWidget {
  const CompanyTab({super.key});

  @override
  State<CompanyTab> createState() => _CompanyTabState();
}

class _CompanyTabState extends State<CompanyTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding / 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: BaseColors.black
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DGPT',
                      style: fontSFProBold.copyWith(
                        fontSize: 20,
                        color: BaseColors.white,
                      ),
                    ),
                    const SizedBox(height: defaultPadding / 2,),
                    Text(
                      '分散化算力收益平台 充分利用并分散个人和企业的闲置计算力',
                      style: fontSFProMedium.copyWith(
                        fontSize: 14,
                        color: BaseColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: defaultPadding / 2,),
              Image.asset(
                  "assets/images/tab/data_inactive.png"),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding / 2,),
        Text(
          'DGPT 算力分散平台由范式引擎全球科技公司于2014年9月由一群热衷于人工智能（AI）的技术精英创立，旨在推动企业的智能化转型。',
          style: fontSFProMedium.copyWith(
            fontSize: 14,
            color: BaseColors.white,
          ),
        ),
        const SizedBox(height: defaultPadding / 2,),
        Image.asset(
            "assets/images/tab/data_inactive.png"),
        const SizedBox(height: defaultPadding / 2,),
        Text(
          '公司凭借丰富的行业经验和领先的技术，成为企业级人工智能领域的行业先驱者与领导者。范式引擎全球科技公司专注于提供以平台为中心的全栈人工智能解决方案，产品线覆盖从芯片、板卡、整机到平台软件。',
          style: fontSFProMedium.copyWith(
            fontSize: 14,
            color: BaseColors.white,
          ),
        ),
      ],
    );
  }
}
