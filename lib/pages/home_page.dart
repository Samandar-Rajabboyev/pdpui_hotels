import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdpui_hotels/generated/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // #header
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesIcHeader),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.4),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // #titleofheader
                    const Text(
                      'Best Hotels Ever',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    // #search
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      height: 50,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "Search for hotels...",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // #body
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...(makeGroup(
                    title: "Business Hotels",
                    list: [
                      {"image": Assets.imagesIcHotel1, "title": "Hotel 1"},
                      {"image": Assets.imagesIcHotel2, "title": "Hotel 2"},
                      {"image": Assets.imagesIcHotel3, "title": "Hotel 3"},
                      {"image": Assets.imagesIcHotel4, "title": "Hotel 4"},
                      {"image": Assets.imagesIcHotel5, "title": "Hotel 5"},
                    ],
                  )),
                  ...(makeGroup(
                    title: "Airport Hotels",
                    list: [
                      {"image": Assets.imagesIcHotel3, "title": "Hotel 1"},
                      {"image": Assets.imagesIcHotel2, "title": "Hotel 2"},
                      {"image": Assets.imagesIcHotel1, "title": "Hotel 3"},
                      {"image": Assets.imagesIcHotel4, "title": "Hotel 4"},
                      {"image": Assets.imagesIcHotel5, "title": "Hotel 5"},
                    ],
                  )),
                  ...(makeGroup(
                    title: "Resort Hotels",
                    list: [
                      {"image": Assets.imagesIcHotel5, "title": "Hotel 1"},
                      {"image": Assets.imagesIcHotel4, "title": "Hotel 2"},
                      {"image": Assets.imagesIcHotel3, "title": "Hotel 3"},
                      {"image": Assets.imagesIcHotel1, "title": "Hotel 4"},
                      {"image": Assets.imagesIcHotel2, "title": "Hotel 5"},
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List makeGroup({required String title, required List list}) {
    return [
      Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
      ),
      const SizedBox(height: 30),
      Container(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, i) {
            return makeItem(image: list[i]['image'], title: list[i]['title']);
          },
        ),
      ),
      const SizedBox(height: 20),
    ];
  }

  Widget makeItem({required String image, required String title}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
