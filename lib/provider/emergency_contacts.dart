import 'package:flutter/material.dart';

import '../entity/emergency_contact.dart';

class EmergencyContacts extends ChangeNotifier{
  List<EmergencyContact> _emergencyContacts = [EmergencyContact(1,"Father", "+9477123654"),EmergencyContact(2,"Mother", "+9477123654"),EmergencyContact(3,"brother", "+9477123654"),EmergencyContact(4,"hello", "+9477123654"),];

  List<EmergencyContact> get emergencyContacts => _emergencyContacts;

  set emergencyContacts(List<EmergencyContact> value) {
    _emergencyContacts = value;
    notifyListeners();
  }

  removeContact(int id){
    _emergencyContacts.removeWhere((element) => element.id == id);
    notifyListeners();
  }
  addContact(EmergencyContact value){
    _emergencyContacts.add(value);
    notifyListeners();
  }
}