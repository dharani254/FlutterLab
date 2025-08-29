// A simple Dart program to understand basics

void main() {
  // Variables
  String name = "Dart Learner";
  int age = 20;
  double height = 5.8;
  bool isStudent = true;

  // Print statements
  print("Hello, $name!");
  print("Age: $age, Height: $height, Student: $isStudent");

  // Conditional statement
  if (age >= 18) {
    print("You are an adult.");
  } else {
    print("You are a minor.");
  }

  // Loop
  print("\nCounting from 1 to 5:");
  for (int i = 1; i <= 5; i++) {
    print(i);
  }

  // Function call
  int sum = addNumbers(5, 7);
  print("\nThe sum of 5 and 7 is: $sum");
}

// Function definition
int addNumbers(int a, int b) {
  return a + b;
}


