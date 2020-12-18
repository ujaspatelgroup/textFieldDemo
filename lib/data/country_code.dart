import 'package:textFieldDemo/models/countryinfo.dart';

class UserProfile {
  List<CountryInfo> _countryList = [
    new CountryInfo(countrycode: 1, countryimage: 'assets/icons/us.png'),
    CountryInfo(countrycode: 91, countryimage: 'assets/icons/in.png'),
    CountryInfo(countrycode: 61, countryimage: 'assets/icons/au.png'),
    CountryInfo(countrycode: 64, countryimage: 'assets/icons/nz.png'),
    CountryInfo(countrycode: 27, countryimage: 'assets/icons/za.png')
  ];

  List<CountryInfo> get countryItems {
    return _countryList;
  }

  CountryInfo findById(int selectedcode) {
    return _countryList.firstWhere((code) => code.countrycode == selectedcode);
  }
}
