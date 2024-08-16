class Vaccination {
  // Vaccination class that stores the type and date of the vaccine and name of the veterinarian.
  String _type;
  DateTime _date;
  String _place;

  /// Constructor
  Vaccination(this._type, this._date, this._place);

  /// Factory method to create Vaccination instance from a map.
  factory Vaccination.fromMap(Map<String, dynamic> map) {
    return Vaccination(
      map['type'],
      map['date'].toDate(),
      map['place'],
    );
  }

  /// Convert Vaccination instance to a map.
  Map<String, dynamic> toMap() {
    return {
      'type': _type,
      'date': _date,
      'place': _place,
    };
  }

  void printInfo() {
    print(this._type);
    print(this.getDateString());
    print(this._place);
  }

  String getDateString() {
    return this._date.toIso8601String();
  }

  /// Getters and Setters.
  String getType() {
    return this._type;
  }

  void setType(String t) {
    this._type = t;
  }

  DateTime getDate() {
    return this._date;
  }

  void setDate(DateTime d) {
    this._date = d;
  }

  String getPlace() {
    return this._place;
  }

  void setPlace(String v) {
    this._place = v;
  }
}
