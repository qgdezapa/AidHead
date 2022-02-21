final questions = {
  "preliminary": [
    {
      "id": 1,
      "text": "What best describes the level of pain you are experiencing?",
      "answers": [
        {
          "id": 1,
          "text": "Excruciating pain",
          "indicates": {
            "cluster": 1.0,
            "migraine": 0.0,
            "tension": 0.0
          }
        },
        {
          "id": 2,
          "text": "Severe throbbing pain/pulsing sensation",
          "indicates": {
            "migraine": 1.0,
            "cluster": 0.0,
            "tension": 0.0
          }
        },
        {
          "id": 3,
          "text": "Sensation of tightness",
          "indicates": {
            "tension": 1.0,
            "migraine": 0.0,
            "cluster": 0.0
          }
        }
      ]
    },
    {
      "id": 2,
      "text": "Where is the pain most commonly located?",
      "answers": [
        {
          "id": 1,
          "text": "Behind/around one eye or along the face/neck",
          "indicates": {
            "cluster": 1.0,
            "migraine": 0.25,
            "tension": 0.0
          }
        },
        {
          "id": 2,
          "text": "One side of the head",
          "indicates": {
            "migraine": 1.0,
            "cluster": 0.25,
            "tension": 0.0
          }
        },
        {
          "id": 3,
          "text": "Across the forehead, the sides of your head, or behind your head",
          "indicates": {
            "tension": 1.0,
            "migraine": 0.25,
            "cluster": 0.0
          }
        }
      ]
    },
    {
      "id": 3,
      "text": "How long have you been experiencing the headache?",
      "answers": [
        {
          "id": 1,
          "text": "A few hours",
          "indicates": {
            "cluster": 0.0,
            "migraine": 0.25,
            "tension": 0.0
          }
        },
        {
          "id": 2,
          "text": "A few days",
          "indicates": {
            "migraine": 1.0,
            "cluster": 0.25,
            "tension": 0.0
          }
        },
        {
          "id": 3,
          "text": "A few weeks",
          "indicates": {
            "tension": 1.0,
            "migraine": 0.25,
            "cluster": 0.0
          }
        },
        {
          "id": 4,
          "text": "A few months",
          "indicates": {
            "tension": 1.0,
            "migraine": 0.25,
            "cluster": 0.0
          }
        }
      ]
    }
  ],
  "common_symptoms": [
    {
      "id": 1,
      "text": "Restlessness",
      "indicates": {
        "cluster": 1.0,
        "migraine": 0.0,
        "tension": 0.0
      }
    },
    {
      "id": 2,
      "text": "Excessive tearing",
      "indicates": {
        "cluster": 1.0,
        "migraine": 0.0,
        "tension": 0.0
      }
    },
    {
      "id": 3,
      "text": "Red/reddish eye on the affected side",
      "indicates": {
        "cluster": 1.0,
        "migraine": 0.0,
        "tension": 0.0
      }
    },
    {
      "id": 4,
      "text": "Stuffy/runny nose",
      "indicates": {
        "cluster": 1.0,
        "migraine": 0.0,
        "tension": 0.0
      }
    },
    {
      "id": 5,
      "text": "Forehead/face is sweating on the affected side",
      "indicates": {
        "cluster": 1.0,
        "migraine": 0.0,
        "tension": 0.0
      }
    },
    {
      "id": 6,
      "text": "Pale skin/flushing face",
      "indicates": {
        "cluster": 1.0,
        "migraine": 0.0,
        "tension": 0.0
      }
    },
    {
      "id": 7,
      "text": "Swelling around the eye on the affected side",
      "indicates": {
        "cluster": 1.0,
        "migraine": 0.0,
        "tension": 0.0
      }
    },
    {
      "id": 8,
      "text": "Drooping eyelid on the affected side",
      "indicates": {
        "cluster": 1.0,
        "migraine": 0.0,
        "tension": 0.0
      }
    },
    {
      "id": 9,
      "text": "Recurring headache that lasts 15 mins. to 3 hours each time",
      "indicates": {
        "cluster": 1.0,
        "migraine": 0.0,
        "tension": 0.0
      }
    },
    {
      "id": 10,
      "text": "Constipation",
      "indicates": {
        "cluster": 0.0,
        "migraine": 1.0,
        "tension": 0.0
      }
    },
    {
      "id": 11,
      "text": "Mood swings",
      "indicates": {
        "cluster": 0.0,
        "migraine": 1.0,
        "tension": 0.0
      }
    },
    {
      "id": 12,
      "text": "Food cravings",
      "indicates": {
        "cluster": 0.0,
        "migraine": 1.0,
        "tension": 0.0
      }
    },
    {
      "id": 13,
      "text": "Stiff neck",
      "indicates": {
        "cluster": 0.333,
        "migraine": 0.333,
        "tension": 0.333
      }
    },
    {
      "id": 14,
      "text": "Increased thirst & urination",
      "indicates": {
        "cluster": 0.0,
        "migraine": 1.0,
        "tension": 0.0
      }
    },
    {
      "id": 15,
      "text": "Frequent yawning",
      "indicates": {
        "cluster": 0.0,
        "migraine": 1.0,
        "tension": 0.0
      }
    },
    {
      "id": 16,
      "text": "Nausea",
      "indicates": {
        "cluster": 0.0,
        "migraine": 1.0,
        "tension": 0.0
      }
    },
    {
      "id": 17,
      "text": "Vomiting",
      "indicates": {
        "cluster": 0.5,
        "migraine": 0.5,
        "tension": 0.0
      }
    },
    {
      "id": 18,
      "text": "Dull, aching pain",
      "indicates": {
        "cluster": 0.0,
        "migraine": 0.0,
        "tension": 1.0
      }
    },
    {
      "id": 19,
      "text": "Tenderness of scalp, neck, & shoulder",
      "indicates": {
        "cluster": 0.0,
        "migraine": 0.0,
        "tension": 1.0
      }
    }
  ],
  "final": [
    {
      "id": 1,
      "text": "Abrupt, severe headache",
      "indicates": {
        "cluster": 0.333,
        "migraine": 0.333,
        "tension": 0.333
      }
    },
    {
      "id": 2,
      "text": "Fever",
      "indicates": {
        "cluster": 0.333,
        "migraine": 0.333,
        "tension": 0.333
      }
    },
    {
      "id": 3,
      "text": "Mental confusion",
      "indicates": {
        "cluster": 0.333,
        "migraine": 0.333,
        "tension": 0.333
      }
    },
    {
      "id": 4,
      "text": "Seizures",
      "indicates": {
        "cluster": 0.333,
        "migraine": 0.333,
        "tension": 0.333
      }
    },
    {
      "id": 5,
      "text": "Numbness",
      "indicates": {
        "cluster": 0.333,
        "migraine": 0.333,
        "tension": 0.333
      }
    },
    {
      "id": 6,
      "text": "Double vision",
      "indicates": {
        "cluster": 0.0,
        "migraine": 0.5,
        "tension": 0.5
      }
    },
    {
      "id": 7,
      "text": "Weakness",
      "indicates": {
        "cluster": 0.0,
        "migraine": 0.5,
        "tension": 0.5
      }
    },
    {
      "id": 8,
      "text": "Difficulty speaking",
      "indicates": {
        "cluster": 0.333,
        "migraine": 0.333,
        "tension": 0.333
      }
    },
    {
      "id": 9,
      "text": "Recently had a head injury",
      "indicates": {
        "cluster": 0.333,
        "migraine": 0.333,
        "tension": 0.333
      }
    },
    {
      "id": 10,
      "text": "Headache gets worse after sudden movement (i.e. coughing)",
      "indicates": {
        "cluster": 0.0,
        "migraine": 1.0,
        "tension": 0.0
      }
    },
    {
      "id": 11,
      "text": "Experienced a sudden headache unlike any you've had",
      "indicates": {
        "cluster": 1.0,
        "migraine": 0.0,
        "tension": 0.0
      }
    },
    {
      "id": 12,
      "text": "Headache worsens and changes pattern overtime",
      "indicates": {
        "cluster": 1.0,
        "migraine": 0.0,
        "tension": 0.0
      }
    }
  ]
};

final doctors = [
  {
    "name": "David J. Capobianco, M.D.",
    "department": "Neurology",
    "location": "Jacksonville, FL",
    "areas of focus": "Headache, Cluster headache, Migraine",
    "image": "assets/images/david-capobianco.webp",
    "email": "davidcapobianco@gmail.com",
  },
  {
    "name": "Fred (Michael) M. Cutrer, M.D.",
    "department": "Neurology",
    "location": "Rochester, Minnesota",
    "areas of focus": "Cluster headache, Migraine",
    "image":"assets/images/fred-cutrer.webp",
    "email": "fredcutrer@gmail.com",
  },
  {
    "name": "Olga P. Fermo, M.D.",
    "department": "Neurology",
    "location": "Jacksonville, FL",
    "areas of focus": "Cluster headache, Migraine",
    "image":"assets/images/olga-fermo.webp",
    "email": "olgafermo@gmail.com",
  },
  {
    "name": "Rashmi B. Halker Singh, M.D.",
    "department": "Neurology",
    "location": "Phoenix, AZ",
    "areas of focus": "Cluster headache, Migraine",
    "image":"assets/images/rashmi-halker-singh.webp",
    "email": "rashmihalker@gmail.com",
  },
  {
    "name": "Narayan R. Kissoon, M.D.",
    "department": "Neurology",
    "location": "Rochester, MN",
    "areas of focus": "Cluster headache, Migraine",
    "image":"assets/images/narayan-kissoon.webp",
    "email": "narayankissoon@gmail.com",
  },
  {
    "name": "Todd D. Rozen, M.D.",
    "department": "Neurology",
    "location": "Jacksonville, FL",
    "areas of focus": "Headache, Cluster headache, Migraine",
    "image":"assets/images/todd-rozen.webp",
    "email": "toddrozen@gmail.com",
  },
  {
    "name": "Todd J. Schwedt, M.D.",
    "department": "Neurology",
    "location": "Phoenix, AZ",
    "areas of focus": "Headache, Cluster headache, Migraine",
    "image":"assets/images/todd-schwedt.webp",
    "email": "toddschwedt@gmail.com",
  },
  {
    "name": "Jonathan H. Smith, M.D.",
    "department": "Neurology",
    "location": "Phoenix, AZ",
    "areas of focus": "Cluster headache, Migraine",
    "image":"assets/images/jonathan-smith.webp",
    "email": "jonathansmith@gmail.com",
  },
  {
    "name": "Mark A. Whealy, M.D.",
    "department": "Neurology",
    "location": "Rochester, MN",
    "areas of focus": "Cluster , Migraine, Tension headache",
    "image":"assets/images/mark-whealy.webp",
    "email": "markwhealy@gmail.com",
  },
  {
    "name": "Amaal J. Starling, M.D.",
    "department": "Neurology",
    "location": "Phoenix, AZ",
    "areas of focus": "Headache, Migraine",
    "image":"assets/images/amaal-starling.webp",
    "email": "amaalstarling@gmail.com",
  },
  {
    "name": "Derek W. Stitt, M.D.",
    "department": "Neurology",
    "location": "Rochester, MN",
    "areas of focus": "Migraine",
    "image":"assets/images/derek-stitt.webp",
    "email": "derekstitt@gmail.com",
  },
  {
    "name": "Karen A. Truitt, D.O",
    "department": "Neurology",
    "location": "Rochester, MN",
    "areas of focus": "Migraine",
    "image":"assets/images/karen-truitt.webp",
    "email": "karentruitt@gmail.com",
  },
  {
    "name": "Juliana H. VanderPluym, M.D.",
    "department": "Neurology",
    "location": "Phoenix, AZ",
    "areas of focus": "Headache, Migraine",
    "image":"assets/images/juliana-vanderpluym.webp",
    "email": "julianavanderpluym@gmail.com",
  },
];


final category_doctors = {
  "cluster": ["David J. Capobianco, M.D.", "Fred (Michael) M. Cutrer, M.D.", "Olga P. Fermo, M.D.", "Rashmi B. Halker Singh, M.D.", "Narayan R. Kissoon, M.D.", "Todd D. Rozen, M.D.", "Todd J. Schwedt, M.D.", "Jonathan H. Smith, M.D.", "Mark A. Whealy, M.D."],
  "migraine": ["David J. Capobianco, M.D.", "Fred (Michael) M. Cutrer, M.D.", "Olga P. Fermo, M.D.", "Rashmi B. Halker Singh, M.D.", "Narayan R. Kissoon, M.D.", "Todd D. Rozen, M.D.", "Todd J. Schwedt, M.D.", "Jonathan H. Smith, M.D.", "Mark A. Whealy, M.D.", "Amaal J. Starling, M.D.", "Derek W. Stitt, M.D.", "Karen A. Truitt, D.O.", "Juliana H. VanderPluym, M.D."],
  "tension": ["Mark A. Whealy, M.D."]

};



// Variables for sizing the diagnosis page texts
double minAnswerFontSize = 16;
double minTitleFontSize = 18;

const Map<String, Map<String, dynamic>> remedies = {
  "cluster": {
    "description": "There's no cure for cluster headaches. The goal of treatment is to decrease the severity of pain, shorten the headache period and prevent the attacks. Due to the sudden onset and short duration of each attack, it's difficult to evaluate and treat; as such, fast-acting medications are required.",
    "doc_or_pharm": {
      "title": "Fast-acting treatments available from your doctor include",
      "treatments": [
        "Oxygen",
        "Triptans",
        "Octreotide",
        "Local anesthetics",
        "Dihydroergotamine",
      ],
    },
    "home": {
      "title": "Lifestyle and Home Remedies",
      "treatments": [
        "Stick to a regular sleep schedule",
        "Avoid alcohol",
      ],
    },
  },
  "migraine": {
    "description": "The pain from migraines can be mitigated with pain relief medications, or prevented altogether with certain medications or practices.",
    "home": {
      "title": "Lifestyle and Home Remedies",
      "treatments": [
        "Try relaxation techniques. Biofeedback and other forms of relaxation training teach you ways to deal with stressful situations, which might help reduce the number of migraines you have.",
        "Develop a sleeping and eating routine. Don't sleep too much or too little. Set and follow a consistent sleep and wake schedule daily. Try to eat meals at the same time every day.",
        "Drink plenty of fluids. Staying hydrated, particularly with water, might help.",
        "Keep a headache diary. Continue recording in your headache diary even after you see your doctor. It will help you learn more about what triggers your migraines and what treatment is most effective.",
        "Exercise regularly. Regular aerobic exercise reduces tension and can help prevent a migraine. If your doctor agrees, choose aerobic activity you enjoy, such as walking, swimming and cycling. Warm up slowly, however, because sudden, intense exercise can cause headaches.",
      ],
    },
  },
  "tension": {
    "description": "Tension headaches are the most common and are caused by the tensing of scalp/neck muscles. Activities that cause one's head to be held in one position for an extended period of time can cause this, or things like alcohol and fatigue.",
    "home": {
      "title": "Lifestyle and Home Remedies",
      "treatments": [
        "Manage your stress level. One way to help reduce stress is by planning ahead and organizing your day. Another way is to allow more time to relax. And if you're caught in a stressful situation, consider stepping back.",
        "Go hot or cold. Applying heat or ice — whichever you prefer — to sore muscles may ease a tension headache. For heat, use a heating pad set on low, a hot-water bottle, a warm compress or a hot towel. A hot bath or shower also may help. For cold, wrap ice, an ice pack or frozen vegetables in a cloth to protect your skin.",
        "Perfect your posture. Good posture can help keep your muscles from tensing. When standing, hold your shoulders back and your head level. Pull in your abdomen and buttocks. When sitting, make sure your thighs are parallel to the ground and your head isn't slumped forward.",
        "Cut back on alcohol and caffeine consumption.",
        "Keep track of what triggers your tension headaches by making a journal or diary of when your headaches occur and what you did beforehand.",
      ],
    },
  },
};

// max cluster = 16.164 -> 12.664 (after compensation)
//-> 3 (prelim) + 8.833 (common symp) + 4.331 (final)
//   1            0.6415              + 0.923

// max migraine = 14.164 -> 12.668 (after compensation)
//-> 3 (prelim) + 6.833 (common symp) + 4.331 (final)
//-> 1            0.83                  0.923

// max tension = 7.664 -> 12.6634 (after compensation)
//-> 3 (prelim) + 1.333 (common symp) +  3.331 (final)
//   1            4.251                  1.2

// For more exact measurements, add all of the possible
// points for each type of headache in each phase and divide
// the answer by the total points of each illness in that 
// phase. (ex. ((8.833 + 6.833 + 1.333) / 3) / 1.333 ≈ 4.251

// These compensation factors make each point of
// a type of headache in each phase worth as much as
// the other types when added up.

const compensation_factors = {
  "cluster" : {
    "prelim": 1.0,
    "common" : 0.6415,
    "final": 0.923,
  },
  "migraine" : {
    "prelim": 1.0,
    "common" : 0.83,
    "final": 0.923,
  },
  "tension" : {
    "prelim": 1.0,
    "common" : 4.251,
    "final": 1.2,
  }
};

double threshholdStandardDeviation = 1;
double threshholdPercentDiff = 0.15;