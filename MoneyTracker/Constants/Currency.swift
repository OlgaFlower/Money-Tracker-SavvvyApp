//
//  Currency.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 12.11.24.
//

import Foundation

enum Currency: String, CaseIterable, Identifiable {

    case eur = "EUR"
    case all = "ALL" //Albanian lek
    case bam = "BAM"
    case bgn = "BGN"
    case czk = "CZK"
    case dkk = "DKK"
    case gel = "GEL"
    case huf = "HUF"
    case isk = "ISK"
    case chf = "CHF"
    case mdl = "MDL"
    case mkd = "MKD"
    case nok = "NOK"
    case pln = "PLN"
    case ron = "RON"
    case rsd = "RSD"
    case sek = "SEK"
    case turkey = "TRY"
    case uah = "UAH"
    case gbp = "GBP"
    case usd = "USD"
    case xcd = "XCD"
    case awg = "AWG"
    case ars = "ARS"
    case bsd = "BSD"
    case bbd = "BBD"
    case bmd = "BMD"
    case bzd = "BZD"
    case bob = "BOB"
    case brl = "BRL"
    case cad = "CAD"
    case kyd = "KYD"
    case clp = "CLP"
    case cop = "COP"
    case crc = "CRC"
    case cup = "CUP"
    case ang = "ANG"
    case dop = "DOP"
    case fkp = "FKP"
    case gtq = "GTQ"
    case gyd = "GYD"
    case htg = "HTG"
    case hnl = "HNL"
    case jmd = "JMD"
    case mxn = "MXN"
    case nio = "NIO"
    case pab = "PAB"
    case pyg = "PYG"
    case pen = "PEN"
    case srd = "SRD"
    case ttd = "TTD"
    case uyu = "UYU"
    case ved = "VED"
    case amd = "AMD"
    case azn = "AZN"
    case bhd = "BHD"
    case iqd = "IQD"
    case ils = "ILS"
    case jod = "JOD"
    case kwd = "KWD"
    case lbp = "LBP"
    case syp = "SYP"
    case aed = "AED"
    case omr = "OMR"
    case qar = "QAR"
    case sar = "SAR"
    case yer = "YER"
    case xaf = "XAF"
    case xof = "XOF"
    case dzd = "DZD"
    case aoa = "AOA"
    case bwp = "BWP"
    case bif = "BIF"
    case cve = "CVE"
    case kmf = "KMF"
    case cdf = "CDF"
    case djf = "DJF"
    case egp = "EGP"
    case ern = "ERN"
    case etb = "ETB"
    case szl = "SZL"
    case gmd = "GMD"
    case ghs = "GHS"
    case gnf = "GNF"
    case kes = "KES"
    case lsl = "LSL"
    case lrd = "LRD"
    case lyd = "LYD"
    case mga = "MGA"
    case mwk = "MWK"
    case mur = "MUR"
    case mru = "MRU"
    case mad = "MAD"
    case mzn = "MZN"
    case nad = "NAD"
    case ngn = "NGN"
    case rwf = "RWF"
    case stn = "STN"
    case scr = "SCR"
    case sll = "SLL"
    case sos = "SOS"
    case zar = "ZAR"
    case ssp = "SSP"
    case sdg = "SDG"
    case tzs = "TZS"
    case tnd = "TND"
    case ugx = "UGX"
    case aud = "AUD"
    
    var id: String {
        self.rawValue
    }
    
    var sign: String {
        
        switch self {
        case .eur:
            return "€"
        case .all: //Albanian lek
            return "L"
        case .bam:
            return "KM"
        case .bgn:
            return "лв"
        case .czk:
            return "Kč"
        case .dkk:
            return "kr"
        case .gel:
            return "₾"
        case .huf:
            return "Ft"
        case .isk:
            return "kr"
        case .chf:
            return "CHF"
        case .mdl:
            return "L"
        case .mkd:
            return "ден"
        case .nok:
            return "kr"
        case .pln:
            return "zł"
        case .ron:
            return "lei"
        case .rsd:
            return "дин"
        case .sek:
            return "kr"
        case .turkey:
            return "₺"
        case .uah:
            return "₴"
        case .gbp:
            return "£"
        case .usd:
            return "$"
        case .xcd:
            return "$"
        case .awg:
            return "ƒ"
        case .ars:
            return "$"
        case .bsd:
            return "$"
        case .bbd:
            return "$"
        case .bmd:
            return "$"
        case .bzd:
            return "BZ$"
        case .bob:
            return "Bs."
        case .brl:
            return "R$"
        case .cad:
            return "$"
        case .kyd:
            return "$"
        case .clp:
            return "$"
        case .cop:
            return "$"
        case .crc:
            return "₡"
        case .cup:
            return "₱"
        case .ang:
            return "ƒ"
        case .dop:
            return "RD$"
        case .fkp:
            return "£"
        case .gtq:
            return "Q"
        case .gyd:
            return "$"
        case .htg:
            return "G"
        case .hnl:
            return "L"
        case .jmd:
            return "J$"
        case .mxn:
            return "$"
        case .nio:
            return "C$"
        case .pab:
            return "B/."
        case .pyg:
            return "₲"
        case .pen:
            return "S/"
        case .srd:
            return "$"
        case .ttd:
            return "TT$"
        case .uyu:
            return "$U"
        case .ved:
            return "Bs."
        case .amd:
            return "֏"
        case .azn:
            return "₼"
        case .bhd:
            return ".د.ب"
        case .iqd:
            return "ع.د"
        case .ils:
            return "₪"
        case .jod:
            return "د.ا"
        case .kwd:
            return "د.ك"
        case .lbp:
            return "ل.ل"
        case .syp:
            return "ل.س"
        case .aed:
            return "د.إ"
        case .omr:
            return "ر.ع."
        case .qar:
            return "ر.ق"
        case .sar:
            return "ر.س"
        case .yer:
            return "﷼"
        case .xaf:
            return "FCFA"
        case .xof:
            return "CFA"
        case .dzd:
            return "د.ج"
        case .aoa:
            return "Kz"
        case .bwp:
            return "P"
        case .bif:
            return "FBu"
        case .cve:
            return "$"
        case .kmf:
            return "CF"
        case .cdf:
            return "FC"
        case .djf:
            return "Fdj"
        case .egp:
            return "ج.م"
        case .ern:
            return "Nfk"
        case .etb:
            return "Br"
        case .szl:
            return "E"
        case .gmd:
            return "D"
        case .ghs:
            return "₵"
        case .gnf:
            return "FG"
        case .kes:
            return "KSh"
        case .lsl:
            return "L"
        case .lrd:
            return "L$"
        case .lyd:
            return "ل.د"
        case .mga:
            return "Ar"
        case .mwk:
            return "MK"
        case .mur:
            return "₨"
        case .mru:
            return "UM"
        case .mad:
            return "د.م."
        case .mzn:
            return "MT"
        case .nad:
            return "$"
        case .ngn:
            return "₦"
        case .rwf:
            return "FRw"
        case .stn:
            return "Db"
        case .scr:
            return "₨"
        case .sll:
            return "Le"
        case .sos:
            return "Sh"
        case .zar:
            return "R"
        case .ssp:
            return "£"
        case .sdg:
            return "ج.س."
        case .tzs:
            return "TSh"
        case .tnd:
            return "د.ت"
        case .ugx:
            return "USh"
        case .aud:
            return "$"
        }
    }
}

// MARK: - Extension
extension Currency: PickerItem {}
