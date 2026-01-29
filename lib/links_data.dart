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
        "url": "https://vahan.parivahan.gov.in/nrservices/faces/user/citizen/citizenlogin.xhtml", // UPDATED
        "desc": "Check Owner Name, Age & Fuel Type."
      },
      {
        "name": "Driving License (DL)",
        "url": "https://parivahan.gov.in/rcdlstatus/?pur_cd=101",
        "desc": "Verify if a License is valid."
      },
      {
        "name": "Stolen Vehicle Check",
        "url": "https://zipnet.delhipolice.gov.in/VehiclesMobiles/MissingVehicles", // UPDATED
        "desc": "Search National Crime Records."
      },
      {
        "name": "e-Challan Check",
        "url": "https://echallan.parivahan.gov.in/index/accused-challan",
        "desc": "Check for unpaid Traffic Fines."
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
        "name": "Passport Status",
        "url": "https://services2.passportindia.gov.in/forms/PreLogin", // UPDATED (Clean Link)
        "desc": "Track your Passport Application."
      },
      {
        "name": "Download Voter Slip",
        "url": "https://electoralsearch.eci.gov.in/",
        "desc": "Print your Voting Slip."
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
        "name": "Company Check",
        "url": "https://www.filesure.in/search/company", // UPDATED
        "desc": "Search Company & Director Details."
      },
      {
        "name": "MSME Verify",
        "url": "https://udyamregistration.gov.in/udyam_verify.aspx", // UPDATED
        "desc": "Verify Small Business Registration."
      },
      {
        "name": "GST Verification",
        "url": "https://services.gst.gov.in/services/searchtp",
        "desc": "Verify Shop Legal Name & Status."
      },
      {
        "name": "FSSAI License Check",
        "url": "https://foscos.fssai.gov.in/",
        "desc": "Verify Food/Restaurant License."
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
