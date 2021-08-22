import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/counter.dart';
import 'bloc/anime_bloc.dart';
import 'detailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimeBloc(),
      child: Scaffold(
        backgroundColor: Color(0xFF7A9BEE),
        body: BlocBuilder<AnimeBloc, AnimeState>(
          builder: (context, state) {
            if (state is AnimeSuccess) {
              return Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                          Container(
                            width: 125.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.filter_list),
                                    color: Colors.white,
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(Icons.menu),
                                    color: Colors.white,
                                    onPressed: () {})
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.only(left: 40.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Anime',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 25.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height - 174.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(75.0)),
                        ),
                        child: ListView.builder(
                            itemCount: state.animeDto.data.documents.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
                                height: 120,
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => DetailPage(
                                                  heroTag: state
                                                      .animeDto
                                                      .data
                                                      .documents[index]
                                                      .coverImage,
                                                  title: state
                                                      .animeDto
                                                      .data
                                                      .documents[index]
                                                      .titles
                                                      .en,
                                                  score: state.animeDto.data
                                                      .documents[index].score
                                                      .toString(),
                                                  desc: state
                                                      .animeDto
                                                      .data
                                                      .documents[index]
                                                      .descriptions
                                                      .en,
                                                )));
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Image.network(state.animeDto.data
                                          .documents[index].coverImage),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              state
                                                      .animeDto
                                                      .data
                                                      .documents[index]
                                                      .titles
                                                      .en ??
                                                  "-",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              state
                                                      .animeDto
                                                      .data
                                                      .documents[index]
                                                      .descriptions
                                                      .en ??
                                                  "-",
                                              style: TextStyle(fontSize: 12),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 12,
                                                ),
                                                Text(
                                                  state
                                                          .animeDto
                                                          .data
                                                          .documents[index]
                                                          .score
                                                          .toString() ??
                                                      "-",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ],
                ),
              );
            } else if (state is AnimeLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AnimeInitial) {
              BlocProvider.of<AnimeBloc>(context).add(GetAnime());
            } else {
              return Center(
                child: Text("Oops sorry terjadi kesalahan"),
              );
            }
          },
        ),
      ),
    );
  }
}

// InkWell(
//   onTap: () {
//     Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => DetailPage(
//               heroTag: state.animeDto.data
//                   .documents[index].coverImage,
//               title: state.animeDto.data
//                   .documents[index].titles,
//               score: state.animeDto.data
//                   .documents[index].score
//                   .toString(),
//               desc: state.animeDto.data
//                   .documents[index].descriptions,
//             )));
//   },
// );
