import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project_1/VIEW/WIDGETS/CONTAINERS/containers.dart';
import 'package:new_project_1/Constant/appColors.dart';

class bottombutton extends StatelessWidget {
  final String image;
  final Color colors;
  final VoidCallback onTap;
  const bottombutton(this.image, this.colors, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 121,
        height: 59,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(50),
        ),
        child:Image.asset(image, width: 25,height:25,) ,
      ),
    );
  }
}

// notificationbutton
class notificattionbutton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icons;
  const notificattionbutton({super.key, required this.onPressed, required this.icons});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.white.withOpacity(0.15),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
          )
        ),
        onPressed: onPressed, icon: Icon(icons,color: AppColors.white,size: 22,));
  }
}

// Custom button
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color colors;
  final Color buttoncolor;
  const CustomButton({super.key, required this.onPressed, required this.text, required this.colors, required this.buttoncolor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor:buttoncolor ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed, child:Text(text, style: TextStyle(color:colors,fontSize: 18,fontWeight: FontWeight.w600 ),));
  }
}

// radio Massege button
class RadioMassegebutton extends StatelessWidget {
  final String value;
  final String groupValue;
  final Function(String?) onChanged;

  const RadioMassegebutton({super.key, required this.value, required this.groupValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return  Radio<String>(
      value: value,
      activeColor: AppColors.yellowColor,
      side:BorderSide(color: AppColors.white),
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}


// video bottom button
class Videobottombutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Videobottombutton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.cardcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )
        ),
        onPressed: onPressed, child: Text(text,style: TextStyle(color: AppColors.white,fontSize: 15,fontWeight:FontWeight.w400),));
  }
}
