import 'package:flutter/material.dart';
import 'package:flutter_ahmenes_application/fucntions/current_date.dart';
import 'package:flutter_ahmenes_application/fucntions/date_randomizer.dart';
import 'package:flutter_ahmenes_application/models/api_fetch.dart';
import 'package:flutter_ahmenes_application/widgets/fullscreen_show.dart';
import 'package:flutter_ahmenes_application/widgets/loading_animation.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class HomeScreenContentPage extends StatefulWidget {
  const HomeScreenContentPage({super.key});

  @override
  State<HomeScreenContentPage> createState() => _HomeScreenContentPageState();
}

class _HomeScreenContentPageState extends State<HomeScreenContentPage> {
  late Future<Apod> futureApod;
  DateTime selectedDate = DateTime.now();
  String? _result;

  Future<String?> _getFileType(String url) async {
    final response = await http.head(Uri.parse(url));

    return response.headers['content-type'];
  }

  Future<String> fileTypo(String url) async {
    final mimeType = await _getFileType(url);

    setState(() {
      _result = mimeType;
    });

    return '';
  }

  @override
  void initState() {
    super.initState();
    updateData();
    print(currentDate());
    futureApod = fetchApod(currentDate());
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        updateData();
        futureApod = fetchApod(DateFormat('yyyy-MM-dd').format(selectedDate));
      });
    }
  }

  bool isLoading = false;

  void loadData() {
    // Simulating data loading process
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
    print('After setState: $isLoading');
  }

  void updateData() {
    setState(() {
      isLoading = true;
      loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Center(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage('assets/images/image 13.jpg'),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Astronomy',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1,
                              letterSpacing: 3.0,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Picture of a Day',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              height: 1,
                              letterSpacing: 3.0,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/image 10.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                      height: 40,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(181, 58, 57, 57),
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: ImageIcon(
                                AssetImage('assets/icons/calendar_clock.png'),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                size: 30,
                              ),
                              onPressed: () => _selectDate(context),
                            ),
                            IconButton(
                              icon: ImageIcon(
                                AssetImage('assets/icons/calendar.png'),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                size: 30,
                              ),
                              onPressed: () => setState(() {
                                updateData();
                                futureApod = fetchApod(getRandomDate());
                              }),
                            ),
                            IconButton(
                              icon: ImageIcon(
                                AssetImage('assets/icons/early_on.png'),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                size: 30,
                              ),
                              onPressed: () => setState(() {
                                updateData();
                                print(currentDate());
                                futureApod = fetchApod(currentDate());
                              }),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  isLoading
                      ? loadAnim(context)
                      : FutureBuilder<Apod>(
                          future: futureApod,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              fileTypo(snapshot.data!.url!);
                              print(_result);
                              print(_result ==
                                  "text/html; charset=utf-8" as String?);
                              return SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return _result ==
                                                            "text/html; charset=utf-8"
                                                        ? ImageFullScreenWrapperWidget(
                                                            child: Image(
                                                            image: NetworkImage(
                                                                snapshot.data!
                                                                    .thumbnailUrl!),
                                                          ))
                                                        : ImageFullScreenWrapperWidget(
                                                            child: Image(
                                                            image: NetworkImage(
                                                                snapshot.data!
                                                                    .url!),
                                                          ));
                                                  }));
                                                },
                                                child: Container(
                                                  width: size.width * 0.8,
                                                  height: size.height * 0.4,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image: _result ==
                                                                  "text/html; charset=utf-8"
                                                              ? NetworkImage(
                                                                  snapshot.data!
                                                                      .thumbnailUrl!)
                                                              : NetworkImage(
                                                                  snapshot.data!
                                                                      .url!),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: size.width * 0.8,
                                      child: Wrap(
                                        children: [
                                          Text(
                                            snapshot.data!.title!,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              height: 1,
                                              letterSpacing: 3.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: size.width * 0.8,
                                      child: Wrap(
                                        children: [
                                          Text(
                                            snapshot.data!.date!,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 21,
                                              color: Colors.white,
                                              height: 1,
                                              letterSpacing: 3.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: size.width * 0.8,
                                      child: Wrap(
                                        children: [
                                          Text(
                                            snapshot.data!.explanation!,
                                            textAlign: TextAlign.justify,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              height: 1,
                                              letterSpacing: 1.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                            // By default, show a loading spinner.
                            return Text('');
                          },
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
