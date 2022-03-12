import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback onPressed;

  const SearchWidget(
      {Key? key, required this.textEditingController, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textEditingController,
          decoration: const InputDecoration(
            fillColor: Colors.white60,
            hintText: 'Enter City Name Here',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 3.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('Search City'),
        ),
      ],
    );
  }
}
