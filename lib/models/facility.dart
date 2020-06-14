class Facility{

  final String uid;

  Facility({ this.uid });

}

class FacilityData{

  final String uid;

  // To estabilish the pinpoint
  final String lat;
  final String lng;

  final String name; // Place's name
  final double generalRate; // Place's general rate
  final Map generalSpecificRate; // General rate for each category
  final List<Map> reviewData; // Multiple reviews from users

  FacilityData({
    this.uid,
    this.lat,
    this.lng,
    this.name,
    this.generalRate,
    this.generalSpecificRate,
    this.reviewData
  });

}