List<DropDownModel> dropDownModelFromJson(
        List<dynamic> str, String attributeId, String attributeText) =>
    List<DropDownModel>.from(
        str.map((x) => DropDownModel.fromJson(x, attributeId, attributeText)));

class DropDownModel {
  DropDownModel({this.id, this.text});
  String id;
  String text;

  factory DropDownModel.fromJson(Map<String, dynamic> json, String attributeId,
          String attributeText) =>
      DropDownModel(
          id: json[attributeId] ?? null, text: json[attributeText] ?? null);
}
