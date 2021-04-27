class Employee {
  final int id;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String position;
  final String contractDate;
  final int myProperty;
  final bool isTrainee;
  int vacations;

  Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.position,
    required this.contractDate,
    required this.myProperty,
    required this.isTrainee,
    required this.vacations,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: int.parse(json['id'].toString()),
        firstName: json['firstName'].toString(),
        lastName: json['lastName'].toString(),
        birthDate: json['birthDate'].toString(),
        position: json['position'].toString(),
        contractDate: json['contractDate'].toString(),
        myProperty: int.parse(json['myProperty'].toString()),
        isTrainee: json['isTrainee'],
        vacations: int.parse(json['vacations'].toString()),
      );
}
