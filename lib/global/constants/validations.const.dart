import 'dart:developer';

class TextFieldValidation {

  TextFieldValidation(){
    log('calling TextFieldValidation');
  }
  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$')
        .hasMatch(value)) {
      return '8 characters, 1 uppercase letter, 1 lowercase letter, and 1 special character.';
    }
    return null;
  }

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please provide your inputs';
    } else if (value.length < 3) {
      return 'Minimum 3 letters required';
    }
    return null;
  }

  String? pinCodeValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    } else if (!RegExp(r'^[1-9][0-9]{5}$').hasMatch(value)) {
      return 'Invalid pincode';
    }
    return null;
  }

  String? phoneValidation(String? value,int? numberMaxLength,int? numberMinLength) {
    if (value == null || value.isEmpty) {
      log(numberMaxLength.toString(),name: 'max length');
      log(numberMinLength.toString(),name: 'min length');
      return 'Phone number field cannot be empty';
    } else if (value.length > (numberMaxLength??0)||value.length < (numberMinLength??0)) {
      return 'Invalid mobile number';
    }
    return null;
  }

  String? idValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid id';
    } else if (!RegExp(r'^[1-9][0-9]{5}$').hasMatch(value)) {
      return 'Invalid id';
    }
    return null;
  }
}
