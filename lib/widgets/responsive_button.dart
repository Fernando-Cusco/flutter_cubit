import 'package:appcubit/misc/colors.dart';
import 'package:appcubit/widgets/app_texto.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;


  ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: (isResponsive!)? width: double.maxFinite,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: (isResponsive!)? MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
          children: [
            (isResponsive!)?  Container(margin: const EdgeInsets.only(left: 20), child: AppText(text: "Book Trip Now", color: Colors.white, size: 12,)): Container(),
            // Image.asset("img/button-one.png", fit: BoxFit.cover,)
          ],
        ),
      ),
    );
  }
}
