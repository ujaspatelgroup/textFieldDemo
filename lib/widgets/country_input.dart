import 'package:flutter/material.dart';
import 'package:textFieldDemo/models/countryinfo.dart';
import 'package:textFieldDemo/data/country_code.dart';

class CountryInput extends StatefulWidget {
  final Function onSelectImage;

  CountryInput(this.onSelectImage);

  @override
  _CountryInputState createState() => _CountryInputState();
}

class _CountryInputState extends State<CountryInput> {
  final _countryController = TextEditingController();
  FocusNode _focus = new FocusNode();
  CountryInfo _countryInfo;
  UserProfile _userProfile = new UserProfile();

  @override
  void initState() {
    super.initState();
    _defaultImage();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    _countryController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focus.hasFocus) {
      int code = int.parse(_countryController.text.toString().split('+')[1]);
      _changeFlagImage(code);
    }
  }

  void _defaultImage() {
    _countryInfo = _userProfile.countryItems.elementAt(1);
  }

  void _changeFlagImage(int selectedCountryCode) {
    var selectedCountry = _userProfile.findById(selectedCountryCode);
    if (selectedCountry == null) {
      return;
    }
    setState(() {
      _countryInfo = selectedCountry;
    });
    widget.onSelectImage(_countryInfo.countrycode, _countryInfo.countryimage);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: _countryController,
          focusNode: _focus,
          maxLines: 1,
          cursorHeight: 30,
          validator: (ccode) {
            if (ccode == null) {
              return 'Enter a country code';
            } else
              return null;
          },
          keyboardType: TextInputType.phone,
          style: TextStyle(fontSize: 20.0),
          decoration: new InputDecoration(
            labelText: "Country Code",
            labelStyle: new TextStyle(color: Colors.black, fontSize: 20.0),
            prefix: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Container(
                transform: Matrix4.translationValues(0.0, 9.0, 0.0),
                height: 30,
                width: 30,
                child: Image.asset(_countryInfo.countryimage, fit: BoxFit.fill),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
