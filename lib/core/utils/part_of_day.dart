/// Part of the day, used for time-based greetings.
enum PartOfDay {
  morning,
  afternoon,
  evening;

  static const _afternoonStartHour = 12;
  static const _eveningStartHour = 18;

  /// Returns the period [time] falls into.
  static PartOfDay of(DateTime time) => switch (time.hour) {
    < _afternoonStartHour => morning,
    < _eveningStartHour => afternoon,
    _ => evening,
  };
}
