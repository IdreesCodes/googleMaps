import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class ConveringLatToAddress extends StatefulWidget {
  const ConveringLatToAddress({Key? key}) : super(key: key);

  @override
  State<ConveringLatToAddress> createState() => _ConveringLatToAddressState();
}

class _ConveringLatToAddressState extends State<ConveringLatToAddress> {

  String stAddress='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Converting latlan to address'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(stAddress, style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic
          ),),
          GestureDetector(
            onTap: ()async{
              final coordinates = new Coordinates(31.472593, 74.377339);
              var address= await Geocoder.local.findAddressesFromCoordinates(coordinates);
              var first= address.first;
              print(first.featureName.toString() +first.addressLine.toString());
              setState(() {

                stAddress=first.addressLine.toString();
            });




              },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal
              ),
              height: 50.0,
              child: Center(
                child: Text('Convert'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
