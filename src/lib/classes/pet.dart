import 'vaccination.dart';
import 'package:uuid/uuid.dart';

class Pet {
  /// Pet class that stores name, birth date, owner id and vaccination records for the pet.
  String _name;
  DateTime _birthDate;
  String _ownerId;
  List<Vaccination> _vaccinations;
  late String _petId;

  /// Constructor
  Pet(this._name, this._birthDate, this._ownerId, this._vaccinations) {
    var uuid = Uuid();
    String tempRand=uuid.v4();
     _petId = tempRand.substring(0,5);
    
    
    print("=================================="+_petId);
  }

  Pet.withId(this._name, this._birthDate, this._ownerId, this._petId, this._vaccinations);

  factory Pet.fromMap(Map<String, dynamic> map) {
    var vaccList = map['vaccinations'] as List;
    List<Vaccination> vaccinations = vaccList.map((v) => Vaccination.fromMap(v)).toList();

    return Pet.withId(
      map['name'],
      map['birthDate'].toDate(),
      map['ownerId'],
      map['petId'],
      vaccinations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': _name,
      'birthDate': _birthDate,
      'ownerId': _ownerId,
      'petId': _petId,
      'vaccinations': _vaccinations.map((v) => v.toMap()).toList(),
    };
  }

  String getInfo() {
    return "Pet Name : "+this._name+"\nBirth Date : "+this.getBirthDateString()+"\nOwner ID : "+this._ownerId+"\nPet ID : "+this._petId;
  }

  void printInfo() {
    print(this._name);
    print(this.getBirthDateString());
    print(this._ownerId);
    print(this._petId);
    for (Vaccination vac in _vaccinations) {
      vac.printInfo();
    }
  }

  Map<String,dynamic> petInfoMap(){
    return ({
      'Name': this._name,
      'Birth Date': this._birthDate
    });
  }

  /// Adds vaccination record to vaccinations of particular pet.
  void addVaccinationRecord(Vaccination v) {
    _vaccinations.add(v);
  }

  /// Removes vaccination record from vaccinations of particular pet
  void removeVaccinationRecordByIndex(int i) {
    _vaccinations.removeAt(i);
  }

  void removeVaccinationRecordByObject(Vaccination v) {
    _vaccinations.remove(v);
  }

  String getBirthDateString() {
    return this._birthDate.toIso8601String();
  }

  /// Getters and Setters.
  String getName() {
    return this._name;
  }

  void setName(String n) {
    this._name = n;
  }

  DateTime getBirthDate() {
    return this._birthDate;
  }

  void setBirthDate(DateTime d) {
    this._birthDate = d;
  }

  String getOwnerId() {
    return this._ownerId;
  }

  void setOwnerId(String s) {
    this._ownerId = s;
  }

  String getPetId() {
    return this._petId;
  }

  List<Vaccination> getVaccinations () {
    return this._vaccinations;
  }

}
