import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting
import 'package:movieapps/models/movies.dart';
import 'package:movieapps/movie.dart';
import 'package:readmore/readmore.dart';
import 'seat.dart';

class ShowPage extends StatefulWidget {
  final Movie movie;

  ShowPage({
    required this.movie,
  });

  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  late List<TimeOfDay> showTimes;
  late DateTime currentDate;

  @override
  void initState() {
    super.initState();
    showTimes = widget.movie.showtime
        .split(',')
        .map((time) => _parseTimeString(time.trim()))
        .toList();
    currentDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 63, 63, 63),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),color: Color.fromARGB(255, 255, 236, 191),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.movie.name,
        style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 236, 191),
                    ),
          ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.movie.posterUrl,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.name,
                    style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.movie.Genres, // Ensure lowercase for variable names
                    style: TextStyle(fontFamily: 'MyPrompt', fontSize: 15,color: Colors.white,),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Released: ${widget.movie.releaseDate}',
                    style: TextStyle(fontFamily: 'MyPrompt', fontSize: 15,color: Colors.white,),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${widget.movie.rate} | ${widget.movie.time}',
                    style: TextStyle(fontFamily: 'MyPrompt', fontSize: 15,color: Colors.white,),
                  ),
                  SizedBox(height: 8),
                  ReadMoreText(
                    'Synopsis: ${widget.movie.short}',
                    trimMode: TrimMode.Line,
                    trimLines: 3,
                    colorClickableText: Color.fromARGB(255, 103, 123, 152),
                    trimCollapsedText: 'More',
                    trimExpandedText: 'Back',
                    style: TextStyle(fontFamily: 'MyPrompt', fontSize: 15,color: Colors.white),
                    moreStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white,),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.movie.cinema,
                    style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.movie.voice,
                    style: TextStyle(fontFamily: 'MyPrompt', fontSize: 12,color: Colors.white,),
                  ),
                  SizedBox(height: 8),
                  // Show buttons for each showtime
                  _buildShowtimeButtons(showTimes),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TimeOfDay _parseTimeString(String timeString) {
    final parts = timeString.split(':');
    final hour = int.tryParse(parts[0]) ?? 0; // Add error handling for parsing
    final minute = int.tryParse(parts[1]) ?? 0; // Add error handling for parsing
    return TimeOfDay(hour: hour, minute: minute);
  }

  Widget _buildShowtimeButtons(List<TimeOfDay> showTimes) {
    return Wrap(
      alignment: WrapAlignment.start, // Align buttons at the center
      spacing: 6.0, // Spacing between buttons
      runSpacing: 3.0, // Spacing between rows
      children: showTimes.map((showtime) {
        DateTime showDateTime = DateTime(
          currentDate.year,
          currentDate.month,
          currentDate.day,
          showtime.hour,
          showtime.minute,
        );

        Color buttonColor = _calculateButtonColor(showDateTime);

        return ElevatedButton(
          onPressed: () => _navigateToSeatSelection(showDateTime),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0), // Adjust the value as needed
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          ),
          child: Text(
            DateFormat.Hm().format(showDateTime), // Format the showtime
            style: TextStyle(
              fontFamily: 'MyCustomFont',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
      }).toList(),
    );
  }

  Color _calculateButtonColor(DateTime showDateTime) {
    if (showDateTime.isBefore(currentDate)) {
      return const Color.fromARGB(200, 40, 40, 40); // Showtime is overdue
    } else if (showDateTime.isAtSameMomentAs(currentDate) ||
        (showDateTime.isAfter(currentDate) &&
            showDateTime.difference(currentDate) <= Duration(minutes: 120))) {
      return Color.fromARGB(255, 195, 159, 83); 
    } else {
      return Color.fromARGB(255, 150, 30, 30); // Your original color
    }
  }

  void _navigateToSeatSelection(DateTime showtime) {
    DateTime now = DateTime.now();
    if (showtime.isBefore(now)) {
      // Showtime is overdue, don't navigate
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CinemaScreen(
          movie: widget.movie,
          showtime: DateFormat.yMd().add_Hm().format(showtime), // Format showtime for passing
        ),
      ),
    );
  }
}

