class User {
  final int idUsuario;   // corresponde ao id_usuario do backend
  final String nome;
  final String email;
  final String? senhaHash;
  final String? paisOrigem;
  final String? idiomaNativo;
  final String? dataNascimento;

  User({
    required this.idUsuario,
    required this.nome,
    required this.email,
    this.senhaHash,
    this.paisOrigem,
    this.idiomaNativo,
    this.dataNascimento,
  });

  // 🔄 Construtor a partir do JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUsuario: json['id_usuario'],
      nome: json['nome'],
      email: json['email'],
      senhaHash: json['senhaHash'],
      paisOrigem: json['paisOrigem'],
      idiomaNativo: json['idiomaNativo'],
      dataNascimento: json['dataNascimento'],
    );
  }

  // 🔄 Converter para JSON (caso queira enviar ao backend)
  Map<String, dynamic> toJson() {
    return {
      'id_usuario': idUsuario,
      'nome': nome,
      'email': email,
      'senhaHash': senhaHash,
      'paisOrigem': paisOrigem,
      'idiomaNativo': idiomaNativo,
      'dataNascimento': dataNascimento,
    };
  }
}
