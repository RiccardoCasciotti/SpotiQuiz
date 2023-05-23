
class Event {
  late String description;
  late String venue_name;
  late String event_name;
  late String startDate;
  late String endDate;
  late String image_url;
  late double? latitude;
  late double? longitude;
  

   
  

  Event(this.description, this.venue_name, this.event_name, this.startDate, this.endDate, this.image_url, this.latitude, this.longitude);

  dynamic toJson() => {'description': description, 'venue_name': venue_name, 'event_name': event_name,  'image_url': image_url,  'startDate': startDate, 'endDate': endDate, 'latitude': latitude, 'longitude': longitude,};

  @override
  String toString() {
    return toJson().toString();
  }
  
}
