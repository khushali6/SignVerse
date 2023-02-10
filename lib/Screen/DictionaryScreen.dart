import 'package:flutter/material.dart';
import 'package:ssip_signverse_project/Screen/AlphaBateScreens/CardPage.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});
  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Center(
            child: Text("What Would You",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 25,
                    color: Color(0xff4339E7),
                    fontWeight: FontWeight.bold)),
          ),
          const Center(
            child: Text("like to learn ?",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 25,
                    color: Color(0xff4339E7),
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 10,
          ),
          // Center(
          //   child: Container(
          //     width: 300,
          //     decoration: const BoxDecoration(
          //       color: Color(0xff4339E7),
          //     ),
          //     height: 1,
          //     child: Text(''),
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.only(
              left: 23,
              top: 50,
              bottom: 20,
            ),
            child: Text(
              "AlphaBatical",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  fontSize: 19,
                  color: Color(0xff777777)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 9,
            ),
            child: HorizontalScrollCard(),
          ),
        ],
      ),
    );
  }
}

class HorizontalScrollCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardsData = [
      {
        'title': 'A',
        'img': 'assets/imgs/A.png',
        'Link': '/A',
        'data': [
          {'name': 'All', 'link': 'https://youtu.be/GnyTLk-xwk8'},
          {'name': 'All1', 'link': 'https://youtu.be/GnyTLk-xwk8'},
        ]
      },
      {
        'title': 'B',
        'img': 'assets/imgs/B.png',
        'Link': '/B',
        'data': [
          {'name': 'All', 'link': '123.com'},
          {'name': 'All', 'link': '123.com'},
        ]
      },
      {
        'title': 'C',
        'img': 'assets/imgs/C.png',
        'Link': '/C',
      },
      {
        'title': 'D',
        'img': 'assets/imgs/D.png',
        'Link': '/D',
      },
      {
        'title': 'E',
        'img': 'assets/imgs/E.png',
        'Link': '/E',
      },
      {
        'title': 'F',
        'img': 'assets/imgs/F.png',
        'Link': '/F',
      },
      {
        'title': 'G',
        'img': 'assets/imgs/G.png',
        'Link': '/G',
      },
      {
        'title': 'H',
        'img': 'assets/imgs/H.png',
        'Link': '/H',
      },
      {
        'title': 'I',
        'img': 'assets/imgs/I.png',
        'Link': '/I',
      },
      {
        'title': 'J',
        'img': 'assets/imgs/J.png',
        'Link': '/J',
      },
      {
        'title': 'K',
        'img': 'assets/imgs/K.png',
        'Link': '/K',
      },
      {
        'title': 'L',
        'img': 'assets/imgs/L.png',
        'Link': '/L',
      },
      {
        'title': 'M',
        'img': 'assets/imgs/M.png',
        'Link': '/M',
      },
      {
        'title': 'N',
        'img': 'assets/imgs/N.png',
        'Link': '/N',
      },
      {
        'title': 'O',
        'img': 'assets/imgs/O.png',
        'Link': '/O',
      },
      {
        'title': 'P',
        'img': 'assets/imgs/P.png',
        'Link': '/P',
      },
      {
        'title': 'Q',
        'img': 'assets/imgs/Q.png',
        'Link': '/Q',
      },
      {
        'title': 'R',
        'img': 'assets/imgs/R.png',
        'Link': '/R',
      },
      {
        'title': 'S',
        'img': 'assets/imgs/S.png',
        'Link': '/S',
      },
      {
        'title': 'T',
        'img': 'assets/imgs/T.png',
        'Link': '/T',
      },
      {
        'title': 'U',
        'img': 'assets/imgs/U.png',
        'Link': '/U',
      },
      {
        'title': 'V',
        'img': 'assets/imgs/V.png',
        'Link': '/V',
      },
      {
        'title': 'W',
        'img': 'assets/imgs/W.png',
        'Link': '/W',
      },
      {
        'title': 'X',
        'img': 'assets/imgs/X.png',
        'Link': '/X',
      },
      {
        'title': 'Y',
        'img': 'assets/imgs/Y.png',
        'Link': '/Y',
      },
      {
        'title': 'Z',
        'img': 'assets/imgs/Z.png',
        'Link': '/Z',
      }
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: cardsData.map((card) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CardPage(
                          title: card['title'],
                          image: card['img'],
                          description: card['data'])),
                );

              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: 170,
                height: 220,
                decoration: BoxDecoration(
                  color: Color(0xff4339E7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 170,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Hero(
                          tag: "${card['title']}", child: Image.asset(card['img'])),
                    ),
                    SizedBox(height: 10),
                    Text(
                      card['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
