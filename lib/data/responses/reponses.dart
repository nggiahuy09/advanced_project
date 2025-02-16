import 'package:json_annotation/json_annotation.dart';

part 'reponses.g.dart';

@JsonSerializable()
class BaseReponses {
  @JsonKey(name: "status")
  int? statusCode;

  @JsonKey(name: "message")
  String? message;

  factory BaseReponses.fromJson(Map<String, dynamic> json) =>
      _$BaseReponsesFromJson(json);

  Map<String, dynamic> toJson() => _$BaseReponsesToJson(this);

  BaseReponses({this.statusCode, this.message});
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "numberOfNotifications")
  int? numberOfNotifications;

  CustomerResponse(this.id, this.name, this.numberOfNotifications);

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "facebook")
  String? facebookLink;

  @JsonKey(name: "email")
  String? emailAddress;

  ContactsResponse(this.phone, this.facebookLink, this.emailAddress);

  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseReponses {
  @JsonKey(name: "customer")
  CustomerResponse? customer;

  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  AuthenticationResponse(this.customer, this.contacts);

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
