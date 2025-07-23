import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';

class DialogBox {
  static showDialogBox({required BuildContext context,required VoidCallback onPressed}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.only(left: 20, right: 20),
          contentPadding: EdgeInsets.only(left: 32.5, right: 32.5, top: 20, bottom: 25),
          actionsPadding: EdgeInsets.zero,
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset( Strings.questionCircleIcon,
                width: 98,
                height: 98,
              ),
              SizedBox(height: 13),
              Text("Are you sure?", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20)),
              SizedBox(height: 13),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 74,
                      decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
                      child: Center(
                        child: Text("No", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 25)),
                      ),
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 90,
                  child: Container(
                    // width: 74,
                    height: 74,
                    decoration: BoxDecoration(border: Border.all(width: 1, color: Color(0xFFEAEAEA))),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: onPressed,
                    child: Container(
                      height: 74,
                      decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
                      child: Center(
                        child: Text("Yes", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 25)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
