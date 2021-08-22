class Company {
  final String name;
  final String payscale;
  final String imgPath;
  final String location;
  final DateTime dateTime;
  final String lastdate;
  bool isRegistered;
  final String duration;

  Company(this.name, this.payscale, this.imgPath, this.location, this.dateTime,
      this.lastdate, this.isRegistered, this.duration);

  static List<Company> fetchAll() {
    return [
      Company('Ramersoft', 'Rs 10,000', 'assets/images/ramersoft.png', 'Vizag',
          DateTime.utc(2020, 01, 23), '23,Jan,2020', false, '2 years'),
      Company(
          'NIT Warangal',
          'No Stipend',
          'assets/images/NiTW.jpg',
          'Warangal',
          DateTime.utc(2020, 04, 2),
          '2,April,2020',
          true,
          '2 months'),
      Company(
          'IIIT Hyderabad',
          'No Stipend',
          'assets/images/iiith.jpg',
          'Hyderabad',
          DateTime.utc(2021, 03, 19),
          '19,March,2021',
          false,
          '2 months'),
      Company(
          'Codetantra',
          'Rs 9,000',
          'assets/images/codetantra.jpg',
          'Hyderabad',
          DateTime.utc(2021, 03, 25),
          '25,March,2021',
          true,
          '1 year'),
      Company('IB Hubs', 'Rs 10,000', 'assets/images/ibhubs.png', 'Hyderabad',
          DateTime.utc(2021, 03, 19), '19,March,2021', false, '2 months'),
      Company(
          'Tech Solutions',
          'Rs 8,000',
          'assets/images/rgukt_logo.jpg',
          'Nuzvid',
          DateTime.utc(2021, 06, 20),
          '20,June,2021',
          false,
          '1 year'),
      Company('MeeBuddy Pvt Ltd', '2 to 5k', 'assets/images/meebuddy_logo.png',
          'Nuzvid', DateTime.utc(2021, 05, 22), '22,May,2021', false, '1 year')
    ];
  }
}
