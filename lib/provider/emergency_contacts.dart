import 'package:flutter/material.dart';

import '../entity/emergency_contact.dart';

class EmergencyContacts extends ChangeNotifier{
  List<EmergencyContact> _emergencyContacts = [EmergencyContact(1,"Ambulance", "1990"),EmergencyContact(2,"Police", "119"),EmergencyContact(3,"Hello", "+123")];

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