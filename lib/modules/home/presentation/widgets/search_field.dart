import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
    required this.onChangeText,
  }) : super(key: key);

  final ValueSetter<String?> onChangeText;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  InputBorder get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.0),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 47, 14, 104),
          width: 2,
        ),
      );

  @override
  Widget build(BuildContext context) => TextField(
        onChanged: widget.onChangeText,
        decoration: InputDecoration(
          focusedBorder: border,
          errorBorder: border,
          enabledBorder: border,
          hintText: AppLocalizations.of(context)!.searchProduct,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 47, 14, 104),
            fontWeight: FontWeight.bold,
          ),
          border: border,
        ),
      );
}
