import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapps/movie.dart';
import 'package:movieapps/ticketpage.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

class PurchasePage extends StatefulWidget {
  final Movie movie;
  final String showtime;
  final String cinema;
  final List<String> selectedSeats;
  final int subtotal;

  PurchasePage({
    required this.movie,
    required this.showtime,
    required this.cinema,
    required this.selectedSeats,
    required this.subtotal,
  });

  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  bool _showCardPayment = false;
  bool _showQRCodePayment = false;

  List<String> _savedData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 63, 63, 63),
        title: Text('CHECKOUT',style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 255, 236, 191),
                    ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),color: Color.fromARGB(255, 255, 236, 191),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 150,
                  child: Image.network(
                    widget.movie.posterUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'MyCustomFont',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${widget.showtime}',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'MyPrompt',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${widget.cinema}',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'MyPrompt',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Seats: ${widget.selectedSeats.join(", ")}',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'MyPrompt',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Subtotal: ${widget.subtotal} baht',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MyCustomFont',
                          color: Color.fromARGB(255, 255, 236, 191),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 180,
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _showCardPayment = true;
                        _showQRCodePayment = false;
                      });
                    },
                    icon: Icon(Icons.credit_card, color: Colors.white),
                    label: Text(
                      'Debit/Credit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MyCustomFont',
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 150, 30, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _showQRCodePayment = true;
                        _showCardPayment = false;
                      });
                    },
                    icon: Icon(Icons.qr_code, color: Colors.white),
                    label: Text(
                      'QRCode',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'MyCustomFont',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 150, 30, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 6),
          if (_showCardPayment) ...[
            CardPayment(
              movie: widget.movie,
              showtime: widget.showtime,
              cinema: widget.cinema,
              selectedSeats: widget.selectedSeats,
              subtotal: widget.subtotal,
              onPaymentConfirmed: _showPaymentConfirmationDialogAndSaveData,
            ),
          ],
          if (_showQRCodePayment) ...[
            QRCodePayment(
              movie: widget.movie,
              showtime: widget.showtime,
              cinema: widget.cinema,
              selectedSeats: widget.selectedSeats,
              subtotal: widget.subtotal,
              onPaymentConfirmed: _showPaymentConfirmationDialogAndSaveData,
            ),
          ],
        ],
      ),
    );
  }

  // Function to show payment confirmation dialog
  void _showPaymentConfirmationDialogAndSaveData(
    BuildContext context,
    Movie movie,
    String showtime,
    String cinema,
    List<String> selectedSeats,
    int subtotal,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 63, 63, 63),
          title: Text(
            "Confirm Payment",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 227, 161, 18),
              fontFamily: 'MyCustomFont',
            ),
          ),
          content: Text(
            "Are you sure you want to confirm the payment?",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'MyPrompt',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _savedData.add("${widget.movie.name}, ${widget.showtime}, ${widget.cinema}, ${widget.selectedSeats.join(", ")}, ${widget.subtotal} baht");
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketPage(
                      movie: movie,
                      showtime: showtime,
                      cinema: cinema,
                      selectedSeats: selectedSeats,
                      subtotal: subtotal,
                    ),
                  ),
                );
              },
              child: Text(
                "Confirm",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 227, 161, 18),
                  fontFamily: 'MyPrompt',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'MyPrompt',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
   void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _savedData.map(
            (data) {
              return ListTile(
                title: Text(
                  data,
                  style: TextStyle(fontSize: 16),
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Data'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

}

class CardPayment extends StatelessWidget {
  final Movie movie;
  final String showtime;
  final String cinema;
  final List<String> selectedSeats;
  final int subtotal;
  final Function(BuildContext, Movie, String, String, List<String>, int)
      onPaymentConfirmed;

  CardPayment({
    required this.movie,
    required this.showtime,
    required this.cinema,
    required this.selectedSeats,
    required this.subtotal,
    required this.onPaymentConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Debit/Credit Card info',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'MyCustomFont',
                color: Colors.white,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            decoration: InputDecoration(labelText: 'Name on Card',labelStyle: TextStyle(color: Colors.white),),
            style: TextStyle(color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            decoration: InputDecoration(labelText: 'Card Number',labelStyle: TextStyle(color: Colors.white),),
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            obscureText: true,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
            ],
          ),
        ),
        SizedBox(height: 3),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'CVV',labelStyle: TextStyle(color: Colors.white),),
                  style: TextStyle(color: Colors.white),
                  //keyboardType: TextInputType.number,
                  obscureText: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Expiration Date',labelStyle: TextStyle(color: Colors.white),),
                  style: TextStyle(color: Colors.white),
                  //keyboardType: TextInputType.number,
                  obscureText: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    _CardExpiryInputFormatter(),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 360,
              child: ElevatedButton(
                onPressed: () {
                  onPaymentConfirmed(
                    context,
                    movie,
                    showtime,
                    cinema,
                    selectedSeats,
                    subtotal,
                  );
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'MyCustomFont',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(8.0),
                  backgroundColor: Color.fromARGB(255, 150, 30, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CardExpiryInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class QRCodePayment extends StatelessWidget {
  final Movie movie;
  final String showtime;
  final String cinema;
  final List<String> selectedSeats;
  final int subtotal;
  final Function(BuildContext, Movie, String, String, List<String>, int)
      onPaymentConfirmed;

  QRCodePayment({
    required this.movie,
    required this.showtime,
    required this.cinema,
    required this.selectedSeats,
    required this.subtotal,
    required this.onPaymentConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'QR Payment',
                style: TextStyle(
                      fontFamily: 'MyCustomFont',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          SizedBox(height: 20),
          QrImageView(
            data: "Your payment data here",
            version: QrVersions.auto,
            size: 220.0,
            backgroundColor: Colors.white,
          ),
          SizedBox(height: 20),
          Container(
            width: 360,
            child: ElevatedButton(
              onPressed: () {
                onPaymentConfirmed(
                  context,
                  movie,
                  showtime,
                  cinema,
                  selectedSeats,
                  subtotal,
                );
              },
              child: Text(
                'Confirm',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'MyCustomFont',
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(8.0),
                backgroundColor: Color.fromARGB(255, 150, 30, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
