// This file acts as your "Database" of links.
// If a government website changes, update the URL here.

final List<Map<String, String>> verificationLinks = [
  // --- BUSINESS CATEGORY ---
  {
    "category": "Business",
    "title": "GST Verification",
    "url": "https://services.gst.gov.in/services/searchtp",
    "instruction": "1. Click 'Search Taxpayer'.\n2. Select 'Search by GSTIN'.\n3. Paste the number."
  },
  {
    "category": "Business",
    "title": "MSME / Udyam",
    "url": "https://udyamregistration.gov.in/Government-of-India/Ministry-of-MSME/online-verify-udyam-registration-number.htm",
    "instruction": "Enter the Udyam Number and Captcha."
  },

  // --- ASSETS CATEGORY ---
  {
    "category": "Assets",
    "title": "Vehicle RC Status",
    "url": "https://parivahan.gov.in/rcdlstatus/?pur_cd=102",
    "instruction": "Enter Vehicle No (e.g., DL12AB1234) and solve the math."
  },
  {
    "category": "Assets",
    "title": "Driving License",
    "url": "https://parivahan.gov.in/rcdlstatus/?pur_cd=101",
    "instruction": "Enter DL Number and Date of Birth exactly as on card."
  },

  // --- IDENTITY CATEGORY ---
  {
    "category": "Identity",
    "title": "Aadhaar (Offline XML)",
    "url": "https://myaadhaar.uidai.gov.in/offline-ekyc",
    "instruction": "Login -> Download Offline KYC ZIP -> Upload here (Coming Soon)."
  },
  {
    "category": "Identity",
    "title": "Voter ID Search",
    "url": "https://electoralsearch.eci.gov.in/",
    "instruction": "Search by EPIC Number or Details."
  },

  // --- FINANCE CATEGORY ---
  {
    "category": "Finance",
    "title": "ITR Status (PAN)",
    "url": "https://eportal.incometax.gov.in/iec/foservices/#/pre-login/knowYourAO",
    "instruction": "Enter PAN and Mobile Number to verify validity."
  }
];
