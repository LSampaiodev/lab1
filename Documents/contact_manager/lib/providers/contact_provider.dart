import 'package:contact_manager/models/contact_model.dart';
import 'package:contact_manager/services/api_service.dart';
import 'package:flutter/material.dart';

class ContactProvider with ChangeNotifier {
  List<Contact> _contacts = [];
  final ApiService _apiService = ApiService();

  List<Contact> get  contacts => _contacts;

  //Carrega todos os contatos
  Future<void> fetchContacts() async {
    _contacts = await _apiService.getContacts();
    notifyListeners();
  }

  //Adiciona um Contato
  Future<void> addContact(Contact contact) async {
    await _apiService.addContact(contact);
    await fetchContacts(); //Atualiza a lista
  }

  //Atualiza um contato
  Future<void> updatedContact(String id, Contact contact) async {
    await _apiService.updatedContact(id, contact);
    await fetchContacts(); //Atualiza a lista
  }

  //Remove um contato
  Future<void> deleteContact(String id) async {
    await _apiService.deleteContact(id);
    await fetchContacts(); //Atualiza a lista
  }
}