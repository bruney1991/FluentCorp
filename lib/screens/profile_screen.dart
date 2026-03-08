import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String userName;

  const ProfileScreen({Key? key, this.userName = 'Usuário'}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String currentName;
  bool isDarkMode = false;
  bool hasProfilePhoto = false; 

  @override
  void initState() {
    super.initState();
    currentName = widget.userName;
  }

 
  Color get primaryColor => isDarkMode ? Color(0xFF3F51B5) : Color(0xFF1A237E);
  Color get accentColor => isDarkMode ? Color(0xFF5C6BC0) : Color(0xFF283593);
  Color get backgroundColor => isDarkMode ? Color(0xFF121212) : Color(0xFFF5F7FA);
  Color get cardColor => isDarkMode ? Color(0xFF1E1E1E) : Colors.white;
  Color get textColor => isDarkMode ? Colors.white : Color(0xFF263238);
  Color get subtitleColor => isDarkMode ? Colors.grey[400]! : Colors.grey[600]!;
  Color get borderColor => isDarkMode ? Colors.grey[800]! : Colors.grey.shade200;

  
  void _changeProfilePhoto() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Abrindo a galeria de fotos... (Requer pacote image_picker)'),
        backgroundColor: primaryColor,
      ),
    );
    
    
    setState(() {
      hasProfilePhoto = !hasProfilePhoto; 
    });
  }

 
  void _editProfile() {
    TextEditingController nameController = TextEditingController(text: currentName);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: cardColor,
        title: Text('Editar Perfil', style: TextStyle(color: textColor)),
        content: TextField(
          controller: nameController,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            labelText: 'Nome Completo',
            labelStyle: TextStyle(color: subtitleColor),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: subtitleColor)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('CANCELAR', style: TextStyle(color: subtitleColor)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {
              setState(() {
                currentName = nameController.text;
              });
              Navigator.pop(context);
            },
            child: Text('SALVAR', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'MEU PERFIL', 
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 1.2, color: Colors.white)
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: _editProfile,
            tooltip: 'Editar Dados',
          )
        ],
      ), 
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryColor, accentColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                // Card do Perfil
                Container(
                  margin: EdgeInsets.fromLTRB(16, 60, 16, 0),
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: cardColor, width: 4),
                              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                            ),
                            child: CircleAvatar(
                              radius: 45,
                              backgroundColor: isDarkMode ? Colors.grey[800] : primaryColor,
                              // Simulação de foto vs Letra inicial
                              child: hasProfilePhoto
                                  ? Icon(Icons.person, size: 50, color: Colors.white) // Simula a foto
                                  : Text(
                                      currentName.isNotEmpty ? currentName[0].toUpperCase() : 'U',
                                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                            ),
                          ),
                          
                          GestureDetector(
                            onTap: _changeProfilePhoto,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.amber[700],
                                shape: BoxShape.circle,
                                border: Border.all(color: cardColor, width: 2),
                              ),
                              child: Icon(Icons.camera_alt, size: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        currentName,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
                      ),
                      Text(
                        'Senior Developer • Tech Dept.',
                        style: TextStyle(fontSize: 14, color: subtitleColor),
                      ),
                      SizedBox(height: 16),
                      
                      OutlinedButton.icon(
                        onPressed: _editProfile, 
                        icon: Icon(Icons.edit, size: 16), 
                        label: Text('Modificar Perfil'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: primaryColor,
                          side: BorderSide(color: primaryColor.withOpacity(0.5)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                      ),
                      
                      SizedBox(height: 24),
                      
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Nível B2 (Intermediário)', style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor, fontSize: 12)),
                          Text('1250 / 2000 XP', style: TextStyle(color: subtitleColor, fontSize: 12)),
                        ],
                      ),
                      SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 0.62,
                          backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.amber[700]!),
                          minHeight: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 24),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('DASHBOARD PESSOAL', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: subtitleColor, letterSpacing: 1.0)),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildStatCard('Total Palavras', '450', Icons.book, primaryColor)),
                      SizedBox(width: 12),
                      Expanded(child: _buildStatCard('Sequência', '12 Dias', Icons.local_fire_department, Colors.amber[800]!)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildStatCard('Lições', '28', Icons.check_circle, Colors.green[700]!)),
                      SizedBox(width: 12),
                      Expanded(child: _buildStatCard('Horas', '14h', Icons.timer, isDarkMode ? Colors.blueGrey[300]! : Color(0xFF455A64))),
                    ],
                  ),
                  
                  SizedBox(height: 32),
                  
                  Text('PREFERÊNCIAS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: subtitleColor, letterSpacing: 1.0)),
                  SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(8), border: Border.all(color: borderColor)),
                    child: Column(
                      children: [
                        // --- TOGGLE MODO ESCURO ---
                        SwitchListTile(
                          secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode, color: subtitleColor),
                          title: Text('Modo Escuro', style: TextStyle(fontSize: 14, color: textColor, fontWeight: FontWeight.w500)),
                          value: isDarkMode,
                          activeColor: primaryColor,
                          onChanged: (value) {
                            setState(() {
                              isDarkMode = value;
                            });
                          },
                        ),
                        Divider(height: 1, color: borderColor),
                        _buildSettingTile(Icons.notifications_outlined, 'Notificações de Estudo'),
                        Divider(height: 1, color: borderColor),
                        _buildSettingTile(Icons.language, 'Idioma do Sistema'),
                        Divider(height: 1, color: borderColor),
                        _buildSettingTile(Icons.headset_mic, 'Suporte Corporativo'),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 32),
                  
                  // Botão de Logout
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: cardColor,
                            title: Text('Sair do Sistema?', style: TextStyle(color: textColor)),
                            content: Text('Seu progresso não salvo será sincronizado na próxima vez.', style: TextStyle(color: subtitleColor)),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context), child: Text('CANCELAR', style: TextStyle(color: subtitleColor))),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); 
                                  Navigator.pop(context); 
                                },
                                child: Text('SAIR', style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.logout, size: 20),
                      label: Text('ENCERRAR SESSÃO', style: TextStyle(letterSpacing: 1.0)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red[400],
                        side: BorderSide(color: Colors.red[400]!.withOpacity(0.5)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildStatCard(String title, String value, IconData icon, Color iconColor) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: subtitleColor,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSettingTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: subtitleColor, size: 22),
      title: Text(title, style: TextStyle(fontSize: 14, color: textColor, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.chevron_right, size: 18, color: subtitleColor),
      onTap: () {},
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}