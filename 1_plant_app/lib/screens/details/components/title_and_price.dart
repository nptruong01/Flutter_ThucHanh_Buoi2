import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key? key,
    required this.title,
    required this.country,
    required this.price,
  }) : super(key: key);

  final String title, country;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      country,
                      style: const TextStyle(
                        fontSize: 20,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                "\$$price",
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildBarcode(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBarcode() {
    List<Widget> barcodeWidgets = [];
    const int barCount = 40; // Number of bars in the barcode
    final List<double> barWidths = [14.0, 10.0, 6.0, 8.0, 12.0]; // Varying widths for bars
    const double spacerWidth = 5.0; // Width of spacer between bars

    for (int i = 0; i < barCount; i++) {
      bool isBar = i % 2 == 0;
      double width = isBar ? barWidths[i % barWidths.length] : spacerWidth;

      barcodeWidgets.add(Container(
        width: width,
        height: 24.0, // Height of the barcode
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ));
    }

    return barcodeWidgets;
  }
}
