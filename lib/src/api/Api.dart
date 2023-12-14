class Api {
  Api._();
  static const String baseUrl = "http://192.168.137.45:3000";
  static const String studentsEndpoint = "$baseUrl/students";
  static studentEndpoint(int id) => "$baseUrl/students/$id";
}
