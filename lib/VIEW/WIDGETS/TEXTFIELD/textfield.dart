import 'package:flutter/material.dart';
import 'package:new_project_1/Constant/appColors.dart';


class HeaderField extends StatelessWidget {
  final String text;
  final Icon? prefixIcon;
  const HeaderField({super.key, required this.text, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.45), // 45% white
            Colors.white.withOpacity(0.0),  // 0% white
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextField(
        style: TextStyle(
          color: AppColors.white
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          prefixIcon: prefixIcon,
          hintText: text,
          hintStyle: TextStyle(color: AppColors.white),
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}

//positivefield
class PositiveTextField extends StatelessWidget {
  final String text;
  const PositiveTextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: AppColors.white, // user jo text likhe ga us ka color red ho jaye ga
        fontSize: 18,
      ),
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.white,width: 1),
        ),

        hintText: text,
        hintStyle: TextStyle(fontSize: 18,fontWeight:FontWeight.w400,color: AppColors.white),
        filled: true,
        fillColor: AppColors.cardcolor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.white,width: 1),
        )
      ),
    );
  }
}

//video textfield
class VideoTextField extends StatelessWidget {
  final String text;
  const VideoTextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      height: 61,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.45),
            Colors.white.withOpacity(0.0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        style: TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          hintText: text,
          hintStyle: TextStyle(color: AppColors.white),
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );;
  }
}

//Login Field
class LoginField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool obcure;

  const LoginField({
    super.key,
    required this.text,
    required this.controller,
    this.icon,
    this.onPressed, required this.obcure,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 353,
      height: 60,
      child: TextField(
        controller: controller,
        obscureText: obcure,
        style: TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1, color: AppColors.white),
          ),
          hintText: text,
          hintStyle: TextStyle(color: AppColors.white),
          fillColor: AppColors.cardcolor,
          filled: true,

          // ✅ optional suffix icon
          suffixIcon: icon != null
              ? IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
          )
              : null,

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1, color: AppColors.white),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1, color: AppColors.pinkcolor),
          ),
        ),
      ),
    );
  }
}

// Data fatch field
class Datafetchfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final IconData? icon;
  const Datafetchfield({super.key, required this.text, required this.controller, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.white,fontSize: 18,fontWeight: FontWeight.w600),
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(width: 1, color: AppColors.white),
        ),
        hintText: text,
        hintStyle: TextStyle(color: AppColors.white),
        fillColor: AppColors.cardcolor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(width: 1, color: AppColors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(width: 1, color: AppColors.pinkcolor),
        ),
      ),
    );
  }
}

// class LoginField extends StatelessWidget {
// final String text;
// final TextEditingController controller;
// final IconData? icon;
// final VoidCallback onPressed;
//   const LoginField({super.key, required this.text, required this.controller, this.icon, required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 353,
//       height: 60,
//       child: TextField(
//         controller: controller,
//         style: TextStyle(color: AppColors.white),
//         decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25),
//           borderSide: BorderSide(width: 1,color: AppColors.white),
//         ),
//           hintText:text,hintStyle: TextStyle(color: AppColors.white),
//           fillColor: AppColors.cardcolor,
//           filled:true,
//           suffixIcon:IconButton(onPressed: onPressed, icon:Icon(icon)),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25),
//             borderSide: BorderSide(width: 1,color: AppColors.white),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25),
//             borderSide: BorderSide(width: 1,color: AppColors.pinkcolor),
//           )
//         ),
//       ),
//     );
//   }
// }
