// lib/links_data.dart

final Map<String, dynamic> gridCategories = {
  // 🚘 ASSETS
  "ASSETS": {
    "title": "Assets & Transport",
    "icon": "directions_car",
    "color": 0xFF4CAF50, // Green
    "tools": [
      {
        "name": "Vehicle RC Status",
        "url": "https://parivahan.gov.in/rcdlstatus/?pur_cd=102",
        "desc": "Check Owner Name & Vehicle Age."
      },
      {
        "name": "Driving License (DL)",
        "url": "https://parivahan.gov.in/rcdlstatus/?pur_cd=101",
        "desc": "Verify License Validity & Class."
      },
      {
        "name": "e-Challan (Fines)",
        "url": "https://echallan.parivahan.gov.in/index/accused-challan",
        "desc": "Check Unpaid Traffic Police Fines."
      },
      {
        "name": "Stolen Vehicle Check",
        "url": "https://digitalpolice.gov.in/",
        "desc": "Search National Crime Records (NCRB)."
      }
    ]
  },

  // 👤 IDENTITY
  "IDENTITY": {
    "title": "Identity & Background",
    "icon": "person",
    "color": 0xFF2196F3, // Blue
    "tools": [
      {
        "name": "Aadhaar Validity",
        "url": "https://myaadhaar.uidai.gov.in/verifyAadhaar",
        "desc": "Verify Number Exists & Age Band."
      },
      {
        "name": "Voter ID Search",
        "url": "https://electoralsearch.eci.gov.in/",
        "desc": "Check Name & Polling Station."
      },
      {
        "name": "Passport Status",
        "url": "https://passportindia.gov.in/AppOnlineProject/statusTracker/trackStatusInpNew",
        "desc": "Track Application & Name Details."
      },
      {
        "name": "Court Case Search",
        "url": "https://services.ecourts.gov.in/ecourtindia_v6/",
        "desc": "Search Criminal/Civil Cases by Name."
      },
      {
        "name": "Active SIM Check",
        "url": "https://tafcop.sancharsaathi.gov.in/telecomUser/",
        "desc": "Check Mobile Numbers on your ID."
      },
      {
        "name": "Vaccine (Cowin)",
        "url": "https://selfregistration.cowin.gov.in/",
        "desc": "Download Vaccination Certificate."
      }
    ]
  },

  // 🏢 BUSINESS
  "BUSINESS": {
    "title": "Business & Shops",
    "icon": "store",
    "color": 0xFFFF9800, // Orange
    "tools": [
      {
        "name": "GST Verification",
        "url": "https://services.gst.gov.in/services/searchtp",
        "desc": "Verify Shop Legal Name & Status."
      },
      {
        "name": "MSME / Udyam",
        "url": "https://udyamregistration.gov.in/UA/PrintApplication.aspx",
        "desc": "Verify Small Business Registration."
      },
      {
        "name": "Company Check (MCA)",
        "url": "https://www.mca.gov.in/content/mca/global/en/mca/master-data/MDS.html",
        "desc": "Verify Pvt Ltd Company Directors."
      },
      {
        "name": "FSSAI Food License",
        "url": "https://foscos.fssai.gov.in/",
        "desc": "Verify Restaurant/Food License."
      }
    ]
  },

  // 💰 FINANCE
  "FINANCE": {
    "title": "Finance & Employment",
    "icon": "account_balance_wallet",
    "color": 0xFF9C27B0, // Purple
    "tools": [
      {
        "name": "Verify PAN Details",
        "url": "https://eportal.incometax.gov.in/iec/foservices/#/pre-login/verifyYourPAN",
        "desc": "Match Name & DOB (Gold Standard)."
      },
      {
        "name": "PAN-Aadhaar Link",
        "url": "https://eportal.incometax.gov.in/iec/foservices/#/pre-login/link-aadhaar-status",
        "desc": "Cross-check Person Identity."
      },
      {
        "name": "EPFO / UAN Status",
        "url": "https://passbook.epfindia.gov.in/MemberPassBook/Login",
        "desc": "Check PF Balance & Job History."
      },
      {
        "name": "Income Tax Login",
        "url": "https://eportal.incometax.gov.in/iec/foservices/#/login",
        "desc": "File ITR or Check Returns."
      }
    ]
  }
};
