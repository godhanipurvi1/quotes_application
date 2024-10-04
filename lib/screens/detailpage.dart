import 'package:flutter/material.dart';

import 'list.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextStyle _textStyle = TextStyle(fontFamily: 'DefaultFont');

  List<Color> myColors = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.brown,
    Colors.grey,
    Colors.teal,
    Colors.indigo,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.lime,
    Colors.cyan,
    Colors.amber,
  ];

  Color? textcolor = Colors.black; // Text color
  Color? selected; // Selected text color
  Color? bgcolor = Colors.white; // Background color
  Color? bgselected;

  String? selectedKey;

  @override
  Widget build(BuildContext context) {
    final Map quote = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Back',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFBDB8B8), // Light Gray
                      offset: Offset(0, 4),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                  color: bgcolor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quote['quote'] ?? '',
                        style: _textStyle.copyWith(
                            color: textcolor ?? Colors.black),
                      ),
                      Spacer(),
                      Text(
                        "- ${quote['author'] ?? ''}",
                        style: _textStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textcolor ?? Colors.black,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Change textstyle'),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _textStyle = TextStyle(fontFamily: 'Hello');
                    });
                  },
                  child: Text(
                    "ABC",
                    style: TextStyle(fontFamily: 'Lostar'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _textStyle = TextStyle(fontFamily: 'Meglona');
                    });
                  },
                  child: Text(
                    "ABC",
                    style: TextStyle(fontFamily: 'Meglona'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _textStyle = TextStyle(fontFamily: 'TIMESS_');
                    });
                  },
                  child: Text(
                    "ABC",
                    style: TextStyle(fontFamily: 'TIMESS__'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _textStyle = TextStyle(fontFamily: 'Philosopher');
                    });
                  },
                  child: Text(
                    "ABC",
                    style: TextStyle(fontFamily: 'Philosopher'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('Change Text Color'),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: myColors.map((e) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = selected == e ? null : e; // Toggle selection
                        textcolor = selected; // Update text color
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: e,
                            ),
                          ),
                          if (selected == e)
                            Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(color: Colors.black),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10),
            Text('Change Background Color'),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: myColors.map((e) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        bgselected =
                            bgselected == e ? null : e; // Toggle selection
                        bgcolor = bgselected ??
                            Colors.white; // Update background color
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: e,
                            ),
                          ),
                          if (bgselected == e)
                            Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(color: Colors.black),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(height: 10),
            Text('Change background'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: img.map((ele) {
                  return Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      ele,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
