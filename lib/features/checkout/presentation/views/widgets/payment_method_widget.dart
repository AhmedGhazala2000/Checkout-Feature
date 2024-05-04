import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget(
      {Key? key, required this.assetImage, this.isSelected = false})
      : super(key: key);
  final String assetImage;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(left: 20),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        color: Colors.white,
        shadows: isSelected
            ? const [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0xff34A853),
                ),
              ]
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: isSelected ? const Color(0xff34A853) : Colors.grey,
            width: isSelected ? 1.5 : 1,
          ),
        ),
      ),
      child: Center(
        child: SvgPicture.asset(assetImage),
      ),
    );
  }
}
