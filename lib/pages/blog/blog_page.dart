import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tubes_travel_flutter/pages/blog/blog_card.dart';
import 'package:tubes_travel_flutter/pages/navigation/bottom_navbar.dart';
import 'package:tubes_travel_flutter/provider/blog_provider.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);


  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> { 

  String currentBlog = "alam";
  bool changeBlog = true;

  @override
  Widget build(BuildContext context) {

    BlogProvider blogProvider = Provider.of<BlogProvider>(context);

    Widget navigationScroll() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Color(0xffEED991),
            border: Border(bottom: BorderSide())
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 92,
                  height: 22,
                  decoration: BoxDecoration(
                    color: currentBlog=="alam"? Colors.blue:Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      "Wisata Alam",
                      style: TextStyle(
                        color: currentBlog=="alam"? Colors.white:Colors.black
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                    currentBlog = "alam";
                    changeBlog = true;
                  });
                  blogProvider.kategori = currentBlog;
                },
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 92,
                  height: 22,
                  decoration: BoxDecoration(
                    color: currentBlog=="kuliner"? Colors.blue:Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      "Kuliner",
                      style: TextStyle(
                        color: currentBlog=="kuliner"? Colors.white:Colors.black
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                    currentBlog = "kuliner";
                    changeBlog = true;
                  });
                  blogProvider.kategori = currentBlog;
                },
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 92,
                  height: 22,
                  decoration: BoxDecoration(
                    color: currentBlog=="hotel"? Colors.blue:Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      "Hotel",
                      style: TextStyle(
                        color: currentBlog=="hotel"? Colors.white:Colors.black
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                    currentBlog = "hotel";
                    changeBlog = true;
                  });
                  blogProvider.kategori = currentBlog;
                },
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 92,
                  height: 22,
                  decoration: BoxDecoration(
                    color: currentBlog=="hiburan"? Colors.blue:Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      "Hiburan",
                      style: TextStyle(
                        color: currentBlog=="hiburan"? Colors.white:Colors.black
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                    currentBlog = "hiburan";
                    changeBlog = true;
                  });
                  blogProvider.kategori = currentBlog;
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget listBlog(){
      return ListView(
        shrinkWrap: true, 
        children: blogProvider.destination.map((destinasi) => BlogCard(data: destinasi,)).toList(),
      );
    }

    if (changeBlog) {
      blogProvider.getDestination();
      setState(() {
        changeBlog = false;
      });
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Travel Blog'),
          centerTitle: true,
          // backgroundColor: const Color(0xffEED991),
          // foregroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            navigationScroll(),
            Expanded(child: listBlog()),
          ]
        ),
        bottomNavigationBar: const BottomNavbar(),
      ),
    );
  }
}