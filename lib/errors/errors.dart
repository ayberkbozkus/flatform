class Errors {
  static String show(String errorCode){

    switch(errorCode){
      case 'email-already-in-use': 
        return 'Bu mail adresi zaten kullanımda, başka br mail kullanınız';
      default:
        return 'Bir hata oluştu';
    }

  }
}