import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:contact_manager/models/contact_model.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:5000/api/contacts';

// Metodo para obter todos os contatos
  Future<List<Contact>> getContacts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((contact) => Contact.fromJson(contact)).toList();
    } else {
      throw Exception('Erro ao carregar os contatos');
    }
  }
  //Metodo para adicionar contato
  Future<void> addContact(Contact contact) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(contact.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Erro ao adicionar o contato');
    }
  }

  //Metodo para atualizar contato
  Future<void> updatedContact(String id, Contact contact) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(contact.toJson())
    );
    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar o contato');
    }
  }

  //Metodo para deletar um contato
  Future<void> deleteContact(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar contato');
    }
  }

}
