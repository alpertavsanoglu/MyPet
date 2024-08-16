import 'package:myapp/classes/job.dart';
import 'package:uuid/uuid.dart';

import 'pet.dart';

/// Account class that will hold regular accounts that are logined with authentication
class account {
  /// Holds unique id for each account
  String _accountID = new String.fromCharCode(0);

  /// Holds birth date of user as dd,mm,yyyy
  //DateTime _birthDate = new DateTime(0);

  /// Holds userName
  String _userName = new String.fromCharCode(0);

  /// Holds the city that user live in
  String _location = new String.fromCharCode(0);

  /// Holds user's phone number
  String _phoneNumber = new String.fromCharCode(0);

  /// Holds user's mail
  String _mail = new String.fromCharCode(0);

  /// Holds the pet count that user have
  var _petCount;

  /// Holds pets that user have
  List<Pet> _pets = [];

  List<Job> _jobs = [];

  /// Main constructor to create account
  ///
  /// [user_name] , setting username
  /// [city] , setting user's location
  /// [email] , setting user's email
  /// [phoneNo] , setting user's phone number
  account(String user_name, String city, String email, String phoneNo) {
    //creating unique id for each account
    var uuid = Uuid();
    _accountID = uuid.v4();

    //_birthDate = birth_date;
    _userName = user_name;
    _location = city;
    _phoneNumber = phoneNo;
    _mail = email;
    _petCount = 0;
  }

  /// Constructor to get account from map
  ///
  /// [map] , map that holds <accID, account obj>
  account.fromMap(Map<String, dynamic> map) {
    if(map['pets']!= null){
      var petList = map['pets'] as List;
      List<Pet> pets = petList.map((v) => Pet.fromMap(v)).toList();
      this._pets = pets;
    }
    if(map['jobs']!= null){
      var jobList = map['jobs'] as List;
      List<Job> jobs = jobList.map((v) => Job.fromMap(v)).toList();
      this._jobs = jobs;
    }
    this._accountID = map['accountID'];
    this._userName = map['userName'];
    this._phoneNumber = map['phone'];
    this._location = map['location'];
    this._mail = map['mail'];
    this._petCount = map['petCount'];


  }

  /// Copy constructor for account
  ///
  /// [other] , account that wanted to copy
  account.copy(account other) {
    this._accountID = other.getAccId();
    this._userName = other.getUserName();
    this._location = other.getLocation();
    this._mail = other.getMail();
    this._phoneNumber= other.getPhoneNumb();
    this._petCount = other.getPetCount();
    this._pets = List<Pet>.from(other.getPetList());
    this._jobs = List<Job>.from(other.getJobList());
  }

  /// Use to get map version of account obj to store in firestore
  ///
  /// [Return] , map<accID,account obj>
  Map<String, dynamic> toMap() {
    return {
      'accountID': this._accountID,
      'userName': this._userName,
      //'birthDate': this._birthDate,
      'phone': this._phoneNumber,
      'location': this._location,
      'mail': this._mail,
      'petCount': this._petCount,
      'pets': _pets.map((v) => v.toMap()).toList(),
      'jobs': _jobs.map((v) => v.toMap()).toList(),
    };

    //'vaccinations': _vaccinations.map((v) => v.toMap()).toList()
  }

  //Getters
  String getAccId() {
    return _accountID;
  }

  //DateTime getBirthDate() {
  //return _birthDate;
  //}

  String getUserName() {
    return _userName;
  }

  String getLocation() {
    return _location;
  }

  String getMail() {
    return _mail;
  }

  String getPhoneNumb() {
    return _phoneNumber;
  }

  int getPetCount() {
    return _petCount;
  }

  List<Pet> getPetList() {
    return _pets;
  }

  List<Job> getJobList() {
    return _jobs;
  }

  //Setters
  //void setBirthDate(DateTime newBday) {
  //this._birthDate = newBday;
  //}

  void setUserName(String newUserName) {
    this._userName = newUserName;
  }

  void setLocation(String newLocation) {
    this._location = newLocation;
  }

  void setMail(String newMail) {
    this._mail = newMail;
  }

  void setPhoneNumb(String newPhoneNumb) {
    this._phoneNumber = newPhoneNumb;
  }

  ///Getter for user's communication information in formatted string
  ///
  ///Returns formatted string
  String getCommInfo() {
    String temp =
        "Phone Number: ${_phoneNumber}\nMail: ${_mail}\nCity: ${_location}\nPet count: ${_petCount}";
    return temp;
  }

  /// Getter for user's all pets in formatted string
  ///
  /// Returns formatted string that has all pets informations
  String showAllPets() {
    String temp = "";
    for (int i = 0; i < _petCount; i++) {
      //temp = temp + _pets[i].printInfo() + "\n";
    }
    return temp;
  }

  ///Getter for user's pet as index
  ///
  ///Throws exception if there is no pet in given index or given index is out of bound
  ///Returns the pet at given index
  Pet getPetWithIndex(int index) {
    if (index > _petCount - 1 || index < 0) {
      throw FormatException('Index out of bound!\n');
    }
    if (_pets[index] == null) {
      throw FormatException('There is no pet in given index\n');
    }
    return _pets[index];
  }

  ///Adds job to job list in account
  void addJobToAcc(Job newJob) {
    _jobs.add(newJob);
  }

  bool removeJobWithIndex(int index) {
    if (index > _jobs.length - 1 || index < 0) {
      return false;
    }
    if (_jobs[index] == null) {
      return false;
    }
    _jobs.removeAt(index);
    return true;
  }

  void removeLastJob() {
    _jobs.removeLast();
  }

  ///Adds pet to pet list in account
  ///
  ///Increase size by one
  void addPetToAcc(Pet newPet) {
    _petCount++;
    _pets.add(newPet);
  }

  bool removePetWithIndex(int index) {
    if (index > _petCount - 1 || index < 0) {
      return false;
    }
    if (_pets[index] == null) {
      return false;
    }
    _pets.removeAt(index);
    _petCount--;
    return true;
  }

  void removeLastPet() {
    _pets.removeLast();
  }

  /// Check if birth date is valid for use
  ///
  /// It will move to authentication class
  bool _isValidBirthDate(DateTime birth_date) {
    if ((birth_date.day > 0 && birth_date.day < 32) &&
        (birth_date.month > 0 && birth_date.month < 13) &&
        (birth_date.year > 1900 && birth_date.month < 2024)) {
      return false;
    }
    return true;
  }

  /// Check if user name is valid for use
  ///
  /// It will move to authentication class
  bool _isValidUserName(String user_name) {
    RegExp regExp = new RegExp(r'^[a-zA-Z0-9_]*');
    //length check
    if (user_name.length < 2 || user_name.length > 12) {
      return false;
    }
    //alphanumeric check
    if (!regExp.hasMatch(user_name)) {
      return false;
    }
    return true;
  }
}
