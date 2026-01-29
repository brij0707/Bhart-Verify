// lib/links_data.dart

// 1. Contact Configuration
const String contactEmail = "Innomind2022@gmail.com"; 
const String emailSubject = "Bharat Verify App Feedback";

// 2. The Data Structure
final Map<String, dynamic> gridCategories = {
  // ==============================
  // 🚘 ASSETS
  // ==============================
  "ASSETS": {
    "title": "Assets & Transport",
    "icon": "directions_car",
    "color": 0xFF4CAF50, // Green
    "verify": [
      {
        "name": "Vehicle RC Status",
        "url": "https://parivahan.gov.in/rcdlstatus/?pur_cd=102", // Fixed: 102 for Vehicle
        "desc": "Check Owner Name, Age & Fuel Type."
      },
      {
        "name": "Driving License (DL)",
        "url": "https://parivahan.gov.in/rcdlstatus/?pur_cd=101", // Fixed: 101 for License
        "desc": "Verify if a License is valid."
      },
      {
        "name": "e-Challan Check",
        "url": "https://echallan.parivahan.gov.in/index/accused-challan",
        "desc": "Check for unpaid Traffic Fines."
      },
      {
        "name": "Stolen Vehicle Check",
        "url": "https://digitalpolice.gov.in/",
        "desc": "Search National Crime Records (NCRB)."
      }
    ],
    "personal": [
      {
        "name": "Pay e-Challan",
        "url": "https://echallan.parivahan.gov.in/index/accused-challan",
        "desc": "Pay your pending traffic fines online."
      },
      {
        "name": "Apply for New DL",
        "url": "https://sarathi.parivahan.gov.in/sarathiservice/stateSelection.do",
        "desc": "Apply for Learner's or Driving License."
      },
      {
        "name": "Download Virtual RC",
        "url": "https://parivahan.gov.in/parivahan/",
        "desc": "Login to download RC to your phone."
      }
    ]
  },

  // ==============================
  // 👤 IDENTITY
  // ==============================
  "IDENTITY": {
    "title": "Identity & Background",
    "icon": "person",
    "color": 0xFF2196F3, // Blue
    "verify": [
      {
        "name": "Aadhaar Validity Check",
        "url": "https://myaadhaar.uidai.gov.in/verifyAadhaar",
        "desc": "Verify if an Aadhaar Number exists."
      },
      {
        "name": "Voter ID Search",
        "url": "https://electoralsearch.eci.gov.in/",
        "desc": "Search Name in Voter List."
      },
      {
        "name": "Court Case Search",
        "url": "https://services.ecourts.gov.in/ecourtindia_v6/",
        "desc": "Check for Criminal/Civil cases by Name."
      },
      {
        "name": "Active SIM Check",
        "url": "https://tafcop.sancharsaathi.gov.in/telecomUser/",
        "desc": "Count mobile numbers on this ID."
      }
    ],
    "personal": [
      {
        "name": "Download E-Aadhaar",
        "url": "https://myaadhaar.uidai.gov.in/genricDownloadAadhaar",
        "desc": "Download your official Aadhaar PDF."
      },
      {
        "name": "Download Voter Slip",
        "url": "https://electoralsearch.eci.gov.in/",
        "desc": "Print your Voting Slip."
      },
      {
        "name": "Passport Status",
        "url": "https://portal2.passportindia.gov.in/AppOnlineProject/statusTracker/trackStatusInpNew",
        "desc": "Track your Passport Application."
      }
    ]
  },

  // ==============================
  // 🏢 BUSINESS
  // ==============================
  "BUSINESS": {
    "title": "Business & Shops",
    "icon": "store",
    "color": 0xFFFF9800, // Orange
    "verify": [
      {
        "name": "GST Verification",
        "url": "https://services.gst.gov.in/services/searchtp",
        "desc": "Verify Shop Legal Name & Status."
      },
      {
        "name": "Company Check (MCA)",
        "url": "https://www.mca.gov.in/content/mca/global/en/mca/master-data/MDS.html",
        "desc": "Verify Pvt Ltd Company Directors."
      },
      {
        "name": "FSSAI License Check",
        "url": "https://foscos.fssai.gov.in/",
        "desc": "Verify Food/Restaurant License."
      },
      {
        "name": "MSME / Udyam Check",
        "url": "https://udyamregistration.gov.in/UA/PrintApplication.aspx",
        "desc": "Verify Small Business Registration."
      }
    ],
    "personal": [
      {
        "name": "Udyam Registration",
        "url": "https://udyamregistration.gov.in/UdyamRegistration.aspx",
        "desc": "Register a new MSME business."
      },
      {
        "name": "Register for GST",
        "url": "https://reg.gst.gov.in/registration/",
        "desc": "Apply for a new GST Number."
      }
    ]
  },

  // ==============================
  // 💰 FINANCE
  // ==============================
  "FINANCE": {
    "title": "Finance & Tax",
    "icon": "account_balance_wallet",
    "color": 0xFF9C27B0, // Purple
    "verify": [
      {
        "name": "Verify PAN Details",
        "url": "https://eportal.incometax.gov.in/iec/foservices/#/pre-login/verifyYourPAN",
        "desc": "Match Name & DOB (Gold Standard)."
      },
      {
        "name": "PAN-Aadhaar Link Status",
        "url": "https://eportal.incometax.gov.in/iec/foservices/#/pre-login/link-aadhaar-status",
        "desc": "Check if 2 IDs are linked."
      }
    ],
    "personal": [
      {
        "name": "File Income Tax (ITR)",
        "url": "https://eportal.incometax.gov.in/iec/foservices/#/login",
        "desc": "Login to file your taxes."
      },
      {
        "name": "Link PAN with Aadhaar",
        "url": "https://eportal.incometax.gov.in/iec/foservices/#/pre-login/bl-link-aadhaar",
        "desc": "Link your PAN to avoid penalties."
      },
      {
        "name": "EPFO Passbook",
        "url": "https://passbook.epfindia.gov.in/MemberPassBook/Login",
        "desc": "Check your PF Balance."
      }
    ]
  }
};
