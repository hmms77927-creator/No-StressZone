
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../Constant/appColors.dart';

class headcontainer extends StatelessWidget {
  final String text;
  final Color colors;
  const headcontainer(this.text, this.colors, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,style: TextStyle(color: colors,fontSize: 45,fontWeight:FontWeight.w700),),
    );
  }
}

// main header container
class headerContainer  extends StatelessWidget {
  final String text;
  final Color colors;
  const headerContainer ({super.key, required this.text, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,style: TextStyle(color: colors,fontSize: 32,fontWeight:FontWeight.w700),),
    );
  }
}

// subcontainer

class subContainer  extends StatelessWidget {
  final String text;
  final Color colors;
  const subContainer ({super.key, required this.text, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,style: TextStyle(color: colors,fontSize: 14,fontWeight:FontWeight.w400),),
    );
  }
}
// //home container
class homecontainer extends StatelessWidget {
  final String text;
  final Color colors;
  final Color containcolors;
  final String image;
  final bool isSelected;

  const homecontainer({
    super.key,
    required this.text,
    required this.colors,
    required this.image,
    required this.containcolors,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.white),
        color: containcolors,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          /// 🔹 ICON CONTAINER
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              color: isSelected ? AppColors.black : null,

              gradient: isSelected
                  ? null
                  : LinearGradient(
                colors: [
                  AppColors.white.withOpacity(0.45),
                  AppColors.white.withOpacity(0.0),
                ],
              ),

              border: Border.all(color: AppColors.white),
            ),
            child: Image.asset(image, width: 24),
          ),

          SizedBox(height: 10),

          /// 🔹 TEXT
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colors,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
//Primary Container
class PrimaryContainer extends StatelessWidget {
  final String text;
  final Color colors;
  const PrimaryContainer({super.key, required this.text, required this.colors});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Text(text,style: TextStyle(color: colors,fontSize:20,fontWeight:FontWeight.w600),),
    );
  }
}

// homebodycontainer1
class Homebodycontainer1 extends StatelessWidget {
  final String text;
  const Homebodycontainer1({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
     child:  Text(
        text,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
      ),
    );
  }
}

// body last container
class BodyLastContainer extends StatelessWidget {
  final String text;
  final String title;
  final ValueChanged<double> onChanged;
  final double values;

  const BodyLastContainer({
    super.key,
    required this.text,
    required this.title,
    required this.onChanged,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.cardcolor,
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            text,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Slider(
              activeColor: AppColors.parratcolor,
              value: values, onChanged: onChanged),
Row(
  children: [
    Container(
      child: Text('0',style: TextStyle(color: AppColors.white.withOpacity(0.9)),),
    ),
    Spacer(),
    Container(
      child: Text('55%',style: TextStyle(color: AppColors.white.withOpacity(0.9)),),
    )
  ],
)
        ],
      ),
    );
  }
}
//Community contact container
class communitycontactcontainer extends StatelessWidget {
  final String text;
  final String title;
  final String image;
  final VoidCallback onPressed;
  const communitycontactcontainer({super.key, required this.text, required this.image, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.black),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child:CircleAvatar(
                radius: 30,
                backgroundImage:AssetImage(image)
              ) ,
            ),
          ),
          Container(      child: Text(text,style: TextStyle(color: AppColors.white,fontSize: 18,fontWeight: FontWeight.w600),),
          ),
          Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side:BorderSide(color: AppColors.white ,width: 1)
                )
              ),
              onPressed: onPressed, child:Text(title, style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: AppColors.yellowColor),))
        ],
      ),
    );
  }
}

// dashed lines
class DashedLine extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const DashedLine({
    super.key,
    this.width = double.infinity,
    this.height = 1,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _DashedLinePainter(color: color),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;

  _DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.height;

    const dashWidth = 5.0;
    const dashSpace = 5.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
//Radius
class radiuscontainer extends StatelessWidget {
  final String image;
  const radiuscontainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: 35,
        backgroundImage: AssetImage(image),
      ),
    );
  }
}
// Member progress
class membercontainer extends StatelessWidget {
  final String text;
  const membercontainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(      child: Text(text,style: TextStyle(color: AppColors.white,fontSize: 18,fontWeight: FontWeight.w600),));
  }
}
// slider for group
class slidercontainer extends StatelessWidget {
  final ValueChanged<double> onChanged;
  final Color colors;
  final double value;

  const slidercontainer({super.key, required this.onChanged, required this.colors, required this.value});

  @override
  Widget build(BuildContext context) {
    return Slider(value: value, onChanged: onChanged,activeColor: colors,);
  }
}

//Massege container
class MassegeContainer extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onPressed;
  const MassegeContainer({super.key, required this.text, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.yellowColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(image),
            ),
          ),
          Container(
            child: Text(text,style: TextStyle(color:AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),),
          ),
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.cardcolor,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                ),
              ),
              onPressed: onPressed, child: Text('Friends',style: TextStyle(fontWeight:FontWeight.w600,fontSize: 14,color: AppColors.white),))
        ],
      ),
    );
  }
}
