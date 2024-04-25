import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movieapps/models/movies.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:movieapps/movie.dart';

class TicketPage extends StatelessWidget {
  final Movie movie;
  final String showtime;
  final String cinema;
  final List<String> selectedSeats;
  final int? subtotal;

  TicketPage({
    required this.movie,
    required this.showtime,
    required this.cinema,
    required this.selectedSeats,
    required this.subtotal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color.fromARGB(200, 25, 25, 25),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 63, 63, 63),
        title: Text('TICKET',style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: Color.fromARGB(175, 63, 63, 63),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/logo_grand_normal.png',
                    width: 50, // Adjust the width as needed
                    height: 50, // Adjust the height as needed
                    // You can also use other constructors like AssetImage, NetworkImage, etc., based on your image source
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie Poster
                    Container(
                      width: 100,
                      height: 150,
                      child: Image.network(
                        movie.posterUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20),
                    // Movie Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.name,
                            style: TextStyle(
                              fontFamily: 'MyCustomFont',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 236, 191),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Date: $showtime',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'MyPrompt',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '$cinema',
                            style: TextStyle(fontSize: 16,fontFamily: 'MyCustomFont',fontWeight: FontWeight.bold,color: Colors.white,),
                          ),
                          SizedBox(height: 0),
                          Text(
                            '${selectedSeats.join(", ")}',
                            style: TextStyle(fontSize: 20,fontFamily: 'MyCustomFont',fontWeight: FontWeight.w800,color:  Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Price: $subtotal baht',
                            style: TextStyle(fontSize: 12,fontFamily: 'MyPrompt',color: Colors.white,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Scan QRCode on entrance',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'MyCustomFont',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Second Row: QR Code and Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // QR Code
                    QrImageView(
                      data: "Your QR code data here",
                      version: QrVersions.auto,
                      size: 200,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Enjor your movie with best exprience',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'MyPrompt',
                        color:  Color.fromARGB(255, 255, 236, 191),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              // Second Row: QR Code and Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CinemaPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(8.0), // Adjust the padding as needed
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0), // Adjust the border radius as needed
                              ),
                        backgroundColor: Color.fromARGB(255, 150, 30, 30),
                      ),
                      child: Text('Back to Home',style: 
                          TextStyle(
                            fontFamily: 'MyCustomFont',
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


