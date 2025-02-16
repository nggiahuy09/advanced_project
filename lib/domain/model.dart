class SliderObject {
  final String title;
  final String subTitle;
  final String image;

  SliderObject({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

class Customer {
  String id;
  String name;
  int numberOfNotifications;

  Customer({
    required this.id,
    required this.name,
    required this.numberOfNotifications,
  });
}

class Contacts {
  String phone;
  String facebookLink;
  String email;

  Contacts({
    required this.phone,
    required this.facebookLink,
    required this.email,
  });
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication({
    this.customer,
    this.contacts,
  });
}