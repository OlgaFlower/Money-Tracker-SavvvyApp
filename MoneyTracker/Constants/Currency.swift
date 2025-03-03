//
//  Currency.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 12.11.24.
//

import Foundation

enum Currency: String {

    case aed = "UAE Dirham (AED)"
    case all = "Albanian Lek (ALL)"
    case amd = "Armenian Dram (AMD)"
    case ang = "Netherlands Antillean Guilder (ANG)"
    case aoa = "Angolan Kwanza (AOA)"
    case ars = "Argentine Peso (ARS)"
    case aud = "Australian Dollar (AUD)"
    case awg = "Aruban Florin (AWG)"
    case azn = "Azerbaijani Manat (AZN)"
    case bam = "Bosnia and Herzegovina Convertible Mark (BAM)"
    case bbd = "Barbadian Dollar (BBD)"
    case bgn = "Bulgarian Lev (BGN)"
    case bhd = "Bahraini Dinar (BHD)"
    case bif = "Burundian Franc (BIF)"
    case bmd = "Bermudian Dollar (BMD)"
    case bnd = "Brunei Dollar (BND)"
    case bob = "Bolivian Boliviano (BOB)"
    case brl = "Brazilian Real (BRL)"
    case bsd = "Bahamian Dollar (BSD)"
    case bwp = "Botswana Pula (BWP)"
    case bzd = "Belize Dollar (BZD)"
    case cad = "Canadian Dollar (CAD)"
    case cdf = "Congolese Franc (CDF)"
    case chf = "Swiss Franc (CHF)"
    case clp = "Chilean Peso (CLP)"
    case cny = "Chinese Yuan (CNY)"
    case cop = "Colombian Peso (COP)"
    case crc = "Costa Rican Colón (CRC)"
    case cve = "Cape Verdean Escudo (CVE)"
    case czk = "Czech Koruna (CZK)"
    case djf = "Djiboutian Franc (DJF)"
    case dkk = "Danish Krone (DKK)"
    case dop = "Dominican Peso (DOP)"
    case dzd = "Algerian Dinar (DZD)"
    case egp = "Egyptian Pound (EGP)"
    case ern = "Eritrean Nakfa (ERN)"
    case etb = "Ethiopian Birr (ETB)"
    case eur = "Euro (EUR)"
    case fkp = "Falkland Islands Pound (FKP)"
    case gel = "Georgian Lari (GEL)"
    case gbp = "British Pound (GBP)"
    case ghs = "Ghanaian Cedi (GHS)"
    case gip = "Gibraltar Pound (GIP)"
    case gmd = "Gambian Dalasi (GMD)"
    case gnf = "Guinean Franc (GNF)"
    case gtq = "Guatemalan Quetzal (GTQ)"
    case gyd = "Guyanese Dollar (GYD)"
    case hkd = "Hong Kong Dollar (HKD)"
    case hnl = "Honduran Lempira (HNL)"
    case htg = "Haitian Gourde (HTG)"
    case huf = "Hungarian Forint (HUF)"
    case idr = "Indonesian Rupiah (IDR)"
    case ils = "Israeli Shekel (ILS)"
    case isk = "Icelandic Krona (ISK)"
    case jmd = "Jamaican Dollar (JMD)"
    case jod = "Jordanian Dinar (JOD)"
    case jpy = "Japanese Yen (JPY)"
    case kes = "Kenyan Shilling (KES)"
    case kgs = "Kyrgyzstani Som (KGS)"
    case khr = "Cambodian Riel (KHR)"
    case kmf = "Comorian Franc (KMF)"
    case krw = "South Korean Won (KRW)"
    case kwd = "Kuwaiti Dinar (KWD)"
    case kyd = "Cayman Islands Dollar (KYD)"
    case kzt = "Kazakhstani Tenge (KZT)"
    case lak = "Lao Kip (LAK)"
    case lbp = "Lebanese Pound (LBP)"
    case lkr = "Sri Lankan Rupee (LKR)"
    case lrd = "Liberian Dollar (LRD)"
    case lsl = "Lesotho Loti (LSL)"
    case lyd = "Libyan Dinar (LYD)"
    case mad = "Moroccan Dirham (MAD)"
    case mdl = "Moldovan Leu (MDL)"
    case mga = "Malagasy Ariary (MGA)"
    case mkd = "Macedonian Denar (MKD)"    
    case mnt = "Mongolian Tögrög (MNT)"
    case mop = "Macanese Pataca (MOP)"
    case mru = "Mauritanian Ouguiya (MRU)"
    case mur = "Mauritian Rupee (MUR)"
    case mvr = "Maldivian Rufiyaa (MVR)"
    case mwk = "Malawian Kwacha (MWK)"
    case mxn = "Mexican Peso (MXN)"
    case myr = "Malaysian Ringgit (MYR)"
    case mzn = "Mozambican Metical (MZN)"
    case nad = "Namibian Dollar (NAD)"
    case ngn = "Nigerian Naira (NGN)"
    case nio = "Nicaraguan Córdoba (NIO)"
    case nok = "Norwegian Krone (NOK)"
    case npr = "Nepalese Rupee (NPR)"
    case nzd = "New Zealand Dollar (NZD)"
    case omr = "Omani Rial (OMR)"
    case pab = "Panamanian Balboa (PAB)"
    case pen = "Peruvian Sol (PEN)"
    case pgk = "Papua New Guinean Kina (PGK)"
    case php = "Philippine Peso (PHP)"
    case pkr = "Pakistani Rupee (PKR)"
    case pln = "Polish Zloty (PLN)"
    case pyg = "Paraguayan Guarani (PYG)"
    case qar = "Qatari Riyal (QAR)"
    case ron = "Romanian Leu (RON)"
    case rsd = "Serbian Dinar (RSD)"
    case rwf = "Rwandan Franc (RWF)"
    case sar = "Saudi Riyal (SAR)"
    case sbd = "Solomon Islands Dollar (SBD)"
    case scr = "Seychellois Rupee (SCR)"
    case sek = "Swedish Krona (SEK)"
    case sgd = "Singapore Dollar (SGD)"
    case shp = "Saint Helena Pound (SHP)"
    case sll = "Sierra Leonean Leone (SLL)"
    case sos = "Somali Shilling (SOS)"
    case srd = "Surinamese Dollar (SRD)"
    case stn = "São Tomé and Príncipe Dobra (STN)"
    case svc = "Salvadoran Colón (SVC)"
    case szl = "Eswatini Lilangeni (SZL)"
    case thb = "Thai Baht (THB)"
    case tjs = "Tajikistani Somoni (TJS)"
    case tmt = "Turkmenistani Manat (TMT)"
    case tnd = "Tunisian Dinar (TND)"
    case top = "Tongan Paʻanga (TOP)"
    case tur = "Turkish Lira (TRY)"
    case ttd = "Trinidad and Tobago Dollar (TTD)"
    case twd = "New Taiwan Dollar (TWD)"
    case tzs = "Tanzanian Shilling (TZS)"
    case uah = "Ukrainian Hryvnia (UAH)"
    case ugx = "Ugandan Shilling (UGX)"
    case usd = "US Dollar (USD)"
    case uyu = "Uruguayan Peso (UYU)"
    case uzs = "Uzbekistani Som (UZS)"
    case vnd = "Vietnamese Dong (VND)"
    case xaf = "Central African CFA Franc (XAF)"
    case xcd = "East Caribbean Dollar (XCD)"
    case xof = "West African CFA Franc (XOF)"
    case yer = "Yemeni Rial (YER)"
    case zar = "South African Rand (ZAR)"
    case zmw = "Zambian Kwacha (ZMW)"
    
    var id: String {
        self.rawValue
    }
    
    var sign: String {
        
        switch self {
        case .aed:
            return "د.إ" // UAE Dirham
        case .all:
            return "L" // Albanian Lek
        case .amd:
            return "֏" // Armenian Dram
        case .ang:
            return "ƒ" // Netherlands Antillean Guilder
        case .aoa:
            return "Kz" // Angolan Kwanza
        case .ars:
            return "$" // Argentine Peso
        case .aud:
            return "$" // Australian Dollar
        case .awg:
            return "ƒ" // Aruban Florin
        case .azn:
            return "₼" // Azerbaijani Manat
        case .bam:
            return "KM" // Bosnia and Herzegovina Convertible Mark
        case .bbd:
            return "$" // Barbadian Dollar
        case .bgn:
            return "лв" // Bulgarian Lev
        case .bhd:
            return ".د.ب" // Bahraini Dinar
        case .bif:
            return "FBu" // Burundian Franc
        case .bmd:
            return "$" // Bermudian Dollar
        case .bnd:
            return "$" // Brunei Dollar
        case .bob:
            return "Bs." // Bolivian Boliviano
        case .brl:
            return "R$" // Brazilian Real
        case .bsd:
            return "$" // Bahamian Dollar
        case .bwp:
            return "P" // Botswana Pula
        case .bzd:
            return "BZ$" // Belize Dollar
        case .cad:
            return "$" // Canadian Dollar
        case .cdf:
            return "FC" // Congolese Franc
        case .chf:
            return "CHF" // Swiss Franc
        case .clp:
            return "$" // Chilean Peso
        case .cny:
            return "¥" // Chinese Yuan
        case .cop:
            return "$" // Colombian Peso
        case .crc:
            return "₡" // Costa Rican Colón
            
        case .cve:
            return "$" // Cape Verdean Escudo
        case .czk:
            return "Kč" // Czech Koruna
        case .djf:
            return "Fdj" // Djiboutian Franc
        case .dkk:
            return "kr" // Danish Krone
        case .dop:
            return "RD$" // Dominican Peso
        case .dzd:
            return "د.ج" // Algerian Dinar
        case .egp:
            return "ج.م" // Egyptian Pound
        case .ern:
            return "Nfk" // Eritrean Nakfa
        case .etb:
            return "Br" // Ethiopian Birr
        case .eur:
            return "€" // Euro
        case .fkp:
            return "£" // Falkland Islands Pound
        case .gbp:
            return "£" // British Pound
        case .gel:
            return "₾" // Georgian Lari
        case .ghs:
            return "₵" // Ghanaian Cedi
        case .gip:
            return "£" // Gibraltar Pound
        case .gmd:
            return "D" // Gambian Dalasi
        case .gnf:
            return "FG" // Guinean Franc
        case .gtq:
            return "Q" // Guatemalan Quetzal
        case .gyd:
            return "$" // Guyanese Dollar
        case .hkd:
            return "HK$" // Hong Kong Dollar
        case .hnl:
            return "L" // Honduran Lempira
        case .htg:
            return "G" // Haitian Gourde
        case .huf:
            return "Ft" // Hungarian Forint
        case .idr:
            return "Rp" // Indonesian Rupiah
        case .ils:
            return "₪" // Israeli Shekel
        case .isk:
            return "kr" // Icelandic Krona
        case .jmd:
            return "J$" // Jamaican Dollar
        case .jod:
            return "د.ا" // Jordanian Dinar
        case .jpy:
            return "¥" // Japanese Yen
        case .kes:
            return "KSh" // Kenyan Shilling
        case .kgs:
            return "с" // Kyrgyzstani Som
        case .khr:
            return "៛" // Cambodian Riel
        case .kmf:
            return "CF" // Comorian Franc
        case .krw:
            return "₩" // South Korean Won
        case .kwd:
            return "د.ك" // Kuwaiti Dinar
        case .kyd:
            return "$" // Cayman Islands Dollar
        case .kzt:
            return "₸" // Kazakhstani Tenge
        case .lak:
            return "₭" // Lao Kip
        case .lbp:
            return "ل.ل" // Lebanese Pound
        case .lkr:
            return "Rs" // Sri Lankan Rupee
        case .lrd:
            return "L$" // Liberian Dollar
        case .lsl:
            return "L" // Lesotho Loti
        case .lyd:
            return "ل.د" // Libyan Dinar
        case .mad:
            return "د.م." // Moroccan Dirham
        case .mdl:
            return "L" // Moldovan Leu
        case .mga:
            return "Ar" // Malagasy Ariary
        case .mnt:
            return "₮" // Mongolian Tögrög
        case .mop:
            return "MOP$" // Macanese Pataca
        case .mru:
            return "UM" // Mauritanian Ouguiya
        case .mur:
            return "₨" // Mauritian Rupee
        case .mvr:
            return "Rf" // Maldivian Rufiyaa
        case .mwk:
            return "MK" // Malawian Kwacha
        case .mxn:
            return "$" // Mexican Peso
        case .myr:
            return "RM" // Malaysian Ringgit
        case .mzn:
            return "MT" // Mozambican Metical
        case .nad:
            return "$" // Namibian Dollar
        case .ngn:
            return "₦" // Nigerian Naira
        case .npr:
            return "Rs" // Nepalese Rupee
        case .nzd:
            return "$" // New Zealand Dollar
        case .pab:
            return "B/." // Panamanian Balboa
        case .pen:
            return "S/" // Peruvian Sol
        case .php:
            return "₱" // Philippine Peso
        case .pkr:
            return "Rs" // Pakistani Rupee
        case .sgd:
            return "$" // Singapore Dollar
        case .thb:
            return "฿" // Thai Baht
        case .tnd:
            return "د.ت" // Tunisian Dinar
        case .usd:
            return "$" // US Dollar
        case .vnd:
            return "₫" // Vietnamese Dong
        case .yer:
            return "﷼" // Yemeni Rial
        case .zar:
            return "R" // South African Rand
        case .zmw:
            return "ZK" // Zambian Kwacha
        case .mkd:
            return "ден" // Macedonian Denar
        case .nio:
            return "C$" // Nicaraguan Córdoba
        case .nok:
            return "kr" // Norwegian Krone
        case .omr:
            return "ر.ع." // Omani Rial
        case .pgk:
            return "K" // Papua New Guinean Kina
        case .pln:
            return "zł" // Polish Zloty
        case .pyg:
            return "₲" // Paraguayan Guarani
        case .qar:
            return "ر.ق" // Qatari Riyal
        case .ron:
            return "lei" // Romanian Leu
        case .rsd:
            return "дин" // Serbian Dinar
        case .rwf:
            return "FRw" // Rwandan Franc
        case .sar:
            return "ر.س" // Saudi Riyal
        case .sbd:
            return "$" // Solomon Islands Dollar
        case .scr:
            return "₨" // Seychellois Rupee
        case .sek:
            return "kr" // Swedish Krona
        case .shp:
            return "£" // Saint Helena Pound
        case .sll:
            return "Le" // Sierra Leonean Leone
        case .sos:
            return "Sh" // Somali Shilling
        case .srd:
            return "$" // Surinamese Dollar
        case .stn:
            return "Db" // São Tomé and Príncipe Dobra
        case .svc:
            return "₡" // Salvadoran Colón
        case .szl:
            return "E" // Eswatini Lilangeni
        case .tjs:
            return "ЅМ" // Tajikistani Somoni
        case .tmt:
            return "m" // Turkmenistani Manat
        case .top:
            return "T$" // Tongan Paʻanga
        case .tur:
            return "₺" // Turkish Lira
        case .ttd:
            return "TT$" // Trinidad and Tobago Dollar
        case .twd:
            return "NT$" // New Taiwan Dollar
        case .tzs:
            return "TSh" // Tanzanian Shilling
        case .uah:
            return "₴" // Ukrainian Hryvnia
        case .ugx:
            return "USh" // Ugandan Shilling
        case .uyu:
            return "$U" // Uruguayan Peso
        case .uzs:
            return "so'm" // Uzbekistani Som
        case .xaf:
            return "FCFA" // Central African CFA Franc
        case .xcd:
            return "$" // East Caribbean Dollar
        case .xof:
            return "CFA" // West African CFA Franc
        }
    }
}

// MARK: - Extension
extension Currency: PickerItem {}
