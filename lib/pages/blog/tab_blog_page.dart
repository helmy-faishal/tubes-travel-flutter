import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_travel_flutter/pages/blog/blog_card.dart';
import 'package:tubes_travel_flutter/provider/blog_provider.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({ Key? key }) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage>{

  @override
  Widget build(BuildContext context) {
    
    BlogProvider blogProvider = Provider.of<BlogProvider>(context);

    Widget listBlog(String kategori){
      blogProvider.kategori = kategori;
      blogProvider.getDestination();
      return ListView(
        shrinkWrap: true, 
        children: blogProvider.destination.map((destinasi) => BlogCard(data: destinasi,)).toList(),
      );
    }

    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Blog"),
            centerTitle: true,
            bottom: const TabBar(
              tabs:  [
                Tab(icon: Icon(Icons.nature),text: 'Wisata Alam',),
                Tab(icon: Icon(Icons.dining),text: 'Kuliner',),
                Tab(icon: Icon(Icons.house),text: 'Hotel',),
                Tab(icon: Icon(Icons.flare),text: 'Hiburan',)
              ],
            ),
          ),
          body: TabBarView(
            children: [
              listBlog('alam'),
              listBlog('kuliner'),
              listBlog('hotel'),
              listBlog('hiburan'),
            ]
          ),
        )
      )
    );
  }
}

class BlogAlam extends StatelessWidget {
  const BlogAlam({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlogProvider blogProvider = Provider.of<BlogProvider>(context,listen:false);
    blogProvider.kategori = 'alam';
    blogProvider.getDestination();

    return Scaffold(
      body: ListView(
        shrinkWrap: true, 
        children: blogProvider.destination.map((destinasi) => BlogCard(data: destinasi,)).toList(),
      )
    );
  }
}

class BlogKuliner extends StatelessWidget {
  const BlogKuliner({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlogProvider blogProvider = Provider.of<BlogProvider>(context,listen: false);
    blogProvider.kategori = 'kuliner';
    blogProvider.getDestination();

    return Scaffold(
      body: ListView(
        shrinkWrap: true, 
        children: blogProvider.destination.map((destinasi) => BlogCard(data: destinasi,)).toList(),
      )
    );
  }
}

class BlogHotel extends StatelessWidget {
  const BlogHotel({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlogProvider blogProvider = Provider.of<BlogProvider>(context,listen:false);
    blogProvider.kategori = 'hotel';
    blogProvider.getDestination();

    return Scaffold(
      body: ListView(
        shrinkWrap: true, 
        children: blogProvider.destination.map((destinasi) => BlogCard(data: destinasi,)).toList(),
      )
    );
  }
}

class BlogHiburan extends StatelessWidget {
  const BlogHiburan({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlogProvider blogProvider = Provider.of<BlogProvider>(context,listen:false);
    blogProvider.kategori = 'hiburan';
    blogProvider.getDestination();

    return Scaffold(
      body: ListView(
        shrinkWrap: true, 
        children: blogProvider.destination.map((destinasi) => BlogCard(data: destinasi,)).toList(),
      )
    );
  }
}