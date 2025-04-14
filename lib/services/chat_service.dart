import 'dart:math';

class ChatService {
  // Daftar respons statis untuk berbagai topik kehamilan
  static final Map<String, List<String>> _responses = {
    'nutrisi': [
      'Selama kehamilan, penting untuk mengonsumsi makanan kaya asam folat seperti sayuran hijau, kacang-kacangan, dan buah-buahan.',
      'Pastikan asupan protein cukup dari telur, ikan, daging tanpa lemak, dan produk susu rendah lemak.',
      'Jangan lupa minum air putih minimal 8 gelas sehari untuk mencegah dehidrasi.',
    ],
    'olahraga': [
      'Jalan kaki 30 menit sehari adalah olahraga yang aman untuk ibu hamil.',
      'Yoga prenatal dapat membantu meredakan ketegangan dan mempersiapkan persalinan.',
      'Berenang adalah olahraga yang bagus karena mengurangi beban pada sendi.',
    ],
    'keluhan': [
      'Morning sickness bisa diatasi dengan makan porsi kecil tapi sering.',
      'Untuk mengurangi sakit punggung, perhatikan postur dan hindari mengangkat beban berat.',
      'Jika mengalami kram kaki, coba konsumsi makanan kaya magnesium dan kalsium.',
    ],
    'persiapan': [
      'Mulai siapkan perlengkapan bayi sejak trimester kedua.',
      'Ikuti kelas prenatal untuk mempersiapkan persalinan.',
      'Diskusikan rencana persalinan dengan dokter atau bidan.',
    ],
    'default': [
      'Jangan ragu untuk berkonsultasi dengan dokter atau bidan jika ada keluhan.',
      'Penting untuk rutin memeriksakan kehamilan sesuai jadwal.',
      'Istirahat yang cukup sangat penting untuk kesehatan ibu dan janin.',
    ],
  };

  Future<Map<String, dynamic>> sendMessage(String message) async {
    // Identifikasi topik dari pesan
    String topic = _identifyTopic(message.toLowerCase());
    
    // Pilih respons acak dari topik yang sesuai
    final responses = _responses[topic] ?? _responses['default']!;
    final response = responses[Random().nextInt(responses.length)];

    // Simulasi delay untuk efek natural
    await Future.delayed(const Duration(seconds: 1));

    return {
      'choices': [
        {
          'message': {
            'content': response,
          }
        }
      ]
    };
  }

  String _identifyTopic(String message) {
    if (message.contains('makan') || 
        message.contains('nutrisi') || 
        message.contains('vitamin')) {
      return 'nutrisi';
    }
    if (message.contains('olahraga') || 
        message.contains('gerak') || 
        message.contains('senam')) {
      return 'olahraga';
    }
    if (message.contains('mual') || 
        message.contains('sakit') || 
        message.contains('nyeri')) {
      return 'keluhan';
    }
    if (message.contains('persiapan') || 
        message.contains('persalinan') || 
        message.contains('melahirkan')) {
      return 'persiapan';
    }
    return 'default';
  }
} 