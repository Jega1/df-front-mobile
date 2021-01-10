import 'package:dog_face/appColors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor.withOpacity(0.1)),
            child: TextField(
                decoration:
                    InputDecoration.collapsed(hintText: 'search veterinaire'))),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
              icon: Icon(Icons.search, color: secondColor),
              onPressed: () {},
              padding: EdgeInsets.symmetric(horizontal: 10)),
        )
      ],
    );
  }
}

//https://www.youtube.com/watch?v=stNC-6nIskU&t=1s
