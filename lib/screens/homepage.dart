import 'package:flutter/material.dart';

import 'list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fromKey = GlobalKey<FormState>();
  bool isicon = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isicon = !isicon;
                });
              },
              icon: Icon(isicon ? Icons.grid_view : Icons.list))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: isicon
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 2),
                    itemCount: allQuoteData.length,
                    itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'detailpage',
                                  arguments: allQuoteData[index]);
                            },
                            child: Column(children: [
                              Text(
                                '" ${allQuoteData[index]['quote']} "',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                '- ${allQuoteData[index]['author']}',
                                style: TextStyle(
                                    fontSize: 14, fontStyle: FontStyle.italic),
                              ),
                            ]),
                          ),
                        )),
                  )
                : ListView.builder(
                    itemCount: allQuoteData.length,
                    itemBuilder: (context, index) {
                      final quote = allQuoteData[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text(
                          '"${quote['quote']}"',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3, // Limit to 3 lines for quotes
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '- ${quote['author']}',
                          style: TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                      );
                    })),
      ),
    );
  }
}
