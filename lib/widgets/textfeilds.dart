import 'package:flutter/material.dart';

class textfeild extends StatelessWidget {
  var label;
  final String? Function(String?)? validator;

  textfeild({
    Key? key,
    required this.validator,
    required this.label,
    required this.controler,
  }) : super(key: key);

  final TextEditingController controler;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: size.height / 19),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 18,
            )),
        controller: controler,
        validator: validator,
      ),
    );
  }
}

class jobfiels extends StatelessWidget {
  var label;
  final String? Function(String?)? validator;

  jobfiels({
    Key? key,
    required this.validator,
    required this.label,
    required this.controler,
  }) : super(key: key);

  final TextEditingController controler;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: size.height / 19),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 18,
            )),
        controller: controler,
        validator: validator,
      ),
    );
  }
}

class jobfiels2 extends StatelessWidget {
  var label;
  final String? Function(String?)? validator;

  jobfiels2({
    Key? key,
    required this.validator,
    required this.label,
    required this.controler,
  }) : super(key: key);

  final TextEditingController controler;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: size.height / 19),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 18,
            )),
        controller: controler,
        validator: validator,
      ),
    );
  }
}
