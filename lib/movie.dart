import 'package:flutter/material.dart';
import 'package:movieapps/show1.dart';
import 'package:movieapps/models/movies.dart';
import 'package:movieapps/ticketpage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'purchase.dart';
import 'movie.dart'; 
import 'dart:async';
import 'package:intl/intl.dart'; 

class Movie {
  final String name;
  final String releaseDate;
  final String posterUrl;
  final String short;
  final String cinema;
  final String time;
  final String subcinema;
  final String subshowtime;
  final String rate;
  final String Genres;
  final String voice;
  final String showtime;
  final List<String> purchasedTickets;

  Movie({
    required this.name,
    required this.releaseDate,
    required this.posterUrl,
    required this.short,
    required this.cinema,
    required this.time,
    required this.subcinema,
    required this.subshowtime,
    required this.rate,
    required this.Genres,
    required this.voice,
    required this.showtime,
    this.purchasedTickets = const [],
  });
}

class CinemaApp extends StatefulWidget {
  @override
  _CinemaAppState createState() => _CinemaAppState();
}

class _CinemaAppState extends State<CinemaApp> {
  int _currentIndex = 0;

  Movie? selectedMovie;

  final List<Movie> movies = [
    Movie(
      name: 'Lahn-Mah',
      releaseDate: '2022-04-04',
      posterUrl: 'https://lh3.googleusercontent.com/pEXQ13Y_gC-OPK1A5qACt2TQpGOD0-SUb-dr4FrMI0Q97QAx_6Ib3gc38lJHsr8AT0Sn8I3Muh4IIRI8rrW16SemgNfGJPWBPAc=w260',
      short: 'เอ็ม (บิวกิ้น-พุฒิพงศ์ อัสสรัตนกุล) ตัดสินใจดร็อปเรียนตอนปีสี่ เพื่อมาเอาดีทางการเป็นนักแคสต์เกม แต่ทํายังไงก็ไม่รุ่ง เอ็มเลยคิดจะรวยด้วยการทํางานสบายๆ แบบ มุ่ย (ตู-ต้นตะวัน ตันติเวชกุล) ลูกพี่ลูกน้อง ที่รับดูแลอากงที่ป่วยระยะสุดท้าย จนกลายเป็นทายาทคนเดียวที่ได้รับมรดกเป็นบ้านราคากว่าสิบล้าน เส้นทางการเป็น เศรษฐีรออยู่ตรงหน้า เอ็มจึงอาสาไปดูแล อาม่า (แต๋ว-อุษา เสมคำ) ที่ตรวจพบว่าเป็นมะเร็ง และน่าจะมีชีวิตอยู่ได้อีกไม่เกินปี โดยหวังจะได้มรดกหลักล้านเช่นกัน เมื่อหลานกับม่าที่อายุห่างกันกว่า 50 ปี ต้องมาอยู่ร่วมกัน การต่อปากต่อคําจึงเกิดขึ้นในทุกโมเมนต์ แต่มันกลับ เป็นช่วงเวลาที่ทําให้อาม่าลืมเหงา จากการเฝ้ารอลูกชายคนโตอย่าง กู๋เคี้ยง (ดู๋-สัญญา คุณากร) ลูกสาวคนกลาง อย่าง แม่ของเอ็ม (เจีย-สฤญรัตน์ โทมัส) และลูกชายคนเล็กอย่าง กู๋โส่ย (เผือก-พงศธร จงวิลาส) ที่จะมาพร้อมหน้ากันตามเทศกาลต่างๆ เท่านั้น ไม่น่าเชื่อว่างานที่เริ่มต้นทําเพราะหวังรวย จะทําให้คนห่วยๆ อย่างเอ็มได้รู้ว่า คําว่า “ครอบครัว” มีค่ามากกว่าเงิน ',
      cinema: 'SCREEN 1',
      time: '125min',
      rate: 'Rate:G',
      Genres: 'Family',
      voice:'TH SUB:ENG',
      showtime: '10:00 , 12:45 ,14:30 , 16:15 , 19:00 ,21:45 ,23:30',
      subcinema: 'Screen 4',
      subshowtime: '21:00',
    ),
    Movie(
      name: 'Fall Guy',
      releaseDate: '2024-04-25',
      posterUrl: 'https://lh3.googleusercontent.com/KKvq6ZQlv44NCsNTpRIP1ccvma52DVyOW8aoS-f3H0acUkMlGI2OGEnpQEra5KAGUPJWNWJvVbRRNBejmgQd2NByE6BEKXMf8w=w260',
      short: 'He’s a stuntman, and like everyone in the stunt community, he gets blown up, shot, crashed, thrown through windows and dropped from the highest of heights, all for our entertainment. And now, fresh off an almost career-ending accident, this working-class hero has to track down a missing movie star, solve a conspiracy and try to win back the love of his life while still doing his day job. What could possibly go right?',
      cinema: 'SCREEN 2',
      time: '130min',
      rate: 'Rate:13',
      Genres: 'Genre: Action, Adventure',
      voice:'ENG SUB: ENG/TH',
      showtime: '11:00 , 14:00 ,17:00 , 20:00',
      subcinema: '',
      subshowtime: '',
    ),
    Movie(
      name: 'Abigail',
      releaseDate: '2024-04-18',
      posterUrl: 'https://lh3.googleusercontent.com/9YOx_u27B7oLY_0vtKh8YyXfyhVSQ-dfvvWR-qIFOaIz1yghBJIfyrWZ_YSnE3oXZeMJxkTKejoA6yo-b3sGPl4HiXDLCMbMQw=w260',
      short: 'After a group of would-be criminals kidnap the 12-year-old ballerina daughter of a powerful underworld figure, all they have to do to collect a 50 million dollars ransom is watch the girl overnight. In an isolated mansion, the captors start to dwindle, one by one, and they discover, to their mounting horror, that they’re locked inside with no normal little girl.  ',
      cinema: 'SCREEN 3',
      time: '110min',
      rate: 'Rate:15',
      Genres: 'Genre: Horror, Mystery',
      voice:'ENG SUB:TH',
      showtime: '10:50 , 14:00 , 16:30 , 21:40',
      subcinema: '',
      subshowtime: '',
    ),
    Movie(
      name: 'Civil War',
      releaseDate: '2024-04-11',
      posterUrl: 'https://lh3.googleusercontent.com/RGo4rGprq-Y7WxBekmnsDqtU-yfEwv8YnX72lzOtipW2_aUuWYYVmEAp7_49V4L0S4y_vxp0uTlXRoSpN6j_KWOzgmOqNk5HWQ=w260',
      short: 'In the near future, a group of war journalists attempt to survive while reporting the truth as the United States stands on the brink of civil war.',
      cinema: 'SCREEN 4',
      time: '110min',
      rate: 'Rate:15',
      Genres: 'Genre: Action',
      voice:'ENG SUB:TH',
      showtime: '10:30 , 13:30 , 18:50 ,21:20',
      subcinema: '',
      subshowtime: '',
    ),
    Movie(
      name: 'Apirl, Come she will',
      releaseDate: '2024-04-11',
      posterUrl: 'https://lh3.googleusercontent.com/X_Sfi1TorlKT2t43oKvfAmDLAQ1HWnndXqDFrVS9zlJ-w7gylI0jxz47f29aFG_wsULci1Lk_IisuiSDm2oDyd0dOahC0Ijfpdw=w260',
      short: 'Shun Fujishiro is a psychiatrist and works at a university hospital in Tokyo. He is engaged to Yayoi Sakamoto. One day in April, when he is about to marry Yayoi Sakamoto, he receives a letter from his first love Haru Iyoda. They dated 10 years ago. Suddenly, his fiancé Yayoi Sakamoto disappears.',
      cinema: 'SCREEN 5',
      time: '110 min',
      rate: 'Rate:G',
      Genres: 'Drama, Romantic',
      voice:'JP SUB:TH',
      showtime: '11:00 , 13:40 , 16:20 ,19:30 , 21:10',
      subcinema: '',
      subshowtime: '',
    ),
    Movie(
      name: 'Ghostbuster : Frozen Empire',
      releaseDate: '2024-04-11',
      posterUrl: 'https://lh3.googleusercontent.com/VHAbmlB40oIwqa9FCtunPPIIJeieEAzXrihPJSB85s_97ZRdpsd4YTZ5y2_RINSTtICZ2m_dYFHqdLNaazNBnDTSF2K3QRdKaA=w260',
      short: 'The Spengler family returns to where it all started – the iconic New York City firehouse – to team up with the original Ghostbusters, who developed a top-secret research lab to take busting ghosts to the next level. But when the discovery of an ancient artifact unleashes an evil force, Ghostbusters new and old must join forces to protect their home and save the world from a second Ice Age.',
      cinema: 'SCREEN 6',
      time: '115min',
      rate: 'Rate:G',
      Genres: 'Genre: Adventure, Comedy, Fantasy',
      voice:'ENG SUB:TH',
      showtime: '10:45 , 13:00 , 15:45 ,17:30 , 19:15',
      subcinema: '',
      subshowtime: '',
    ),
  ];

  final List<Widget> _pages = [
    CinemaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grand Screenrama',
      home: Scaffold(
        appBar: 
          AppBar(
          backgroundColor: Color.fromARGB(255, 63, 63, 63),
          title: Center(
            child: Image.asset(
              'assets/logo_grand_normal.png',
              width: 100, // Adjust the width as needed
              height: 100, // Adjust the height as needed
              // You can also use other constructors like AssetImage, NetworkImage, etc., based on your image source
            ),
          ),
          centerTitle: true,
          actions: [],
        ),
        body: _pages[_currentIndex],
        
      ),
    );
  }
}


class CinemaPage extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      name: 'Lahn-Mah',
      releaseDate: '2022-04-04',
      posterUrl: 'https://lh3.googleusercontent.com/pEXQ13Y_gC-OPK1A5qACt2TQpGOD0-SUb-dr4FrMI0Q97QAx_6Ib3gc38lJHsr8AT0Sn8I3Muh4IIRI8rrW16SemgNfGJPWBPAc=w260',
      short: 'เอ็ม (บิวกิ้น-พุฒิพงศ์ อัสสรัตนกุล) ตัดสินใจดร็อปเรียนตอนปีสี่ เพื่อมาเอาดีทางการเป็นนักแคสต์เกม แต่ทํายังไงก็ไม่รุ่ง เอ็มเลยคิดจะรวยด้วยการทํางานสบายๆ แบบ มุ่ย (ตู-ต้นตะวัน ตันติเวชกุล) ลูกพี่ลูกน้อง ที่รับดูแลอากงที่ป่วยระยะสุดท้าย จนกลายเป็นทายาทคนเดียวที่ได้รับมรดกเป็นบ้านราคากว่าสิบล้าน เส้นทางการเป็น เศรษฐีรออยู่ตรงหน้า เอ็มจึงอาสาไปดูแล อาม่า (แต๋ว-อุษา เสมคำ) ที่ตรวจพบว่าเป็นมะเร็ง และน่าจะมีชีวิตอยู่ได้อีกไม่เกินปี โดยหวังจะได้มรดกหลักล้านเช่นกัน เมื่อหลานกับม่าที่อายุห่างกันกว่า 50 ปี ต้องมาอยู่ร่วมกัน การต่อปากต่อคําจึงเกิดขึ้นในทุกโมเมนต์ แต่มันกลับ เป็นช่วงเวลาที่ทําให้อาม่าลืมเหงา จากการเฝ้ารอลูกชายคนโตอย่าง กู๋เคี้ยง (ดู๋-สัญญา คุณากร) ลูกสาวคนกลาง อย่าง แม่ของเอ็ม (เจีย-สฤญรัตน์ โทมัส) และลูกชายคนเล็กอย่าง กู๋โส่ย (เผือก-พงศธร จงวิลาส) ที่จะมาพร้อมหน้ากันตามเทศกาลต่างๆ เท่านั้น ไม่น่าเชื่อว่างานที่เริ่มต้นทําเพราะหวังรวย จะทําให้คนห่วยๆ อย่างเอ็มได้รู้ว่า คําว่า “ครอบครัว” มีค่ามากกว่าเงิน ',
      cinema: 'SCREEN 1',
      time: '125min',
      rate: 'Rate:G',
      Genres: 'Family',
      voice:'TH SUB:ENG',
      showtime: '10:00 , 12:45 ,14:30 , 16:15 , 19:00 ,21:45 ,23:30',
      subcinema: 'Screen 4',
      subshowtime: '21:00',
    ),
    Movie(
      name: 'Fall Guy',
      releaseDate: '2024-04-25',
      posterUrl: 'https://lh3.googleusercontent.com/KKvq6ZQlv44NCsNTpRIP1ccvma52DVyOW8aoS-f3H0acUkMlGI2OGEnpQEra5KAGUPJWNWJvVbRRNBejmgQd2NByE6BEKXMf8w=w260',
      short: 'He’s a stuntman, and like everyone in the stunt community, he gets blown up, shot, crashed, thrown through windows and dropped from the highest of heights, all for our entertainment. And now, fresh off an almost career-ending accident, this working-class hero has to track down a missing movie star, solve a conspiracy and try to win back the love of his life while still doing his day job. What could possibly go right?',
      cinema: 'SCREEN 2',
      time: '130min',
      rate: 'Rate:13',
      Genres: 'Genre: Action, Adventure',
      voice:'ENG SUB: ENG/TH',
      showtime: '11:00 , 14:00 ,17:00 , 20:00',
      subcinema: '',
      subshowtime: '',
    ),
    Movie(
      name: 'Abigail',
      releaseDate: '2024-04-18',
      posterUrl: 'https://lh3.googleusercontent.com/9YOx_u27B7oLY_0vtKh8YyXfyhVSQ-dfvvWR-qIFOaIz1yghBJIfyrWZ_YSnE3oXZeMJxkTKejoA6yo-b3sGPl4HiXDLCMbMQw=w260',
      short: 'After a group of would-be criminals kidnap the 12-year-old ballerina daughter of a powerful underworld figure, all they have to do to collect a 50 million dollars ransom is watch the girl overnight. In an isolated mansion, the captors start to dwindle, one by one, and they discover, to their mounting horror, that they’re locked inside with no normal little girl.  ',
      cinema: 'SCREEN 3',
      time: '110min',
      rate: 'Rate:15',
      Genres: 'Genre: Horror, Mystery',
      voice:'ENG SUB:TH',
      showtime: '10:50 , 14:00 , 16:30 , 21:40',
      subcinema: '',
      subshowtime: '',
    ),
    Movie(
      name: 'Civil War',
      releaseDate: '2024-04-11',
      posterUrl: 'https://lh3.googleusercontent.com/RGo4rGprq-Y7WxBekmnsDqtU-yfEwv8YnX72lzOtipW2_aUuWYYVmEAp7_49V4L0S4y_vxp0uTlXRoSpN6j_KWOzgmOqNk5HWQ=w260',
      short: 'In the near future, a group of war journalists attempt to survive while reporting the truth as the United States stands on the brink of civil war.',
      cinema: 'SCREEN 4',
      time: '110min',
      rate: 'Rate:15',
      Genres: 'Genre: Action',
      voice:'ENG SUB:TH',
      showtime: '10:30 , 13:30 , 18:50 ,21:20',
      subcinema: '',
      subshowtime: '',
    ),
    Movie(
      name: 'Apirl, Come she will',
      releaseDate: '2024-04-11',
      posterUrl: 'https://lh3.googleusercontent.com/X_Sfi1TorlKT2t43oKvfAmDLAQ1HWnndXqDFrVS9zlJ-w7gylI0jxz47f29aFG_wsULci1Lk_IisuiSDm2oDyd0dOahC0Ijfpdw=w260',
      short: 'Shun Fujishiro is a psychiatrist and works at a university hospital in Tokyo. He is engaged to Yayoi Sakamoto. One day in April, when he is about to marry Yayoi Sakamoto, he receives a letter from his first love Haru Iyoda. They dated 10 years ago. Suddenly, his fiancé Yayoi Sakamoto disappears.',
      cinema: 'SCREEN 5',
      time: '110 min',
      rate: 'Rate:G',
      Genres: 'Drama, Romantic',
      voice:'JP SUB:TH',
      showtime: '11:00 , 13:40 , 16:20 ,19:30 , 21:10',
      subcinema: '',
      subshowtime: '',
    ),
    Movie(
      name: 'Ghostbuster : Frozen Empire',
      releaseDate: '2024-04-11',
      posterUrl: 'https://lh3.googleusercontent.com/VHAbmlB40oIwqa9FCtunPPIIJeieEAzXrihPJSB85s_97ZRdpsd4YTZ5y2_RINSTtICZ2m_dYFHqdLNaazNBnDTSF2K3QRdKaA=w260',
      short: 'The Spengler family returns to where it all started – the iconic New York City firehouse – to team up with the original Ghostbusters, who developed a top-secret research lab to take busting ghosts to the next level. But when the discovery of an ancient artifact unleashes an evil force, Ghostbusters new and old must join forces to protect their home and save the world from a second Ice Age.',
      cinema: 'SCREEN 6',
      time: '115min',
      rate: 'Rate:G',
      Genres: 'Genre: Adventure, Comedy, Fantasy',
      voice:'ENG SUB:TH',
      showtime: '10:45 , 13:00 , 15:45 ,17:30 , 19:15',
      subcinema: '',
      subshowtime: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container( // Wrap with Container
      color: const Color.fromARGB(255, 25, 25, 25),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 2;
                double width = constraints.maxWidth;
                double childAspectRatio = 0.75;
                if (width > 1000) {
                  crossAxisCount = 4;
                } else if (width > 750) {
                  crossAxisCount = 3;
                } else if (width > 500) {
                  crossAxisCount = 2;
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: movies.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 150 / 300,
                  ),
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return Card(
                      color: Color.fromARGB(175, 63, 63, 63),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  movie.posterUrl,
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AutoSizeText(
                                    movie.name,
                                    style: TextStyle(
                                      fontFamily: 'MyCustomFont',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                    maxLines: 1,
                                    minFontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowPage(movie: movie)),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(8.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                backgroundColor: Color.fromARGB(255, 150, 30, 30),
                              ),
                              child: Container(
                                constraints: BoxConstraints(minWidth: 88, minHeight: 36),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.movie,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'WATCH',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'MyCustomFont',
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
