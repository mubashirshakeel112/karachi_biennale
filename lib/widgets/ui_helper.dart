// import 'package:flutter/material.dart';
// import 'package:karachi_biennale/constants/strings.dart';
//
// class UiHelper{
//   static artistRow(BuildContext context){
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 22, top: 25, bottom: 44),
//         child: Row(
//           spacing: 20,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: 128,
//               child: Column(
//                 children: [
//                   Image.asset(Strings.artistImage1, fit: BoxFit.cover, width: 128, height: 124,),
//                   SizedBox(height: 16,),
//                   Text("Muhammad Furqan Ali", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge,),
//                 ],
//               ),
//             ),SizedBox(
//               width: 128,
//               child: Column(
//                 children: [
//                   Image.asset(Strings.artistImage2, fit: BoxFit.cover, width: 128, height: 124,),
//                   SizedBox(height: 16,),
//                   Text("Alice Kurman", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge,),
//                 ],
//               ),
//             ),SizedBox(
//               width: 128,
//               child: Column(
//                 children: [
//                   Image.asset(Strings.artistImage4, fit: BoxFit.cover, width: 128, height: 124,),
//                   SizedBox(height: 16,),
//                   Text("Izhan mushaqa", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge,),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   static showSnackBar({required BuildContext context,required Text text, required Color bgColor}){
//     return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: text, backgroundColor: bgColor, duration: Duration(seconds: 3),));
//   }
// }