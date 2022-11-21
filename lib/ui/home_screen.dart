import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app/api/api_service.dart';
import 'package:test_app/model/work_site.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ApiService apiService;
  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<WorkSite>>(
          future: apiService.getAllWorkSites(),
          builder:
              (BuildContext context, AsyncSnapshot<List<WorkSite>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<WorkSite>? worksites = snapshot.data;
              print(worksites.toString());
              return _buildListView(worksites!);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget _buildListView(List<WorkSite> worksites) {
    return Container(
      child: Text("OK"),
    );
  }
}
