import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:sizer/sizer.dart';

class CustomeDropDownButton extends StatelessWidget {
  final String label;
  final String value;
  final double? fontSize;
  final List<dynamic>? itemList;
  final FontWeight? fontWeight;
  final Function(String?)? onChanged;
  final double? horizantalmergin;

  const CustomeDropDownButton({
    Key? key,
    this.label = "",
    this.value = "",
    this.fontSize = 10,
    this.onChanged,
    this.itemList,
    this.horizantalmergin = 0.06,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: sizeWidth(context) * horizantalmergin),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightblue,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey, width: 1.5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            iconSize: 32,
            isExpanded: true,
            dropdownColor: AppColors.lightblue,
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AppAssets.arrowdownicon,
                height: 20,
                width: 20,
              ),
            ),
            onChanged:
                onChanged, // (value) => setState(() => this.value = value),
            items: List.generate(
                itemList!.length, (index) => buildMenuItem(itemList![index])),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade300),
        ),
      );
}
