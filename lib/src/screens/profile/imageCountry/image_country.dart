String imageCountry(string) {
  switch (string) {
    case "CO":
      return 'assets/images/colombia.svg';
      break;
    case "PE":
      return 'assets/images/peru.svg';
      break;
    case "AR":
      return 'assets/images/argentina.svg';
      break;
    default:
      return string;
  }
}
