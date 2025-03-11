import 'package:flutter/material.dart';

class CustomAppBar  {

  String? title = "";
  CustomAppBar({this.title});

  AppBar appBarFull() {
    return AppBar(
      backgroundColor: Colors.black,

      leading: IconButton(
        iconSize: 30.0,
        icon: const Icon(Icons.menu),
        color: Colors.white,
        onPressed: () {},
      ),

      title: Center(
          child: Text(
            title.toString(),
            style: const TextStyle(color: Colors.white),
          )),

      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(25.0),
        child: Icon(
          Icons.linear_scale,
          color: Colors.white,
          size: 35.0,
        ),
      ),

      actions: const <Widget>[
        Icon(
          Icons.shopping_basket,
          size: 30.0,
          color: Colors.white,
        ),
      ],

      elevation: 5.0,
    );
  }

  AppBar appBarLeading() {
    return AppBar(
      backgroundColor: Colors.black,

      leading: IconButton(
        iconSize: 30.0,
        icon: const Icon(Icons.menu),
        color: Colors.white,
        onPressed: () {},
      ),

      title: Center(
          child: Text(
            title.toString(),
            style: const TextStyle(color: Colors.white),
          )),

      elevation: 5.0,
    );
  }

  AppBar appBarAction() {
    return AppBar(
      backgroundColor: Colors.black,

      title: Center(
          child: Text(
            title.toString(),
            style: const TextStyle(color: Colors.white),
          )),

      actions: const <Widget>[
        Icon(
          Icons.shopping_basket,
          size: 30.0,
          color: Colors.white,
        ),
      ],

      elevation: 5.0,
    );
  }

  AppBar appBarTitle() {
    return AppBar(
      backgroundColor: Colors.orange,

      title: Text(
        title.toString(),
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),

      elevation: 5.0,
    );
  }

}
