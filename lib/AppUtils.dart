import 'package:flutter/material.dart';

showLoadingdialog(BuildContext context){
  showDialog(context: context, builder:   (context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  },);
}
hideLoadingdialog(BuildContext context){
  Navigator.pop(context);
}
showMessageDialog(BuildContext context, VoidCallback voidCallback){
  showDialog(context: context, builder:
    (context) {
      return Container(
        child: Column(
          children: [
            Text('Something went wrong'),
            TextButton(onPressed: voidCallback , child: Text(
              'Try again'
            ))
          ],
        ),
      );
    },);

}