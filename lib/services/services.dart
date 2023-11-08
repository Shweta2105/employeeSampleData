import 'package:employee_data/models/post_employee.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<Datum>> getPost() async {
    var data = http.Client();
    var uri = Uri.parse('https://reqres.in/api/users?page=1');
  var response= await data.get(uri);
  if(response.statusCode==200)
  {
    var json=response.body;
    return employeePostFromJson(json).data;
  }
return [];
  }

  Future updateData(int id, String firstName, String lastName) async{
   try {
      var response = await http.put(
          'https://reqres.in/api/users?data/$id' as Uri,
          body: {'first_name': firstName, 'last_name': lastName});
      if(response.statusCode==200){
        return true;

      }else{
        return false;
      }
    }
    catch(e){
     return e.toString();
    }
  }
}
