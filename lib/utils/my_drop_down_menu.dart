import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MyDropDownMenu extends StatefulWidget {
  final List<String> items;
  final String label;
  final double buttonHeight;
  final double buttonWidth;
  final double dropDownHeight;
  final double dropDownWidth;
  final DropdownDirection dropdownDirection;

  const MyDropDownMenu(
      {super.key,
      required this.items,
      required this.buttonHeight,
      required this.buttonWidth,
      required this.dropDownHeight,
      required this.dropDownWidth,
      required this.dropdownDirection, 
      required this.label});

  @override
  State<MyDropDownMenu> createState() => _MyDropDownMenuState();
}

class _MyDropDownMenuState extends State<MyDropDownMenu> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 17,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
        iconSize: 14,
        iconEnabledColor: Colors.blueGrey,
        iconDisabledColor: Colors.grey,
        buttonHeight: widget.buttonHeight,
        buttonWidth: widget.buttonWidth,
        buttonPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,
          ),
          color: Colors.grey.shade200,
        ),
        buttonElevation: 2,
        itemHeight: 40,
        itemPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        dropdownMaxHeight: widget.dropDownHeight, // 200
        dropdownWidth: widget.buttonWidth, // 200
        dropdownPadding: const EdgeInsets.symmetric(horizontal: 10.0, ),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        dropdownElevation: 8,
        dropdownDirection: widget.dropdownDirection, //DropdownDirection.left,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(-20, 0),
      ),
    );
  }
}
