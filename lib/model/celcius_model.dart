class Fahrenheit {
  final num fahrenheit;

  Fahrenheit({required this.fahrenheit});

  factory Fahrenheit.fromJson(Map<String, dynamic> json) {
    return Fahrenheit(
      fahrenheit: json['fahrenheit'],
    );
  }
}
