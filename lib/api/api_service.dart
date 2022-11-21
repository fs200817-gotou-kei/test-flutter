import 'package:http/http.dart' show Client;
import 'package:test_app/model/work_site.dart';

class ApiService {
  final Uri baseUrl = Uri.parse("http://127.0.0.1:8080");
  Client client = Client();

  Future<List<WorkSite>> getAllWorkSites() async {
    final response = await client.get(baseUrl);
    if (response.statusCode == 200) {
      return worksiteFromJsom(response.body);
    } else {
      return worksiteFromJsom(response.body);
    }
  }
}
