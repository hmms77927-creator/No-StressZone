import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project_1/Constant/appColors.dart';
import 'package:new_project_1/Constant/appImages.dart';


class choseCard extends StatelessWidget {
  final String text;
  final String image;
  final Color color;
  final bool isSelect;
  const choseCard(this.text, this.image, {super.key, required this.color, required this.isSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 194,
      decoration: BoxDecoration(
        color:isSelect?AppColors.yellowColor:AppColors.black ,
        borderRadius: BorderRadiusDirectional.circular(50)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 50,
            height:50 ,
            decoration: BoxDecoration(
              border: Border(left: BorderSide(width: 1,color: AppColors.white),right:  BorderSide(width: 1,color: AppColors.white),bottom:  BorderSide(width: 1,color: AppColors.white),top:  BorderSide(width: 1,color: AppColors.white),),
              gradient: LinearGradient(colors: [AppColors.white.withOpacity(0.47),AppColors.black ],
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape:BoxShape.circle,
            ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(image,width: 26,height: 26,fit: BoxFit.cover,),
              ),
            ),
          ),
          Container(
            child: Text(text,style:TextStyle(color: color,fontSize: 18,fontWeight:FontWeight.w600) ,),
          )
        ],
      ),
    );
  }
}
// COMMUNITY CARD
class communitytopcard extends StatelessWidget {
  final String text;

  const communitytopcard({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.white.withOpacity(0.47),
            AppColors.white.withOpacity(0.0),
          ],
          begin: Alignment.topLeft,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Container(
              child:Icon(Icons.add,color: AppColors.yellowColor,) ,
            ),
          ),
          Container(
            child: Text(text,style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600,color: AppColors.white ),),
          ),
        ],
      ),
    );
  }
}

//Community group card
class communitygroupcard extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onPressed;
  const communitygroupcard({super.key, required this.text, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      height: 73,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.cardcolor,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:10,top: 10,bottom: 10),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(colors:[AppColors.white.withOpacity(0.47),AppColors.black] )
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: SvgPicture.asset (image,fit:BoxFit.cover ,width: 24,height: 24,),
              ) ,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Container(child: Text(text,style: TextStyle(fontSize: 18,fontWeight:FontWeight.w600,color: AppColors.white ),),),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              child: Icon(Icons.arrow_forward_ios,color: AppColors.white,),
            ),
          ),
        ]
      ),
    );
  }
}

// wellness card
class wellnesscard extends StatelessWidget {
  final String text;
  final String title;
  final String image;
  final Color colors;
  final bool isSelect;
  final VoidCallback onTap;
  final bool isSelected;
  const wellnesscard({super.key, required this.text, required this.title, required this.image, required this.colors, required this.isSelect, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 353,
      height: 88,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          width: 194,
          decoration: BoxDecoration(
              color:isSelect?AppColors.yellowColor:AppColors.black ,
              borderRadius: BorderRadiusDirectional.circular(15),
            border: Border(top: BorderSide(width: 1,color: AppColors.white),
            bottom:  BorderSide(width: 1,color: AppColors.white),
              left:  BorderSide(width: 1,color: AppColors.white),
              right:  BorderSide(width: 1,color: AppColors.white),
            )
          ),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.start ,
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 10),
                child: Container(
                  width: 60,
                  height:60 ,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? AppColors.black : null,
                    gradient: isSelected
                        ? null
                        : LinearGradient(
                      colors: [
                        AppColors.white.withOpacity(0.47),
                        AppColors.black,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(image,width: 30,height: 30,fit: BoxFit.cover,),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7,top: 10),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    Container(
                      child: Text(text,style:TextStyle(color:colors ,fontSize: 24,fontWeight: FontWeight.w600) , ),
                    ),
                    Container(
                      child: Text(title,style:TextStyle(color:colors ,fontSize: 14,fontWeight: FontWeight.w400) , ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Flux card
class FluxCard extends StatelessWidget {
  final String text;
  final String title;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onPressed;

  const FluxCard({
    super.key,
    required this.text,
    required this.title,
    required this.image,
    required this.isSelected,
    required this.onTap,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        padding: const EdgeInsets.all(10),
        height: 88,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.yellowColor : AppColors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            // Circle image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: !isSelected
                    ? LinearGradient(
                  colors: [AppColors.white, AppColors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                    : null,
                color: isSelected ?  AppColors.black:null,
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(image, width: 30, height: 30),
            ),
            const SizedBox(width: 10),
            // Texts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        color: isSelected ? AppColors.black : AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: isSelected ? AppColors.black : AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            // Button
            SizedBox(
              height: 30,
              width: 135,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  side: BorderSide(color: AppColors.white),
                ),
                child: const Text(
                  'Add to Playlist',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// class fluxcard extends StatelessWidget {
//   final String text;
//   final String title;
//   final String image;
//   final Color colors;
//   final bool isSelect;
//   final VoidCallback onTap;
//   final VoidCallback onPressed;
//   final bool selected;
//   const fluxcard({super.key, required this.text, required this.title, required this.image, required this.colors, required this.isSelect, required this.onTap, required this.onPressed, required this.selected});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 353,
//       height: 88,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           height: 60,
//           width: 194,
//           decoration: BoxDecoration(
//               color:isSelect?AppColors.yellowColor:AppColors.black ,
//               borderRadius: BorderRadiusDirectional.circular(15)
//           ),
//           child: Row(
//             mainAxisAlignment:MainAxisAlignment.start ,
//             crossAxisAlignment:CrossAxisAlignment.start ,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 10,left:5,),
//                 child: Container(
//                   width: 60,
//                   height:60 ,
//                   decoration: BoxDecoration(
//                     color: selected?null:AppColors.black ,
//                     gradient:selected?null: LinearGradient(colors: [AppColors.white,AppColors.black],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     shape:BoxShape.circle,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset(image,width: 30,height: 30,fit: BoxFit.cover,),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left:10),
//                 child: Column(
//                   crossAxisAlignment:CrossAxisAlignment.start ,
//                   children: [
//                     Container(
//                       child: Text(text,style:TextStyle(color:colors ,fontSize: 22,fontWeight: FontWeight.w600) , ),
//                     ),
//                     Container(
//                       child: Text(title,style:TextStyle(color:colors ,fontSize: 14,fontWeight: FontWeight.w400) , ),
//                     ),
//                   ],
//                 ),
//               ),
//               Spacer(),
//               Padding(
//                 padding: const EdgeInsets.only(right: 20,top: 15),
//                 child: SizedBox(
//                   height: 30,
//                   width: 135,
//                   child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.black,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                         side: BorderSide(color: AppColors.white)
//                       ),
//                       onPressed: onPressed, child:Text('Add to Playlist',style: TextStyle(color: AppColors.white,fontSize: 12,fontWeight:FontWeight.w600 ),) ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Group card
class Groupcard extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;
  const Groupcard({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.black.withOpacity(0.42),
      ),
      child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(colors:[AppColors.white.withOpacity(0.47),AppColors.black] )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.favorite ,size: 24,color: AppColors.skycolor,),
                ) ,
              ),
            ),
            Container(child: Text(text,style: TextStyle(fontSize: 18,fontWeight:FontWeight.w600,color: AppColors.white ),),),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(onPressed: onPressed, icon:Icon(Icons.arrow_forward_ios,color: AppColors.white,), ),
            ),
          ]
      ),
    );
  }
}

//Usertile


class UserTile extends StatelessWidget {
  final String name;
  final String image;
  final int score;
  final int total;

  const UserTile({
    super.key,
    required this.name,
    required this.image,
    required this.score,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 30,
            margin: const EdgeInsets.only(left: 30),
            padding: const EdgeInsets.only(left: 50, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                colors: [
                  Colors.grey.shade500,
                  Colors.grey.shade800
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// Name
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      score.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                   SizedBox(width: 15),
                    Container(
                      height: 20,
                      width: 1,
                      color: Colors.white54,
                    ),
                   SizedBox(width: 15),
                    Text(
                      total.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),

          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
             color:  Colors.grey.shade500,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 28,
                   backgroundColor: Colors.grey.shade500 ,
                backgroundImage: AssetImage(image),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Leader board

class LeaderCard extends StatelessWidget {
  final String text;
  final String subtext;
  final String title;
  final String image;
  final String images;
  final VoidCallback onPressed;
  const LeaderCard({super.key, required this.text, required this.image, required this.onPressed, required this.subtext, required this.images, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
Container(
  child: Text(subtext,style: TextStyle(color: AppColors.yellowColor,fontSize: 18,fontWeight: FontWeight.w800),),
),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              child: Text(text,style: TextStyle(color:AppColors.white,fontSize: 18,fontWeight: FontWeight.w600),),
            ),
          ),
Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.cardcolor,
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  side: BorderSide(color: AppColors.white)
                ),
                onPressed: onPressed,icon:Image.asset(images), label: Text(title,style: TextStyle(fontWeight:FontWeight.w600,fontSize: 14,color: AppColors.white),)),
          )
        ],
      ),
    );
  }
}
// Send MAsseges
class SendMassagescard extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onPressed;
  const SendMassagescard({super.key, required this.image, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 353,
        height: 80,
        decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.yellowColor
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
              child: Container(

                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(image),
                ),
              ),
            ),
            Container(
              child:Text(text,style: TextStyle(color: AppColors.black,fontSize: 18,fontWeight:FontWeight.w600 ),),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),

                    )
                  ),
                  onPressed: onPressed, child: Text('Friends',style: TextStyle(color: AppColors.white,fontSize: 14,fontWeight: FontWeight.w600),)),
            )
          ],
        ),
      ),
    );
  }
}
