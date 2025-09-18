import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Text(
              "Order",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.circle, size: 5, color: Colors.black),
            SizedBox(width: 5),
            Text(
              "#A-12745",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(16.0), child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Map Preview
            Container(
              padding: EdgeInsets.all(8),
              height: 160,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              //alignment: Alignment.center,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text("Map Preview", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 120,
                      decoration: BoxDecoration(color: Color(0xFFE9ECF3), borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
        
            // Pickup / Drop info
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pickup", style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w500)),
                  SizedBox(height: 4),
                  Text("Cafe Orion, Gulshan 1", style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  Text("Drop-off", style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w500)),
                  SizedBox(height: 4),
                  Text("H#11, Road 05, Banani", style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  Row(children: [
                   _tag("ETA 12m"),
                   SizedBox(width: 16),
                   _tag("2.8 km")
                  ]),
                ],
              ),
            ),
            Spacer(),
        
            //Buttons
            SizedBox(
              height: 48,
              child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ), child: Text("Start Delivery", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
            ),
            SizedBox(height: 12),
        
            SizedBox(
              height: 48,
              child: OutlinedButton(onPressed: (){}, style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.red, width: 2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ), child: Text("Decline", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red))),
            )
          ],
        )),
      ),
    );
  }

  //Small chip widget for ETA and distance
  Widget _tag(String text){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFFE1EDFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
    );
  }
}
