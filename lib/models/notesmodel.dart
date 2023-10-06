class Notesmodel
{
  final String body;
  final String title;

    const Notesmodel
        ({

    required this.body,
      required this.title
});
    factory Notesmodel.fromJson(Map<String,dynamic>json){
      return Notesmodel(
        body: json['body'],
          title: json['title'],

      );
    }
}