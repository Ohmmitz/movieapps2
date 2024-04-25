import 'package:movieapps/movie.dart';

Movies? selectedMovie;

class Movies {
  final String name;
  final String releaseDate;
  final String posterUrl;
  final String short;
  final String cinema;
  final String time;
  final String rate;
  final String Genres;
  final String voice;
  final String showtime;

  Movies({
    required this.name,
    required this.releaseDate,
    required this.posterUrl,
    required this.short,
    required this.cinema,
    required this.time,
    required this.rate,
    required this.Genres,
    required this.voice,
    required this.showtime,
  });

  final List<Movies> movies = [
    Movies(
      name: 'Lahn-Mah',
      releaseDate: '2022-04-04',
      posterUrl: 'https://lh3.googleusercontent.com/pEXQ13Y_gC-OPK1A5qACt2TQpGOD0-SUb-dr4FrMI0Q97QAx_6Ib3gc38lJHsr8AT0Sn8I3Muh4IIRI8rrW16SemgNfGJPWBPAc=w260',
      short: 'เอ็ม (บิวกิ้น-พุฒิพงศ์ อัสสรัตนกุล) ตัดสินใจดร็อปเรียนตอนปีสี่ เพื่อมาเอาดีทางการเป็นนักแคสต์เกม แต่ทํายังไงก็ไม่รุ่ง เอ็มเลยคิดจะรวยด้วยการทํางานสบายๆ แบบ มุ่ย (ตู-ต้นตะวัน ตันติเวชกุล) ลูกพี่ลูกน้อง ที่รับดูแลอากงที่ป่วยระยะสุดท้าย จนกลายเป็นทายาทคนเดียวที่ได้รับมรดกเป็นบ้านราคากว่าสิบล้าน เส้นทางการเป็น เศรษฐีรออยู่ตรงหน้า เอ็มจึงอาสาไปดูแล อาม่า (แต๋ว-อุษา เสมคำ) ที่ตรวจพบว่าเป็นมะเร็ง และน่าจะมีชีวิตอยู่ได้อีกไม่เกินปี โดยหวังจะได้มรดกหลักล้านเช่นกัน เมื่อหลานกับม่าที่อายุห่างกันกว่า 50 ปี ต้องมาอยู่ร่วมกัน การต่อปากต่อคําจึงเกิดขึ้นในทุกโมเมนต์ แต่มันกลับ เป็นช่วงเวลาที่ทําให้อาม่าลืมเหงา จากการเฝ้ารอลูกชายคนโตอย่าง กู๋เคี้ยง (ดู๋-สัญญา คุณากร) ลูกสาวคนกลาง อย่าง แม่ของเอ็ม (เจีย-สฤญรัตน์ โทมัส) และลูกชายคนเล็กอย่าง กู๋โส่ย (เผือก-พงศธร จงวิลาส) ที่จะมาพร้อมหน้ากันตามเทศกาลต่างๆ เท่านั้น ไม่น่าเชื่อว่างานที่เริ่มต้นทําเพราะหวังรวย จะทําให้คนห่วยๆ อย่างเอ็มได้รู้ว่า คําว่า “ครอบครัว” มีค่ามากกว่าเงิน ',
      cinema: 'Screen 1',
      time: '125min',
      rate: 'Rate:G',
      Genres: 'Family',
      voice:'TH SUB:ENG',
      showtime: '10:00 , 12:45 ,14:30 , 16:15 , 19:00 ,21:45 ,23:30',
    ),
    Movies(
      name: 'Godzilla x Kong : The New Empire',
      releaseDate: '2024-03-28',
      posterUrl: 'https://lh3.googleusercontent.com/trEAcCfXXkS5tCV2SjElh8hq_58u0tUrs39G5m-WiInpBc9-FebrrPhwQIjNMBTUhc31JD1uLhcKKOEvOT54U-c_PEPZHYsDLA=w260',
      short: 'Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence - and our own. Delve further into the histories of these Titans, their origins and the mysteries of Skull Island and beyond, and uncover the mythic battle that helped forge these extraordinary beings and tied them to humankind forever.',
      cinema: 'Screen 2',
      time: '115min',
      rate: 'Rate:G',
      Genres: 'Genre: Action, Adventure, Sci - Fi',
      voice:'ENG SUB: ENG/TH',
      showtime: '11:00 , 13:30 ,16:00 , 18:30',
    ),
    Movies(
      name: 'Immaculate',
      releaseDate: '2024-03-21',
      posterUrl: 'https://lh3.googleusercontent.com/wB-O33vu2LLResdLB4ihXGJQP2CZ2I7fe4_FHUOsvd2e545rlBS0F_1mRO0uZtdg0O9ZcUVz0RZrtjaGJGN57macWshJ2vwZEA=w260',
      short: 'Cecilia, a woman of devout faith, is offered a fulfilling new role at an illustrious Italian convent. Her warm welcome to the picture-perfect Italian countryside is soon interrupted as it becomes clearer to Cecilia that her new home harbors some dark and horrifying secrets.',
      cinema: 'Screen 3',
      time: '90min',
      rate: 'Rate:18',
      Genres: 'Genre: Horror, Mystery',
      voice:'ENG SUB:TH',
      showtime: '11:00 , 14:00 ,17:00 , 20:00',
    ),
    Movies(
      name: 'Dune : Part Two',
      releaseDate: '2024-02-29',
      posterUrl: 'https://lh3.googleusercontent.com/At7-P67j4DaB3OmtnAKyh4CPu3x-GuDonJ80Z3ypCfrWEZEwzO9-nBWf-f8F3KINrHVrBLmUltEXjmgY2RLbLoCFNDRNb7XdXw=w260',
      short: 'This follow-up film will explore the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a warpath of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, he endeavors to prevent a terrible future only he can foresee.',
      cinema: 'Screen 4',
      time: '165min',
      rate: 'Rate:G',
      Genres: 'Genre: Action, Adventure, Drama',
      voice:'ENG SUB:TH',
      showtime: '11:00 , 14:00 ,17:00 , 20:00',
    ),
    Movies(
      name: 'Kung Fu Panda 4',
      releaseDate: '2024-03-07',
      posterUrl: 'https://lh3.googleusercontent.com/5U3o9cOloz01BbVZgqd9EnX6YR49SkMv22EROs8h9JvR6YQ2UMHuaV9odebRk1Hxs80cumWB80njRihnqLbMwG7dwjwCke5xYmE=w260',
      short: 'Po is set to become the new spiritual leader of the Valley of Peace, but before he can do that, he must find a successor to become the new Dragon Warrior. He appears to find one in Zhen, a fox with plenty of promising abilities but who doesn’t quite like the idea of Po training him.',
      cinema: 'Screen 5',
      time: '95min',
      rate: 'Rate:G',
      Genres: 'Genre: Action, Animation, Comedy',
      voice:'TH',
      showtime: '11:00 , 14:00 ,17:00 , 20:00',
    ),
    Movies(
      name: 'Hor Taew Tak The Finale',
      releaseDate: '2024-03-14',
      posterUrl: 'https://lh3.googleusercontent.com/v3axWOmBF5g3-ZGwJBxQZfM3-mviuGgdYQ2aEficAgV2VbfGVpXcjX7zK6vrquX7LWy0RIQocVukcYhVaw_k13CCWuqalgn6Wg=w260',
      short: '“เจ๊แต๋ว” “อาโคย” และ “แพนเค้ก” กับภาคสุดท้ายของหนังในตำนานของคนที่โตมากับ ”หอแต๋วแตก“ เดินทางมาถึงภาค 10 เรื่องราวแปลกๆ ทั้งผี ทั้งคน ที่เกิดขึ้นในหมู่บ้าน “สัปะหยด” แห่งนี้ เกิดจากใคร หรืออะไรกันแน่ ผีร้ายที่ว่าแน่ จะมาเก่งกว่าตัวมารดาของแทร่ได้ยังไง ฮาอาละวาดพร้อมกันในโรงภาพยนตร์',
      cinema: 'Screen 6',
      time: '105min',
      rate: 'Rate:15',
      Genres: 'Genre: Comedy',
      voice:'TH SUB:ENG',
      showtime: '11:00 , 14:00 ,17:00 , 20:00',
    ),
  ];
}
