import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class GooglePlacesApi extends StatefulWidget {
  const GooglePlacesApi({Key? key}) : super(key: key);

  @override
  State<GooglePlacesApi> createState() => _GooglePlacesApiState();
}

class _GooglePlacesApiState extends State<GooglePlacesApi> {
  TextEditingController _controller = TextEditingController();
  var uuid = Uuid();
  var _sessionToken = '12345';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }
 void onChange(){
    if(_sessionToken==null){
      setState(() {
        _sessionToken=uuid.v4();
      });
    }

    getSuggestions(_controller.text);
  }
   void getSuggestions(String input)async{
    String kPlaces_ApiKey ="AIzaSyBZKghwA6GjkXw9M8lmsxMoX9p_1mOUnmo";
    String baseURL=
        "https://maps.googleapis.com/map/api/place/autocomplete/json";
    String request ='$baseURL?input=$input&key=$kPlaces_ApiKey&sessioontoken=$_sessionToken';

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Find Places '),
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
            controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter Place",

              ),
            ),
          )
        ],
      ),
    );
  }
}
