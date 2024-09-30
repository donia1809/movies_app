import 'package:flutter/material.dart';
import 'package:movies_app/core/theming/text_style.dart';

showLoadingDialog(BuildContext context){
  showDialog(context: context, builder:   (context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  },);
}
hideLoadingDialog(BuildContext context){
  Navigator.pop(context);
}
showMessageDialog(BuildContext context, VoidCallback voidCallback){
  showDialog(context: context, builder:
    (context) {
      return Column(
        children: [
           Text('Something went wrong',style: TextStyleApp.font16weight400colorWhite,),
          TextButton(onPressed: voidCallback ,
              child:  Text(
            'Try again',style: TextStyleApp.font16weight400colorWhite,
          ))
        ],
      );
    },);

}