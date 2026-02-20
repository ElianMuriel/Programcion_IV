void main() {
  int b = 2;
  if (b>2){
    print('b > 2 is true');
  } else if (b<2){
    print('b < 2 is true');
  } else {
    print('b == 2 is true');
  }
  
  int age = 18;
  String ageDescription = age >= 18 ? 'adult': 'child';
  print(ageDescription);
}
