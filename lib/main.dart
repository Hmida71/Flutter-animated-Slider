import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'Pages/box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;
  dynamic _selectedIndex = {};

  final CarouselController _carouselController = CarouselController();

  final List<dynamic> _products = [
    {
      'title': 'Originals Photooos \n 4k FHD',
      'image':
          'https://images.unsplash.com/photo-1639171430793-544183b40ab2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
      'description': '@Hmida71'
    },
    {
      'title': 'Originals Photooos \n 4k FHD',
      'image':
          'https://images.unsplash.com/photo-1639153519880-d78f6404abe0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      'description': '@Hmida71'
    },
    {
      'title': 'Originals Photooos \n 4k FHD',
      'image':
          'https://images.unsplash.com/photo-1639186063408-0808bb3e1dc6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
      'description': '@Hmida71'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _selectedIndex.length > 0
            ? FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.purple,
                child: const Icon(
                  Icons.arrow_forward_ios,
                ),
              )
            : null,
        // appBar: AppBar(
        //   elevation: 0,
        //  centerTitle:true,
        //   backgroundColor: Colors.transparent,
        //   title: const Text(
        //     'Slider Master @Hmida71',
        //     style: TextStyle(
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red,
              child: Image.network(
                _products[_current]['image'],
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // width: double.infinity,
              // height: double.infinity,
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 80),
              child: CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                      height: 450.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.70,
                      enlargeCenterPage: true,
                      pageSnapping: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                          //print(index);
                        });
                      }),
                  items: _products.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedIndex == movie) {
                                _selectedIndex = {};
                              } else {
                                _selectedIndex = movie;
                              }
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: _selectedIndex == movie
                                    ? Border.all(
                                        color: Colors.purple.shade500, width: 3)
                                    : null,
                                boxShadow: _selectedIndex == movie
                                    ? [
                                        BoxShadow(
                                            color: Colors.blue.shade100,
                                            blurRadius: 30,
                                            offset: Offset(0, 10))
                                      ]
                                    : [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 20,
                                            offset: Offset(0, 5))
                                      ]),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 320,
                                    margin: const EdgeInsets.all(10),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.network(movie['image'],
                                        fit: BoxFit.cover),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    movie['title'],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    movie['description'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList()),
            ),
          ],
        ));
  }
}
