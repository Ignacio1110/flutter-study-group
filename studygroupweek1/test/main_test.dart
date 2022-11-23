void main() {
  //non-null
  int variableName = 10;
  print(variableName);

  //null
  int? variableNameNullable = 20;
  print(variableNameNullable);

  //double、String、bool...Map、List、Set

  //List
  List myList = [];
  List<String?> myList2 = <String?>["value1", null];

  myList.add("string value");
  myList.add(29);
  myList.add(<String>[]);
  myList.add(null);
  print(myList);

  myList2.add("value");
  myList2.remove(null);
  print(myList2);
  //use index
  print(myList2[0]);

  Map<String, dynamic> mapFromFunction = firstFunction("Ignacio", 40);
  print(mapFromFunction["name"]);
  print(mapFromFunction["namename"]);
  print(mapFromFunction["teammates"][0]["name"]);

  //loop

  //for
  for (int i = 0; i < 100; i++) {}

  //for in
  List<int> list = List.generate(100, (index) => index, growable: false);
  for (int data in list) {}

  //while
  int j = 0;
  while (j < 100) {
    j++;
  }
}

Map<String, dynamic> firstFunction(String string, int number) {
  Map<String, dynamic> map = {
    "name": string,
    "age": number,
    "teammates": [
      {"name": "${string}1"},
      {"name": "Ignacio2"}
    ]
  };
  return map;
}
