import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/news_channel_headlines_model.dart';
import 'package:news_app/view/view_model/news_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              "images/category_icon.png",
              height: 30,
              width: 30,
            )),
        title: Text(
          "News",
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * .55,
            width: width,
            child: 
            FutureBuilder<NewsChannelsHeadlinesModel>(future: newsViewModel.fetchNewsChannelHeadlinesApi(), builder: (BuildContext context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: 
                SpinKitCircle(
                  size: 50,color: Colors.blue,
                ),);
              }
              else {
               return ListView.builder(itemCount: snapshot.data!.articles!.length,itemBuilder: (context, index){
                return Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        child: CachedNetworkImage(imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(child: spinKit2,),
                        errorWidget:  (context, url, error) => Icon(Icons.error_outline,color:  Colors.red,),),
                      )
                    ],
                  ),
                );
               });
              }
            }),
          )
        ],
      ),
    );
  }

}

const spinKit2  = SpinKitFadingCircle(
  color: Colors.amber,
  size: 50,
);
