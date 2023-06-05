class User {
  final String phone, location, name, surname, email;

  const User({
    required this.phone,
    required this.location,
    required this.name,
    required this.surname,
    required this.email,
  });

  static const List<User> users = [
    User(
      phone: '+380983891691',
      location: 'Вінниця',
      name: 'Олександр',
      surname: 'Голіков',
      email: 'sanyagolikov@gmail.com',
    )
  ];
}
