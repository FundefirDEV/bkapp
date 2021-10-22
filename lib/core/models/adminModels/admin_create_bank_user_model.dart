class AdminCreateBankUser {
  int id;
  String firstname;
  String lastname;
  String gender;
  int country;
  String countryIso;
  final String phone;
  final String email;
  String password;
  String passwordConfirmation;
  final bool isActive;
  String role;
  String documenNumber;

  AdminCreateBankUser(
      {this.id,
      this.firstname,
      this.lastname,
      this.gender,
      this.country,
      this.countryIso,
      this.phone,
      this.email,
      this.isActive,
      this.role,
      this.documenNumber}) {
    password = documenNumber.substring(documenNumber.length - 6);
    passwordConfirmation = documenNumber.substring(documenNumber.length - 6);
  }

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
        "documentNumber": documenNumber,
        // "profession": "developer",
        // "scholarship": 1,
        // "birthDate": "2021-07-30 18:51:19.177365Z"
      };
}
