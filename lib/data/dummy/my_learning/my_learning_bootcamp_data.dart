import 'package:oberi_mobile/asset_management.dart';

final myLearningBootcampDummyData = [
  {
    'status': 'Berlangsung',
    'bootcamp_status': 'initial',
    'title': 'Tips Public Speaking untuk \nSidang Skripsi',
    'price': 289000,
    'completed_chapter': 5,
    'chapter_count': 10,
    'banner': 'assets/images/oberi_bootcamp.png',
    // 'image': 'https://i.pravatar.cc/300?u=a042581f4e2',
    'image': LocalAsset.myLearningBootcamp1,
    'date': DateTime.now().add(const Duration(days: 18)),
    'mentor': 'Marilyn Workman',
    'detail': 'Pada acara ini peserta terlibat aktif berdiskusi dan bermain '
        'peran untuk memahami cara berbicara yang sistematis dan mempengaruhi orang lain. '
        'Pada acara ini peserta terlibat aktif berdiskusi dan bermain '
        'peran untuk memahami cara berbicara yang sistematis dan mempengaruhi orang lain. '
        'Pada acara ini peserta terlibat aktif berdiskusi dan bermain '
        'peran untuk memahami cara berbicara yang sistematis dan mempengaruhi orang lain. ',
    'location': 'zoom',
    'duration': 60,
    'benefit': [
      {
        'title': 'Belajar Bersama Mentor Berpengalaman',
        'description':
            'Belajar secara live bareng mentor berpengalaman di bidangnya',
      },
      {
        'title': 'Reading Material & Kuis',
        'description':
            'Pelajari teori sesuai kebutuhan dan ambil kuis kapanpun dari aplikasi',
      },
      {
        'title': 'E-Sertifikat',
        'description':
            'Dapatkan sertifikat keahlian yang bisa kamu masukkan ke portfolio',
      },
    ],
    'silabus': [
      {
        'level': 'Free Course',
        'status': 'done',
        'course': [
          {
            'title': 'Chapter 1',
            'description': 'Basic Public Speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 5,
                'total': 5,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Post Test',
                'count': 1,
                'total': 1,
              },
            ],
          },
          {
            'title': 'Chapter 2',
            'description': 'Basic public speaking in  working area',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 5,
                'total': 5,
              },
              {
                'title': 'Video dasar Public Speaking in Work Area',
                'count': 3,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 2,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 3',
            'description':
                'Basic material Things that must be considered in public speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Artikel',
                'count': 5,
                'total': 5,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Post Test',
                'count': 1,
                'total': 1,
              },
            ],
          },
        ],
      },
      {
        'level': 'Silver',
        'status': 'progress',
        'course': [
          {
            'title': 'Chapter 1',
            'status': 'progress',
            'description': 'Basic Public Speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'status': 'pretest',
                'title': 'Pre Test',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 8,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 3,
                'total': 3,
              },
              {
                'status': 'posttest',
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 2',
            'description': 'Basic public speaking in  working area',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 5,
              },
              {
                'title': 'Video dasar Public Speaking in Work Area',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 3',
            'description':
                'Basic material Things that must be considered in public speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Artikel',
                'count': 0,
                'total': 5,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 1,
              },
            ],
          },
        ]
      },
      {
        'level': 'Gold',
        'status': 'initial',
        'course': [
          {
            'title': 'Chapter 4',
            'description': 'Basic Public Speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 5',
            'description': 'Basic public speaking in  working area',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 6',
            'description':
                'Basic material Things that must be considered in public speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 7',
            'description': 'Learn advanced speech techniques and practice',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
        ]
      },
      {
        'level': 'Platinum',
        'status': 'initial',
        'course': [
          {
            'title': 'Chapter 8',
            'description': 'Public speaking in debate',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 9',
            'description': 'Public speaking as MC',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 10',
            'description':
                'Final Project : Make your own project as public speaker',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
        ]
      },
    ]
  },
  {
    'status': 'Berlangsung',
    'bootcamp_status': 'upload_task',
    'title': 'Public Speaking in \nImportant Meeting',
    'price': 289000,
    'completed_chapter': 2,
    'chapter_count': 10,
    'banner': 'assets/images/oberi_bootcamp.png',
    'image': LocalAsset.myLearningBootcamp2,
    // 'image': 'https://i.pravatar.cc/300?u=a02581fe2',
    'date': DateTime.now().add(const Duration(days: 18)),
    'mentor': 'Marilyn Workman',
    'detail': 'Pada acara ini peserta terlibat aktif berdiskusi dan bermain '
        'peran untuk memahami cara berbicara yang sistematis dan mempengaruhi orang lain. '
        'Pada acara ini peserta terlibat aktif berdiskusi dan bermain '
        'peran untuk memahami cara berbicara yang sistematis dan mempengaruhi orang lain. '
        'Pada acara ini peserta terlibat aktif berdiskusi dan bermain '
        'peran untuk memahami cara berbicara yang sistematis dan mempengaruhi orang lain. ',
    'location': 'zoom',
    'duration': 60,
    'benefit': [
      {
        'title': 'Belajar Bersama Mentor Berpengalaman',
        'description':
            'Belajar secara live bareng mentor berpengalaman di bidangnya',
      },
      {
        'title': 'Reading Material & Kuis',
        'description':
            'Pelajari teori sesuai kebutuhan dan ambil kuis kapanpun dari aplikasi',
      },
      {
        'title': 'E-Sertifikat',
        'description':
            'Dapatkan sertifikat keahlian yang bisa kamu masukkan ke portfolio',
      },
    ],
    'silabus': [
      {
        'level': 'Free Course',
        'status': 'done',
        'course': [
          {
            'status': 'upload_task',
            'title': 'Chapter 1',
            'description': 'Basic Public Speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 5,
                'total': 5,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Post Test',
                'count': 1,
                'total': 1,
              },
            ],
          },
          {
            'title': 'Chapter 2',
            'description': 'Basic public speaking in  working area',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 5,
                'total': 5,
              },
              {
                'title': 'Video dasar Public Speaking in Work Area',
                'count': 3,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 2,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 3',
            'description':
                'Basic material Things that must be considered in public speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Artikel',
                'count': 5,
                'total': 5,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Post Test',
                'count': 1,
                'total': 1,
              },
            ],
          },
        ],
      },
      {
        'level': 'Silver',
        'status': 'progress',
        'course': [
          {
            'title': 'Chapter 1',
            'description': 'Essential material for public speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 8,
                'total': 8,
              },
              {
                'title': 'Upload Presentation',
                'status': 'upload_task',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 2',
            'description':
                'The primary material of public speaking in the world of work',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 3',
            'description':
                'Basic material Things that must be considered in public speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
        ]
      },
      {
        'level': 'Gold',
        'status': 'initial',
        'course': [
          {
            'title': 'Chapter 4',
            'description': 'The importance of public speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 5',
            'description':
                'How to craft powerful stories and influences audiences',
            'image': 'https://picsum.photos/200/300.jpg',
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 6',
            'description': 'Understand of public speaking',
            'image': 'https://picsum.photos/200/300.jpg',
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 7',
            'description': 'Learn advanced speech techniques and practice',
            'image': 'https://picsum.photos/200/300.jpg',
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
        ]
      },
      {
        'level': 'Platinum',
        'status': 'initial',
        'course': [
          {
            'title': 'Chapter 8',
            'description': 'Public speaking in debate',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 9',
            'description': 'Public speaking as MC',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 10',
            'description':
                'Final Project : Make your own project as public speaker',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
        ]
      },
    ]
  },
  {
    'status': 'Berlangsung',
    'bootcamp_status': 'remedial',
    'title': 'Public Speaking in urget event',
    'price': 289000,
    'completed_chapter': 3,
    'chapter_count': 10,
    'banner': 'assets/images/oberi_bootcamp.png',
    'image': LocalAsset.myLearningBootcamp3,
    // 'image': 'https://i.pravatar.cc/300?u=a0421f4e2',
    'date': DateTime.now().add(const Duration(days: 18)),
    'mentor': 'Marilyn Workman',
    'detail': 'Pada acara ini peserta terlibat aktif berdiskusi dan bermain '
        'peran untuk memahami cara berbicara yang sistematis dan mempengaruhi orang lain. '
        'Pada acara ini peserta terlibat aktif berdiskusi dan bermain '
        'peran untuk memahami cara berbicara yang sistematis dan mempengaruhi orang lain. '
        'Pada acara ini peserta terlibat aktif berdiskusi dan bermain '
        'peran untuk memahami cara berbicara yang sistematis dan mempengaruhi orang lain. ',
    'location': 'zoom',
    'duration': 60,
    'benefit': [
      {
        'title': 'Belajar Bersama Mentor Berpengalaman',
        'description':
            'Belajar secara live bareng mentor berpengalaman di bidangnya',
      },
      {
        'title': 'Reading Material & Kuis',
        'description':
            'Pelajari teori sesuai kebutuhan dan ambil kuis kapanpun dari aplikasi',
      },
      {
        'title': 'E-Sertifikat',
        'description':
            'Dapatkan sertifikat keahlian yang bisa kamu masukkan ke portfolio',
      },
    ],
    'silabus': [
      {
        'level': 'Free Course',
        'status': 'done',
        'course': [
          {
            'title': 'Chapter 1',
            'description': 'Basic Public Speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 5,
                'total': 5,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Post Test',
                'count': 1,
                'total': 1,
              },
            ],
          },
          {
            'title': 'Chapter 2',
            'description': 'Basic public speaking in  working area',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 5,
                'total': 5,
              },
              {
                'title': 'Video dasar Public Speaking in Work Area',
                'count': 3,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 2,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 3',
            'description':
                'Basic material Things that must be considered in public speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Artikel',
                'count': 5,
                'total': 5,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Post Test',
                'count': 1,
                'total': 1,
              },
            ],
          },
        ],
      },
      {
        'level': 'Silver',
        'status': 'remedial',
        'course': [
          {
            'title': 'Chapter 1',
            'description': 'Essential material for public speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 1,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 8,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 3,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'status': 'remedial',
                'count': 1,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 2',
            'description':
                'The primary material of public speaking in the world of work',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 3',
            'description':
                'Basic material Things that must be considered in public speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
        ]
      },
      {
        'level': 'Gold',
        'status': 'initial',
        'course': [
          {
            'title': 'Chapter 4',
            'description': 'The importance of public speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 5',
            'description':
                'How to craft powerful stories and influences audiences',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 6',
            'description': 'Understand of public speaking',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 7',
            'description': 'Learn advanced speech techniques and practice',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
        ]
      },
      {
        'level': 'Platinum',
        'status': 'initial',
        'course': [
          {
            'title': 'Chapter 8',
            'description': 'Public speaking in debate',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 9',
            'description': 'Public speaking as MC',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
          {
            'title': 'Chapter 10',
            'description':
                'Final Project : Make your own project as public speaker',
            // 'image': 'https://picsum.photos/200/300.jpg',
            'image': LocalAsset.materiStep5,
            'chapters': [
              {
                'title': 'Pre Test',
                'count': 0,
                'total': 1,
              },
              {
                'title': 'Artikel',
                'count': 0,
                'total': 8,
              },
              {
                'title': 'Video Dasar - dasar Public Speaking',
                'count': 0,
                'total': 3,
              },
              {
                'title': 'Post Test',
                'count': 0,
                'total': 2,
              },
            ],
          },
        ]
      },
    ]
  },
];
