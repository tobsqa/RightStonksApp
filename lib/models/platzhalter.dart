class Searchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 5, left: 75, right: 15),
                  child: SizedBox(
                      height: 50,
                      child: TextField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              hintText: 'Search',
                              prefix: Icon(Icons.search,
                                  color: Colors.grey[500], size: 20),
                              fillColor: Colors.grey[900],
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(16))))))),
            ],
          ),
        ));
  }
}