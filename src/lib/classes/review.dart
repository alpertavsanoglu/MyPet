class Review {
  ///Holds the review owners mail
  String _ownerMail = new String.fromCharCode(0);

  /// Holds the comment that job got
  String _comment = new String.fromCharCode(0);

  /// Holds the point that job got
  var _point;

  DateTime _postDate = DateTime(0);

  Review(String ownerMail, String comm, int point) {
    this._ownerMail = ownerMail;
    this._comment = comm;
    this._point = point;
    this._postDate = DateTime.now();
  }
  Review.fromMap(Map<String, dynamic> map) {
    this._ownerMail = map['ownerMail'];
    this._comment = map['comment'];
    this._point = map["point"];
    this._postDate = map['postDate'].toDate();
  }

  /// Use to get map version of review obj to store in firestore
  ///
  /// [Return] , map version of Review class
  Map<String, dynamic> toMap() {
    return {
      'ownerMail': this._ownerMail,
      'comment': this._comment,
      'point': this._point,
      'postDate': this._postDate
    };
  }

  ///Getters and setters
  int getPoint() {
    return _point;
  }

  String getComment() {
    return _comment;
  }

  String getOwnerMail() {
    return _ownerMail;
  }

  void setOwnerMail(String ownerMail) {
    this._ownerMail = ownerMail;
  }

  void setPoint(int point) {
    this._point = point;
  }

  void setComment(String comm) {
    this._comment = comm;
  }
}
