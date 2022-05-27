import 'package:http/http.dart' as http;
import 'package:personal_helper/models/idoso.dart';

class SingUpController {
  final Idoso idoso;
  String urlIdoso = 'https://localhost:3306/cadastrarIdoso';

  SingUpController(this.idoso);

  postIdoso() async {
    try {
      var response = await http.post(Uri.parse(urlIdoso), body: {
        "nome": idoso.nome,
        "cpf": idoso.cpf,
        "nascimento": idoso.nascimento,
        "email": idoso.email,
        "senha": idoso.senha,
        "rg": idoso.rg
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
