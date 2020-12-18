import 'package:flutter/material.dart';
import 'package:textFieldDemo/helpers/db_helper.dart';
import 'package:textFieldDemo/models/countryinfo.dart';
import 'package:textFieldDemo/widgets/country_input.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  CountryInfo _countryInfo;
  void _selectImage(int code, String countryimage) {
    _countryInfo = CountryInfo(countrycode: code, countryimage: countryimage);
  }

  Future<void> addUserDetails(CountryInfo countryinfo) async {
    final newCountryCode = CountryInfo(
        countryimage: countryinfo.countryimage,
        countrycode: countryinfo.countrycode);

    DBHelper.insert('user_details', {
      'id': DateTime.now().toString(),
      'countrycode': newCountryCode.countrycode,
      'countryimage': newCountryCode.countryimage,
    });
  }

  void _saveCountryCode() {
    if (_countryInfo == null) {
      return;
    }
    addUserDetails(_countryInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Column(
        children: <Widget>[
          CountryInput(_selectImage),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: Colors.lightBlue,
                child: Text('Submit', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  _saveCountryCode();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
