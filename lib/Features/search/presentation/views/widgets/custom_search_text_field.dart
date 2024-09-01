import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readify_book_store_app/Core/utils/styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onChanged});

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: const Color(0xffD6BD98),
      style: Styles.textStyle20.copyWith(
        color: const Color(0xffC9DABF),
      ),
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.2),
        filled: true,
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: Color(0xffC9DABF),
          fontSize: 20,
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Opacity(
            opacity: 0.5,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.all(18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xff808D7C),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xff5F6F65),
          ),
        ),
      ),
    );
  }
}
