import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_with_restapi/models/news_channel_headlines_model.dart';
import 'package:news_app_with_restapi/view/news_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();
  // final format = DateFormat('MMMM dd,yyyy');

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(onPressed: (){},
            icon: Image.asset('images/category_icon.png',height: 30,width: 30,),),
        title: Text('News',
          style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w700),),
      ),
      body: ListView(
        children: [
          Container(
            height: height * .55,
            width: width,
            child: FutureBuilder<NewsChannelsHeadlinesModel>(
                future: newsViewModel.fetchNewsChannelHeadlinesApi(),
                builder: (BuildContext context,snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: SpinKitCircle(
                          size: 50,
                          color: Colors.blue,
                        ),
                      );
                    }else{
    return ListView.builder(scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.articles!.length,

    itemBuilder: (context,index){
      DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
    return SizedBox(
    child: Stack(
    alignment: Alignment.center,
    children: [
    Container(
    child: ClipRRect(
      child: CachedNetworkImage(
      imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
        fit: BoxFit.cover,
        placeholder: (context,url)=> Container(child: spinKit2,),
        errorWidget: (context,url, error)=> Icon(Icons.error_outline,color: Colors.red,),
      
      
      ),borderRadius: BorderRadius.circular(15),
    ),height: height * 0.6,
      width: width*.9,
      padding: EdgeInsets.symmetric(horizontal: height*.02),
    ),
      Positioned(

        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),child: Container(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.7,
                child: Text(snapshot.data!.articles![index].toString(),

                  style: GoogleFonts.poppins(
                      fontSize: 17,fontWeight: FontWeight.w700),maxLines: 2,
                overflow: TextOverflow.ellipsis,),
              ),
              Spacer(),
              Container(
                child: Row(
                  children: [Text(snapshot.data!.articles![index].source!.name.toString(),

                    style: GoogleFonts.poppins(
                        fontSize: 17,fontWeight: FontWeight.w700),maxLines: 2,
                    overflow: TextOverflow.ellipsis,),
                    // Text(format.format(dateTime),
                    //
                    //   style: GoogleFonts.poppins(
                    //       fontSize: 17,fontWeight: FontWeight.w700),maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,),

                  ],
                ),width: width * 0.07,
              )
            ],
          ),alignment: Alignment.bottomCenter,
          height: height * .22,
        ),elevation: 5,
          color: Colors.white,
        ),
        bottom: 20,
      )
    
    ],
    ),
    );

    });


    }}
      ))]));
  }
}
const spinKit2 = SpinKitFadingCircle(color: Colors.amber,);