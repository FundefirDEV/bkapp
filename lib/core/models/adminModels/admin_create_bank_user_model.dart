class AdminCreateBankUser {
  int id;
  String firstname;
  String lastname;
  String gender;
  int country;
  String countryIso;
  String phone;
  String email;
  String validationCode;
  String password;
  String passwordConfirmation;
  bool isActive;
  String role;

  AdminCreateBankUser(
      {this.id,
      this.firstname,
      this.lastname,
      this.gender,
      this.country,
      this.phone,
      this.email,
      this.validationCode,
      this.password,
      this.passwordConfirmation,
      this.isActive,
      this.role});

  Map<String, dynamic> toJson() => {
        "password": password != null ? password : null,
        "passwordConfirmation":
            passwordConfirmation != null ? passwordConfirmation : null,
        "firstname": firstname,
        "lastname": lastname != null ? lastname : null,
        "gender": gender != null ? gender : null,
        "country": country != null ? country : null,
        "countryIso": countryIso,
        "phone": phone,
        "email": email != null ? email : null,
        "username": email,
        "isActive": isActive != null ? isActive : null,
        "isCreator": true,
        "role": role != null ? role : null,
        // "documentNumber": "000000001",
        // "profession": "developer",
        // "scholarship": 1,
        // "birthDate": "2021-07-30 18:51:19.177365Z"
      };
}
