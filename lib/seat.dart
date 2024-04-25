import 'package:flutter/material.dart';
import 'package:movieapps/movie.dart';
import 'package:movieapps/purchase.dart';


class CinemaScreen extends StatefulWidget {
  final Movie movie;
  final String showtime;

  CinemaScreen({required this.movie, required this.showtime});

  @override
  _CinemaScreenState createState() => _CinemaScreenState();
}

class _CinemaScreenState extends State<CinemaScreen> {
  List<String> selectedSeats = [];

  void toggleSeatSelection(String seatId) {
    setState(() {
      if (selectedSeats.contains(seatId)) {
        selectedSeats.remove(seatId);
      } else {
        selectedSeats.add(seatId);
      }
    });
  }

  void confirmBooking(BuildContext context) {
    if (selectedSeats.isEmpty) {
      // Show an error message if no seat is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select at least one seat.'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Booking'),
          content: Text('Are you sure you want to book the selected seats?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the ticket page if the user confirms
                
              },
              child: Text('CONFIRM'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 63, 63, 63),
        title: Text(widget.movie.name,style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 236, 191),
                    ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),color: Color.fromARGB(255, 255, 236, 191),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CinemaCard(
            toggleSeatSelection: toggleSeatSelection,
            selectedSeats: selectedSeats,
            movie: widget.movie,
            showtime: widget.showtime,
            confirmBooking: confirmBooking,
          ),
        ),
      ),
    );
  }
}

class CinemaCard extends StatelessWidget {
  final Function(String) toggleSeatSelection;
  final List<String> selectedSeats;
  final Movie movie;
  final String showtime;
  final Function(BuildContext) confirmBooking;

  CinemaCard({required this.toggleSeatSelection, required this.selectedSeats, required this.movie, required this.showtime, required this.confirmBooking,});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 25, 25, 25),
      elevation: 0,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Movie Poster Image
                Container(
                  width: 90,
                  height: 135,
                  child: Image.network(
                    movie.posterUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 20),
                // Movie Title and Genres
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.name,
                        style: TextStyle(
                          fontFamily: 'MyPrompt',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '${showtime}', // Display selected showtime here
                        style: TextStyle(
                          fontFamily: 'MyPrompt',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '${movie.cinema} | ${movie.voice}',
                        style: TextStyle(
                          fontFamily: 'MyPrompt',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Icon(
                        Icons.event_seat,
                        color: Colors.red,
                      ),
                      Text(
                        'seat 220 THB',
                        style: TextStyle(
                          fontFamily: 'MyPrompt',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 8),
            // Screen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SCREEN',
                  style: TextStyle(fontSize: 15, fontFamily: 'MyCustomFont',fontWeight: FontWeight.bold,color: Colors.white,),
                ),
              ],
            ),
            SizedBox(height: 12),
            // Screen
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 60),
              painter: CurvedScreenPainter(),
            ),
            SizedBox(height: 48),
            // Seats
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 16,
                mainAxisSpacing: 8,
                crossAxisSpacing: 2,
              ),
              itemCount: 10 * 16,
              itemBuilder: (context, index) {
                int row = index ~/ 16;
                int column = index % 16 + 1;
                String seatId = String.fromCharCode(65 + row) + column.toString();
                return GestureDetector(
                  onTap: () {
                    toggleSeatSelection(seatId);
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    child: Center(
                      child: Text(
                        seatId,
                        style: TextStyle(
                          fontSize: 8,fontFamily: 'MyCustomFont',color: selectedSeats.contains(seatId) ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: selectedSeats.contains(seatId) ? Color.fromARGB(255, 255, 236, 191) : Color.fromARGB(255, 150, 30, 30),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 4),
            // Selected Seats and Subtotal
            if (selectedSeats.isNotEmpty) ...[
              Text(
                'Seats: ${selectedSeats.join(", ")}',
                style: TextStyle(fontFamily: 'MyPrompt',fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,),
              ),
              Text(
                'Subtotal: ${selectedSeats.length * 220} baht',
                style: TextStyle(fontFamily: 'MyPrompt',fontSize: 18,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 255, 236, 191)),
              ),
              SizedBox(height: 12),
              // Next Page Button
              Container(
                width: double.infinity * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PurchasePage(movie: movie, showtime: showtime, cinema: movie.cinema, selectedSeats: selectedSeats, subtotal: selectedSeats.length * 220,),
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
                  child: Text(
                    'CONTINUE',
                    style: 
                    TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class CurvedScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromARGB(255, 255, 236, 191)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    var path = Path()
      ..moveTo(size.width * 0.0685714, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.4917857,
        size.height * -0.2425,
        size.width * 0.9257143,
        size.height * 0.5,
      );

    canvas.drawPath(path, paint);

    var gradientPaint = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    gradientPaint.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color.fromARGB(200, 255, 236, 191), Color.fromARGB(100, 255, 236, 191), Color.fromARGB(0, 255, 236, 191)],
      stops: [0.00, 0.16, 1.00],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    var gradientPath = Path()
      ..moveTo(size.width * 0.0382429, size.height * 1.0022)
      ..quadraticBezierTo(
        size.width * 0.0597857,
        size.height * 0.6254,
        size.width * 0.0669571,
        size.height * 0.5,
      )
      ..cubicTo(
        size.width * 0.2820143,
        size.height * 0.0483,
        size.width * 0.6836,
        size.height * -0.0022,
        size.width * 0.9273286,
        size.height * 0.5,
      )
      ..quadraticBezierTo(
        size.width * 0.9345,
        size.height * 0.6254,
        size.width * 0.9560429,
        size.height * 1.0022,
      )
      ..lineTo(size.width * 0.0382429, size.height * 1.0022)
      ..close();

    canvas.drawPath(gradientPath, gradientPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}