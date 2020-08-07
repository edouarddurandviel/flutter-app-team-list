class Team {
  Team({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  int id;
  String name;
  String username;
  String email;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
      };

  @override
  String toString() {
    return 'Team{id: $id, name: $name, username: $username, email: $email}';
  }
}
