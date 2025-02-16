// to convert data from network to domain model (non-nullable object)
import 'package:advanced_project/app/constant.dart';
import 'package:advanced_project/app/extensions.dart';
import 'package:advanced_project/data/responses/reponses.dart';
import 'package:advanced_project/domain/model.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      id: this?.id?.orEmpty() ?? AppConstants.empty,
      name: this?.name?.orEmpty() ?? AppConstants.empty,
      numberOfNotifications:
          this?.numberOfNotifications?.orZero() ?? AppConstants.zero,
    );
  }
}

extension ContactResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      email: this?.emailAddress?.orEmpty() ?? AppConstants.empty,
      facebookLink: this?.facebookLink?.orEmpty() ?? AppConstants.empty,
      phone: this?.phone?.orEmpty() ?? AppConstants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      contacts: this?.contacts?.toDomain(),
      customer: this?.customer?.toDomain(),
    );
  }
}
