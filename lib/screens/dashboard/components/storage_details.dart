import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Domain analytics",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            svgSrc: "assets/icons/flight.svg",
            title: "Travel domain",
            amountOfFiles: "130",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/pill5.svg",
            title: "Health care",
            amountOfFiles: "1530",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/cash.svg",
            title: "Banking",
            amountOfFiles: "130",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/laptop5.svg",
            title: "Shopping",
            amountOfFiles: "130",
            numOfFiles: 140,
          ),
        ],
      ),
    );
  }
}
