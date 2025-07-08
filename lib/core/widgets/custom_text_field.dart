import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  // const CustomTextField({super.key});

  final String hintText;
  // final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    // required this.controller,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        // controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff9EA2AE),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xff9EA2AE),
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xffE5E7EA),
              width: 1.5,
            ),
          ),
          fillColor: const Color(0xffF9FAFB),
          filled: true,
        ),
      ),
    );
  }
}



// TextFormField(
//                                 decoration: InputDecoration(
//                                   hintText: 'Nome',
//                                   hintStyle: TextStyle(
//                                     fontFamily: 'Inter',
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color(0xff9EA2AE),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: BorderSide(
//                                       color: Color(0xff9EA2AE),
//                                       width: 1.5,
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: BorderSide(
//                                       color: Color(0xffE5E7EA),
//                                       width: 1.5,
//                                     ),
//                                   ),
//                                   fillColor: Color(0xffF9FAFB),
//                                   filled: true,
//                                 ),
//                               ),