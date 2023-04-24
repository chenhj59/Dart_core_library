// Dates and times:https://dart.dev/guides/libraries/library-tour#dates-and-times

void main() {
  creat_DateTime();
  
}

void creat_DateTime() {
  //You can create DateTime objects using several constructors and methods
  // Get the current date and time
  var now = DateTime.now();

  // Create a new DateTime with the local time zone
  var y2k = DateTime(2000); // January 1, 2000

  // Specify the month and day
  y2k = DateTime(2000, 1, 2); // January 2, 2000

  // Specify the date as a UTC time
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

  // Specify a date and time in ms since the Unix epoch
  y2k = DateTime.fromMicrosecondsSinceEpoch(94668400000, isUtc: true);

  // Parse an ISO 8601 date in the UTC time zone
  y2k = DateTime.parse('2000-01-01T00:00:00Z');

  // Create a new DateTime from an existing one, adjusting just some properties
  var sameTimeLastYear = now.copyWith(year: now.year - 1);

  /*The millisecondsSinceEpoch property of a date returns the number of milliseconds since the “Unix epoch”—January 1, 1970, UTC
   */
  // 1/1/2000, UTC
  y2k = DateTime.utc(2000);
  assert(y2k.millisecondsSinceEpoch == 946684800000);

  // 1/1/1970, UTC
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);

  /*Use the Duration class to calculate the difference between two dates and to shift a date forward or backward
   */
  y2k = DateTime.utc(2000);

  // Add one year
  var y2001 = y2k.add(const Duration(days: 366));
  assert(y2001.year == 2001);

  // Subtract 30 days
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);

  // Calculate the difference between two dates.
// Returns a Duration object
  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366);
}
