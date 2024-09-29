import 'package:flutter/material.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/text_style.dart';

class TextFieldWidget extends StatelessWidget
{
  final TextEditingController controller;
  final Function(String) onSearch;
  const TextFieldWidget({super.key,
    required this.controller,
    required this.onSearch,
  });
  @override
  Widget build(BuildContext context) {
   return  TextField(
     decoration: InputDecoration(
       border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(30),
           borderSide: BorderSide(color: AppColors.white)
       ),
       enabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(30),
         borderSide: BorderSide(color: AppColors.white),
       ),
       focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(30),
         borderSide: BorderSide(color: AppColors.white),
       ),
       fillColor: AppColors.grey.withOpacity(.58),
       filled: true,
       prefixIcon:
       IconButton(icon:const Icon(Icons.search),
         color: Colors.white,
       onPressed:(){
        onSearch(controller.text);
       } ,),
       hintText: 'search',
       hintStyle: TextStyleApp.font14weight400colorWhite,

     ),
     controller: controller,
     style: const TextStyle(color: Colors.white),

   );
  }

}