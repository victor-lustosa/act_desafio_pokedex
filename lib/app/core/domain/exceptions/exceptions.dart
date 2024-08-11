 class SearchException implements Exception{
   final String message;
   SearchException(this.message);
 }
class GetException implements Exception{
  final String message;
  GetException(this.message);
}
class DetailException implements Exception{
  final String message;
  DetailException(this.message);
}