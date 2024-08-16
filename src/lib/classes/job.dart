import 'review.dart';

class Job {
  ///Title of the job
  String _title = String.fromCharCode(0);

  /// Holds the job owner's email
  String _ownerMail = String.fromCharCode(0);

  /// Holds the job owner's phone number
  String _ownerPhoneNo = String.fromCharCode(0);

  /// Holds the type of the job (1=grooming, 2=pet walking)
  int _type = -1;

  /// Holds the description of the job
  String _description = String.fromCharCode(0);

  /// Holds the experience required for the job
  String _experience = String.fromCharCode(0);

  /// Holds the list of available days for the job
  List<String> _availableDays = [];

  /// Holds the list of reviews for the job
  List<Review> _reviews = [];

  /// Constructor for the Job class.
  ///
  /// Initializes a Job object with the provided details.
  /// ownerMail and ownerPhoneNo will be gotten from the account class that creates the job
  Job(String ownerMail, String ownerPhoneNo, int type, String description,
      String experience, String title) {
    this._ownerMail = ownerMail;
    this._ownerPhoneNo = ownerPhoneNo;
    this._type = type;
    this._description = description;
    this._experience = experience;
    this._title = title;
  }

  /// Constructor to get job from map
  ///
  /// [map] , map that holds job class
  Job.fromMap(Map<String, dynamic> map) {

    if(map['reviews']!=null){
      var reviewList = map['reviews'] as List;
      List<Review> reviews = reviewList.map((v) => Review.fromMap(v)).toList();
      this._reviews = reviews;
    }
    if(map['reviews']!=null){
      var avDays = map['availableDays'] as List;
      var availableDays= avDays.map((v) => v.toString()).toList();
      this._availableDays=availableDays;
    }
    this._ownerMail = map['ownerMail'];
    this._ownerPhoneNo = map['ownerPhoneNo'];
    this._type = map["type"];
    this._description = map['description'];
    this._experience = map['experience'];
    this._title = map['title'];

  }

  /// Use to get map version of job obj to store in firestore
  ///
  /// [Return] , map version of job class
  Map<String, dynamic> toMap() {
    return {
      'ownerMail': this._ownerMail,
      'ownerPhoneNo': this._ownerPhoneNo,
      'type': this._type,
      'description': this._description,
      'experience': this._experience,
      'title': this._title,
      'availableDays': _availableDays,
      'reviews': _reviews.map((v) => v.toMap()).toList(),
    };
  }

  /// Getter for the job owner's email.
  String getOwnerMail() => _ownerMail;

  /// Getter for the job owner's phone number.
  String getOwnerPhoneNo() => _ownerPhoneNo;

  /// Getter for the job type.
  int getJobType() => _type;

  /// Getter for the job description.
  String getDescription() => _description;

  /// Getter for the job experience requirement.
  String getExperience() => _experience;

  /// Getter for the list of available days for the job.
  List<String> getAvailableDays() => _availableDays;

  /// Getter for the list of reviews for the job.
  List<Review> getReviews() => _reviews;

  /// Setter for the job owner's email.
  void setOwnerMail(String ownerMail) {
    this._ownerMail = ownerMail;
  }

  /// Setter for the job owner's phone number.
  void setOwnerPhoneNo(String ownerPhoneNo) {
    this._ownerPhoneNo = ownerPhoneNo;
  }

  /// Setter for the job type.
  void setJobType(int type) {
    this._type = type;
  }

  /// Setter for the job description.
  void setDescription(String description) {
    this._description = description;
  }

  /// Setter for the job experience requirement.
  void setExperience(String experience) {
    this._experience = experience;
  }

  void addReview(Review review) {
    String ownerMail = review.getOwnerMail();

    // Check if owner mail is unique
    if (_reviews
        .any((existingReview) => existingReview.getOwnerMail() == ownerMail)) {
      throw Exception('A review with the same owner mail already exists.');
    }

    // Add the review if owner mail is unique
    _reviews.add(review);
  }

  /// Function to remove a review from the job.
  ///
  /// Removes the provided [review] from the list of reviews for the job.
  void removeReview(Review review) {
    _reviews.remove(review);
  }

  /// Function to remove a review by owner mail.
  ///
  /// Removes the first review found with the specified [ownerMail].
  void removeReviewByOwnerMail(String ownerMail) {
    _reviews.removeWhere((review) => review.getOwnerMail() == ownerMail);
  }

  /// Function to add an available day for the job.
  ///
  /// Adds the provided [day] to the list of available days for the job.
  void addAvailableDay(String day) {
    _availableDays.add(day);
  }

  /// Function to remove an available day for the job.
  ///
  /// Removes the provided [day] from the list of available days for the job.
  void removeAvailableDay(String day) {
    _availableDays.remove(day);
  }
}
