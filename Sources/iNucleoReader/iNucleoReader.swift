// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@MainActor var cursor : Int = 0
@MainActor var datasetstart : Bool = false
@MainActor var listNucleidi = [Nucleide] ()
@MainActor var currentNUCID : String = ""
@MainActor var currentIDENTIF : String = ""



@propertyWrapper
struct IgnoreIfEmpty<T: Collection & Encodable>: Encodable {
    var wrappedValue: T
    
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
    
    func encode(to encoder: Encoder) throws {
        // Evita di codificare l'array se è vuoto
        if !wrappedValue.isEmpty {
            var container = encoder.singleValueContainer()
            try container.encode(wrappedValue)
        }
    }
}


enum ParserENSDFError: Error {
    case invalidRecordLenght(file: String)
    case errorparging(file: String)
    case outOfStock
}

enum ParserRecordFError: Error {
    case invalidRecordLenght
    case errorparging
    case none
}

struct ParseRecordResp
{
    var success : Bool
    var resaon : ParserRecordFError
}

class BETAMENOLEVELREC : Encodable
{
    internal init(nrec: String? = nil, E: String? = nil, DE: String? = nil, IB: String? = nil, DIB: String? = nil, LOGFT: String? = nil, DFT: String? = nil, C: String? = nil, UN: String? = nil, Q: String? = nil, gcomm: [GENCOMMREC]? = nil, addData: [String]? = nil) {
        self.nrec = nrec
        self.E = E
        self.DE = DE
        self.IB = IB
        self.DIB = DIB
        self.LOGFT = LOGFT
        self.DFT = DFT
        self.C = C
        self.UN = UN
        self.Q = Q
        self.gcomm = gcomm
        self.addData = addData
    }
    
   

        var nrec : String?
        var E : String?
        var DE : String?
        var IB : String?
        var DIB : String?
        var LOGFT : String?
        var DFT : String?
        var C : String?
        var UN: String?
        var Q: String?
        var gcomm : [GENCOMMREC]?
        var addData: [String]?
}
class ECLEVELREC : Encodable
{
    internal init(nrec: String? = nil, E: String? = nil, DE: String? = nil, IB: String? = nil, DIB: String? = nil, IE: String? = nil, DIE: String? = nil, LOGFT: String? = nil, DFT: String? = nil, TI: String? = nil, DTI: String? = nil, C: String? = nil, UN: String? = nil, Q: String? = nil, gcomm: [GENCOMMREC]? = nil, addData: [String]? = nil) {
        self.nrec = nrec
        self.E = E
        self.DE = DE
        self.IB = IB
        self.DIB = DIB
        self.IE = IE
        self.DIE = DIE
        self.LOGFT = LOGFT
        self.DFT = DFT
        self.TI = TI
        self.DTI = DTI
        self.C = C
        self.UN = UN
        self.Q = Q
        self.gcomm = gcomm
        self.addData = addData
    }
    
    
    
    

        var nrec : String?
        var E : String?
        var DE : String?
        var IB : String?
        var DIB : String?
        var IE : String?
        var DIE : String?
        var LOGFT : String?
        var DFT : String?
        var TI : String?
        var DTI : String?
        var C : String?
        var UN: String?
        var Q: String?
        var gcomm : [GENCOMMREC]?
        var addData: [String]?
}
class ALFALEVELREC : Encodable
{
    internal init(nrec: String? = nil, E: String? = nil, DE: String? = nil, IA: String? = nil, DIA: String? = nil, HF: String? = nil, DHT: String? = nil, C: String? = nil, Q: String? = nil, gcomm: [GENCOMMREC]? = nil, addData: [String]? = nil) {
        self.nrec = nrec
        self.E = E
        self.DE = DE
        self.IA = IA
        self.DIA = DIA
        self.HF = HF
        self.DHT = DHT
        self.C = C
        self.Q = Q
        self.gcomm = gcomm
        self.addData = addData
    }
 
        var nrec : String?
        var E : String?
        var DE : String?
        var IA : String?
        var DIA : String?
        var HF : String?
        var DHT : String?
        var C : String?
        var Q: String?
        var gcomm : [GENCOMMREC]?
        var addData: [String]?
}
class DMENOPARTICLELEVELREC : Encodable
{
    internal init(nrec: String? = nil, Particle: String, E: String? = nil, DE: String? = nil, IP: String? = nil, DIP: String? = nil, EI: String? = nil, T: String? = nil, DT: String? = nil, L: String? = nil, C: String? = nil, COIN: String? = nil, Q: String? = nil, gcomm: [GENCOMMREC]? = nil, addData: [String]? = nil) {
        self.nrec = nrec
        self.Particle = Particle
        self.E = E
        self.DE = DE
        self.IP = IP
        self.DIP = DIP
        self.EI = EI
        self.T = T
        self.DT = DT
        self.L = L
        self.C = C
        self.COIN = COIN
        self.Q = Q
        self.gcomm = gcomm
        self.addData = addData
    }
    
   
    
    
    
        var nrec : String?
        var Particle : String
        var E : String?
        var DE : String?
        var IP : String?
        var DIP : String?
        var EI : String?
        var T : String?
        var DT : String?
        var L : String?
        var C : String?
        var COIN : String?
        var Q: String?
        var gcomm : [GENCOMMREC]?
        var addData: [String]?
}
class GAMMALEVELREC : Encodable
{
    internal init(nrec: String? = nil, E: String? = nil, DE: String? = nil, RI: String? = nil, DRI: String? = nil, M: String? = nil, MR: String? = nil, DMR: String? = nil, CC: String? = nil, DCC: String? = nil, TI: String? = nil, DTI: String? = nil, C: String? = nil, COIN: String? = nil, Q: String? = nil, gcomm: [GENCOMMREC]? = nil, addData: [String]? = nil) {
        self.nrec = nrec
        self.E = E
        self.DE = DE
        self.RI = RI
        self.DRI = DRI
        self.M = M
        self.MR = MR
        self.DMR = DMR
        self.CC = CC
        self.DCC = DCC
        self.TI = TI
        self.DTI = DTI
        self.C = C
        self.COIN = COIN
        self.Q = Q
        self.gcomm = gcomm
        self.addData = addData
    }
    
   
    
        var nrec : String?
        var E : String?
        var DE : String?
        var RI : String?
        var DRI : String?
        var M : String?
        var MR : String?
        var DMR : String?
        var CC : String?
        var DCC : String?
        var TI : String?
        var DTI : String?
        var C : String?
        var COIN : String?
        var Q: String?
        var gcomm : [GENCOMMREC]?
        var addData: [String]?
}
class LEVELREC : Encodable
{
    internal init(nrec: String? = nil, E: String? = nil, DE: String? = nil, J: String? = nil, T: String? = nil, DT: String? = nil, L: String? = nil, S: String? = nil, DS: String? = nil, C: String? = nil, MS: String? = nil, Q: String? = nil, gcomm: [GENCOMMREC]? = nil, addData: [String]? = nil) {
        self.nrec = nrec
        self.E = E
        self.DE = DE
        self.J = J
        self.T = T
        self.DT = DT
        self.L = L
        self.S = S
        self.DS = DS
        self.C = C
        self.MS = MS
        self.Q = Q
        self.gcomm = gcomm
        self.addData = addData
    }
    

  
  
        var nrec : String?
        var E : String?
        var DE : String?
        var J : String?
        var T : String?
        var DT : String?
        var L : String?
        var S : String?
        var DS: String?
        var C : String?
        var MS : String?
        var Q: String?
        var gcomm : [GENCOMMREC]?
        var addData: [String]?
}

class PNORMALIZATIONREC : Encodable
{
    internal init(DNUCID: String, NRBR: String? = nil, DNRBR: String? = nil, NTBR: String? = nil, DNTBR: String? = nil, NBBR: String? = nil, DNBBR: String? = nil, NP: String? = nil, DNP: String? = nil, COM: String? = nil, OPT: String) {
        self.DNUCID = DNUCID
        self.NRBR = NRBR
        self.DNRBR = DNRBR
        self.NTBR = NTBR
        self.DNTBR = DNTBR
        self.NBBR = NBBR
        self.DNBBR = DNBBR
        self.NP = NP
        self.DNP = DNP
        self.COM = COM
        self.OPT = OPT
    }
    
   
    
    
        var DNUCID : String
        var NRBR : String?
        var DNRBR : String?
        var NTBR : String?
        var DNTBR : String?
        var NBBR : String?
        var DNBBR : String?
        var NP : String?
        var DNP : String?
        var COM : String?
        var OPT : String
        var gcomm : [GENCOMMREC]?
}

class NORMALIZATIONREC : Encodable
{
    internal init(nrec: String? = nil, DNUCID: String, NR: String? = nil, DNR: String? = nil, NT: String? = nil, DNT: String? = nil, BR: String? = nil, DBR: String? = nil, NB: String? = nil, DNB: String? = nil, NP: String? = nil, DNP: String? = nil) {
        self.nrec = nrec
        self.DNUCID = DNUCID
        self.NR = NR
        self.DNR = DNR
        self.NT = NT
        self.DNT = DNT
        self.BR = BR
        self.DBR = DBR
        self.NB = NB
        self.DNB = DNB
        self.NP = NP
        self.DNP = DNP
    }
    
  
        var nrec : String?
        var DNUCID : String?
        var NR : String?
        var DNR : String?
        var NT : String?
        var DNT : String?
        var BR : String?
        var DBR : String?
        var NB : String?
        var DNB : String?
        var NP : String?
        var DNP : String?
        var gcomm : [GENCOMMREC]?
}

class PARENTREC : Encodable
{
    internal init(nrec: String? = nil, PNUCID: String? = nil, E: String? = nil, DE: String? = nil, J: String? = nil, T: String? = nil, DT: String? = nil, QP: String? = nil, DQP: String? = nil, ION: String? = nil, gcomm: [GENCOMMREC]? = nil) {
        self.nrec = nrec
        self.PNUCID = PNUCID
        self.E = E
        self.DE = DE
        self.J = J
        self.T = T
        self.DT = DT
        self.QP = QP
        self.DQP = DQP
        self.ION = ION
        self.gcomm = gcomm
    }
    
        var nrec : String?
        var PNUCID : String?
        var E : String?
        var DE : String?
        var J : String?
        var T : String?
        var DT : String?
        var QP : String?
        var DQP : String?
        var ION : String?
        var gcomm : [GENCOMMREC]?
}

class CROSSREFREC : Encodable
{
    internal init(DSID: String? = nil, DSSYM: String? = nil) {
        self.DSID = DSID
        self.DSSYM = DSSYM
    }
    
  
    
    
        var DSID : String?
        var DSSYM : String?
       
}

class GENCOMMREC : Encodable
{
    internal init(nrec: String? = nil, Ctype: String? = nil, PSYM: String? = nil, CTEXT: String? = nil) {
        self.nrec = nrec
        self.Ctype = Ctype
        self.PSYM = PSYM
        self.CTEXT = CTEXT
    }
  
        var nrec : String?
        var Ctype : String?
        var PSYM : String?
        var CTEXT : String?
}

class HISTORYREC : Encodable
{
    internal init(history: String, nrec: String? = nil) {
        self.history = history
        self.nrec = nrec
    }
    
    
    var history : String
    var nrec : String?
}
class QMENOREC : Encodable
{
    internal init(QMENO: String? = nil, DQMENO: String? = nil, SN: String? = nil, DSN: String? = nil, SP: String? = nil, DSP: String? = nil, QA: String? = nil, DQA: String? = nil, QREF: String? = nil, gcomm: [GENCOMMREC]? = nil) {
        self.QMENO = QMENO
        self.DQMENO = DQMENO
        self.SN = SN
        self.DSN = DSN
        self.SP = SP
        self.DSP = DSP
        self.QA = QA
        self.DQA = DQA
        self.QREF = QREF
        self.gcomm = gcomm
    }
    

    var QMENO : String?
    var DQMENO : String?
    var SN : String?
    var DSN : String?
    var SP : String?
    var DSP : String?
    var QA : String?
    var DQA : String?
    var QREF : String?
    var gcomm : [GENCOMMREC]?
    
}

class Recordset : Encodable
{
    internal init(identification: String, DSREF: String?, PUB: String, DATE: String) {
        self.identification = identification
        self.DSREF = DSREF
        self.PUB = PUB
        self.DATE = DATE
    }
    
    
    
    var identification : String
    var DSREF : String?
    var PUB : String
    var DATE : String
    var QMenoRec : QMENOREC?
    var GENERALCOMRecs: [GENCOMMREC]?
    var HYSTRecs : [HISTORYREC]?
    var CROSSRERecs : [CROSSREFREC]?
    var PARENTRECRecs : [PARENTREC]?
    var NORMALIZATIONRecs : [NORMALIZATIONREC]?
    var LEVELRecs : [LEVELREC]?
    var GAMMALEVELRecs : [GAMMALEVELREC]?
    var ALFALEVELRecs : [ALFALEVELREC]?
    var DMENOPARTICLELEVELRecs : [DMENOPARTICLELEVELREC]?
    var ECLEVELRecs : [ECLEVELREC]?
    var BETAMENOLEVELRecs : [BETAMENOLEVELREC]?
    var PNORMALIZATIONRecs : [PNORMALIZATIONREC]?
    
    func addGENERALCOMRecs (elem : GENCOMMREC)
    {
        if (GENERALCOMRecs == nil)
        {
            GENERALCOMRecs = []
        }
        if (GENERALCOMRecs?.last != nil)
        {
            let last=GENERALCOMRecs?.last
            if (last?.Ctype == elem.Ctype)
            {
                if (elem.nrec != nil)
                {
                    if (elem.nrec == "#")
                    {
                        GENERALCOMRecs?.last?.CTEXT = (GENERALCOMRecs?.last?.CTEXT ?? "") + "###" + (elem.CTEXT ?? "")
                    }
                    else
                    {
                    GENERALCOMRecs?.last?.CTEXT = (GENERALCOMRecs?.last?.CTEXT ?? "") + " " + (elem.CTEXT ?? "")
                    }
                }
                else
                {
                    GENERALCOMRecs?.last?.CTEXT = (GENERALCOMRecs?.last?.CTEXT ?? "") + "\n" + (elem.CTEXT ?? "")
                }
            }
            else
            {
                GENERALCOMRecs?.append(elem)
            }
        }
        else
        {
            GENERALCOMRecs?.append(elem)
        }
    }
    func addGAMMALEVELRecs (elem : GAMMALEVELREC)
    {
        if (GAMMALEVELRecs == nil)
        {
            GAMMALEVELRecs = []
        }
        GAMMALEVELRecs?.append(elem)
    }
    func addALFALEVELRecs (elem : ALFALEVELREC)
    {
        if (ALFALEVELRecs == nil)
        {
            ALFALEVELRecs = []
        }
        ALFALEVELRecs?.append(elem)
    }
    func addDMENOPARTICLELEVELRecs (elem : DMENOPARTICLELEVELREC)
    {
        if (DMENOPARTICLELEVELRecs == nil)
        {
            DMENOPARTICLELEVELRecs = []
        }
        DMENOPARTICLELEVELRecs?.append(elem)
    }
    func addECLEVELRecs (elem : ECLEVELREC)
    {
        if (ECLEVELRecs == nil)
        {
            ECLEVELRecs = []
        }
        ECLEVELRecs?.append(elem)
    }
    func addBETAMENOLEVELRecs (elem : BETAMENOLEVELREC)
    {
        if (BETAMENOLEVELRecs == nil)
        {
            BETAMENOLEVELRecs = []
        }
        BETAMENOLEVELRecs?.append(elem)
    }
    func addPNORMALIZATIONRecs (elem : PNORMALIZATIONREC)
    {
        if (PNORMALIZATIONRecs == nil)
        {
            PNORMALIZATIONRecs = []
        }
        PNORMALIZATIONRecs?.append(elem)
    }
    func addInPARENTRECRecs (elem : PARENTREC)
    {
        if (PARENTRECRecs == nil)
        {
            PARENTRECRecs = []
        }
        PARENTRECRecs?.append(elem)
    }
    func addInCROSSRERecs (elem : CROSSREFREC)
    {
        if (CROSSRERecs == nil)
        {
            CROSSRERecs = []
        }
        CROSSRERecs?.append(elem)
    }
    func addNORMALIZATIONRecs (elem : NORMALIZATIONREC)
    {
        if (NORMALIZATIONRecs == nil)
        {
            NORMALIZATIONRecs = []
        }
        NORMALIZATIONRecs?.append(elem)
    }
    func addLEVELRecs (elem : LEVELREC)
    {
        if (LEVELRecs == nil)
        {
            LEVELRecs = []
        }
        LEVELRecs?.append(elem)
    }
   
    
    func addHYSTRecs (elem : HISTORYREC)
    {
        
        if (HYSTRecs == nil)
        {
            HYSTRecs = []
        }
        if (HYSTRecs?.last != nil)
        {
            let last=HYSTRecs?.last
        
            if (elem.nrec != nil)
            {
                HYSTRecs?.last?.history = (HYSTRecs?.last?.history ?? "") + " " + (elem.history)
            }
            else
            {
                HYSTRecs?.last?.history = (HYSTRecs?.last?.history ?? "") + "\n" + (elem.history)
            }
           
        }
        else
        {
            HYSTRecs?.append(elem)
        }
        //HYSTRecs?.append(elem)
    }
    
}

class Nucleide : Encodable
{
    var  id : String = ""
    var  A : Int = 0
    var  Symbol : String = ""
    var  lastidentifier : String = ""
    var  listRecordset : [Recordset] = []
    var  Z : String = ""
    var  N : String = ""
    var  MASS_EXCESS  : String?
    var  ER_MASS_EXCESS : String?
    var  BINDING_ENERGY_div_A : String?
    var  ER_BINDING_ENERGY_div_A  : String?
    var  BETA_DECAY_ENERGY  : String?
    var  ER_BETA_DECAY_ENERGY  : String?
    var  ATOMIC_MASS  : String?
    var  ER_ATOMIC_MASS : String?
    var  S_2n_: String?
    var  S_2p_ : String?
    var  Q_a_: String?
    var  Q_2BMeno_ : String?
    var  Q_ep_ : String?
    var  Q_BMenon_ : String?
    var  ER_S_2n_ : String?
    var  ER_S_2p_ : String?
    var  ER_Q_a_ : String?
    var  ER_Q_2BMeno_ : String?
    var  ER_Q_ep_ : String?
    var  ER_Q_BMenon_ : String?
    var  S_n_ : String?
    var  ER_S_n_ : String?
    var  S_p_ : String?
    var  ER_S_p_ : String?
    var  Q_4BMeno_ : String?
    var  ER_Q_4BMeno_ : String?
    var  Q_da_ : String?
    var  ER_Q_da_ : String?
    var  Q_pa_ : String?
    var  ER_Q_pa_ : String?
    var  Q_na_ : String?
    var  ER_Q_na_ : String?
    var  T : String?
    var  T_UNIT : String?
    var  T_UNC : String?
    var  Spin_Parity : String?
    var  Discovery : String?
    var  BR : String?
    
    

 
   
    
    internal init(id: String = "", A: Int = 0, Symbol: String = "", lastidentifier: String = "", listRecordset: [Recordset] = []) {
        self.id = id
        self.A = A
        self.Symbol = Symbol
        self.lastidentifier = lastidentifier
        self.listRecordset = listRecordset
    }
    
  
    
}

func generateJSON(from listNucleidi: [Nucleide]) -> String? {
    let encoder = JSONEncoder()
    encoder.outputFormatting =  [.sortedKeys, .prettyPrinted] // Formattazione leggibile
    
    do {
        let jsonData = try encoder.encode(listNucleidi)
        return String(data: jsonData, encoding: .utf8)
    } catch {
        print("Errore durante la codifica JSON: \(error)")
        return nil
    }
}

func generateJSONData(from listNucleidi: [Nucleide]) -> Data? {
    let encoder = JSONEncoder()
    encoder.outputFormatting =  [.sortedKeys, .prettyPrinted] // Formattazione leggibile
    
    do {
        let jsonData = try encoder.encode(listNucleidi)
        return jsonData
    } catch {
        print("Errore durante la codifica JSON: \(error)")
        return nil
    }
}

func addGENERALCOMRec (list : inout  [GENCOMMREC]!, elem : GENCOMMREC)
{
   
    if (list?.last != nil)
    {
        let last=list?.last
        if (last?.Ctype == elem.Ctype)
        {
            if (elem.nrec != nil)
            {
                list?.last?.CTEXT = (list?.last?.CTEXT ?? "") + " " + (elem.CTEXT ?? "")
            }
            else
            {
                list?.last?.CTEXT = (list?.last?.CTEXT ?? "") + "\n" + (elem.CTEXT ?? "")
            }
        }
        else
        {
            list!.append(elem)
        }
    }
    else
    {
        list!.append(elem)
    }
}


func getValue(line : String, from : Int , to : Int ) -> String
{
    return String(line[String.Index(utf16Offset:(from - 1),in: line)...String.Index(utf16Offset:(to - 1),in: line)])
}

func getNUCID1(line : String) -> String
{
    return String(line[...String.Index(utf16Offset:2,in: line)])
}
func getNUCID2(line : String) -> String
{
    return String(line[String.Index(utf16Offset:3,in: line)...String.Index(utf16Offset:4,in: line)])
}
func getTAG(line : String) -> String
{
    return String(line[String.Index(utf16Offset:5,in: line)...String.Index(utf16Offset:8,in: line)])
}
func getDSID(line : String) -> String
{
    return String(line[String.Index(utf16Offset:9,in: line)...String.Index(utf16Offset:38,in: line)])
    
}
func getDSREF(line : String) -> String?
{
    let mDSREF = getValue(line: line, from: 60, to: 65).trimmingCharacters(in: .whitespacesAndNewlines)
    return mDSREF.isEmpty ? nil : mDSREF
}
func getPUB(line : String) -> String
{
    return String(line[String.Index(utf16Offset:65,in: line)...String.Index(utf16Offset:73,in: line)])
   
}
func getDATE(line : String) -> String
{
    return String(line[String.Index(utf16Offset:74,in: line)...String.Index(utf16Offset:79,in: line)])
   
}

func getQMENO(line : String) -> String?
{
    var mnrbr = String(line[String.Index(utf16Offset:9,in: line)...String.Index(utf16Offset:18,in: line)]).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDQMENO(line : String) -> String?
{
    var mnrbr = String(line[String.Index(utf16Offset:19,in: line)...String.Index(utf16Offset:20,in: line)]).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getSN(line : String) -> String?
{
    var mnrbr = String(line[String.Index(utf16Offset:21,in: line)...String.Index(utf16Offset:28,in: line)]).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDSN(line : String) -> String?
{
    var mnrbr = String(line[String.Index(utf16Offset:29,in: line)...String.Index(utf16Offset:30,in: line)]).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getSP(line : String) -> String?
{
    var mnrbr = String(line[String.Index(utf16Offset:31,in: line)...String.Index(utf16Offset:38,in: line)]).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDSP(line : String) -> String?
{
    var mnrbr = String(line[String.Index(utf16Offset:39,in: line)...String.Index(utf16Offset:40,in: line)]).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}

func getQA(line : String) -> String?
{
    var mnrbr = getValue(line: line, from: 42, to: 49).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDQA(line : String) -> String?
{
    var mnrbr = getValue(line: line, from: 50, to: 55).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getQREF(line : String) -> String?
{
    var mnrbr = getValue(line: line, from: 56, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getHISTORY(line : String) -> String
{
    return getValue(line: line, from: 10, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
    
}
func getPSYM(line : String) -> String?
{
    var mnrbr = getValue(line: line, from: 9, to: 9).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getCTEXT(line : String) -> String?
{
    var mnrbr = getValue(line: line, from: 10, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDSIDINC(line : String) -> String?
{
    var mnrbr = getValue(line: line, from: 10, to: 39).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDSSIM(line : String) -> String?
{
    var mnrbr = getValue(line: line, from: 9, to: 9).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getNREC(line : String) -> String?
{
    var mnrbr = getValue(line: line, from: 9, to: 9).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getE(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 10, to: 19).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDE(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 20, to: 21).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getJ(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 22, to: 39).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getT(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 40, to: 49).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDT(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 50, to: 55).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getQP(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 65, to: 74).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDQP(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 75, to: 76).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getION(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 77, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
//
func getNR(line : String) -> String?
{
    var mnrbr = getValue(line: line, from: 10, to: 19).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDNR(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 20, to: 21).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getNT(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 22, to: 29).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDNT(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 30, to: 31).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getBR(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 32, to: 39).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDBR(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 40, to: 41).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getNB(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 42, to: 49).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDNB(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 50, to: 55).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getNP(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 56, to: 62).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDNP(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 63, to: 64).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
//
func getLE(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 10, to: 19).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getLDE(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 20, to: 21).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getLJ(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 22, to: 39).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getLT(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 40, to: 49).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getLDT(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 50, to: 55).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getLL(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 56, to: 64).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getLS(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 65, to: 74).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getLDS(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 75, to: 76).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getLC(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 77, to: 77).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getLMS(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 78, to: 79).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getLQ(line : String) -> String?
{
    var mnrbr =  getValue(line: line, from: 80, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}

func getNRBR(line : String) -> String?
{
    var mnrbr = getValue(line: line, from: 10, to: 19).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnrbr.isEmpty ? nil : mnrbr
}
func getDNRBR(line : String) -> String?
{
    var mdnbr = getValue(line: line, from: 20, to: 21).trimmingCharacters(in: .whitespacesAndNewlines)
    return mdnbr.isEmpty ? nil : mdnbr
}
func getNTBR(line : String) -> String?
{
    var mntbr = getValue(line: line, from: 22, to: 29).trimmingCharacters(in: .whitespacesAndNewlines)
    return mntbr.isEmpty ? nil : mntbr
}
func getDNTBR(line : String) -> String?
{
    var mdntbr = getValue(line: line, from: 30, to: 31).trimmingCharacters(in: .whitespacesAndNewlines)
    return mdntbr.isEmpty ? nil : mdntbr
}

func getNBBR(line : String) -> String?
{
    var mnbbr = getValue(line: line, from: 42, to: 49).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnbbr.isEmpty ? nil : mnbbr
}

func getDNBBR(line : String) -> String?
{
    var mdnbbr = getValue(line: line, from: 50, to: 55).trimmingCharacters(in: .whitespacesAndNewlines)
    return mdnbbr.isEmpty ? nil : mdnbbr
}
func getNP_P(line : String) -> String?
{
    var mnp = getValue(line: line, from: 56, to: 62).trimmingCharacters(in: .whitespacesAndNewlines)
    return mnp.isEmpty ? nil : mnp
}
func getDNP_P(line : String) -> String?
{
    var mdnp = getValue(line: line, from: 63, to: 64).trimmingCharacters(in: .whitespacesAndNewlines)
    return mdnp.isEmpty ? nil : mdnp
}
func getCOM(line : String) -> String?
{
    var mcom = getValue(line: line, from: 77, to: 77).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getOPT(line : String) -> String
{
    return getValue(line: line, from: 78, to: 78).trimmingCharacters(in: .whitespacesAndNewlines)
}
// BETAMENO
func getBM_E(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 10, to: 19).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getBM_DE(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 20, to: 21).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getBM_IB(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 22, to: 29).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getBM_DIB(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 30, to: 31).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getBM_LOGFT(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 42, to: 49).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getBM_DFT(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 50, to: 55).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getBM_C(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 77, to: 77).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getBM_UN(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 78, to: 79).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getBM_Q(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 80, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
//
//ECLEVEL
func getEC_E(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 10, to: 19).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getEC_DE(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 20, to: 21).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getEC_IB(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 22, to: 29).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getEC_DIB(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 30, to: 31).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getEC_IE(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 32, to: 39).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getEC_DIE(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 40, to: 41).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getEC_LOGFT(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 42, to: 49).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getEC_DFT(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 50, to: 55).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getEC_TI(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 65, to: 74).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getEC_DTI(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 75, to: 76).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getEC_C(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 77, to: 77).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getEC_UN(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 78, to: 79).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getEC_Q(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 80, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
//
//ALFALEV
func getALFA_E(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 10, to: 19).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getALFA_DE(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 20, to: 21).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getALFA_IA(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 22, to: 29).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getALFA_DIA(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 30, to: 31).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getALFA_HF(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 32, to: 39).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getALFA_DHF(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 40, to: 41).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getALFA_C(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 77, to: 77).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}

func getALFA_Q(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 80, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
//
//DMENOL
func getDMENO_Particle(line : String) -> String
{
    var mcom =  getValue(line: line, from: 9, to: 9).trimmingCharacters(in: .whitespacesAndNewlines)
    return  mcom
}
func getDMENO_E(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 10, to: 19).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getDMENO_DE(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 20, to: 21).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getDMENO_IP(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 22, to: 29).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getDMENO_DIP(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 30, to: 31).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getDMENO_EI(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 32, to: 39).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getDMENO_DEI(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 40, to: 41).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getDMENO_T(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 42, to: 49).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getDMENO_DT(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 50, to: 55).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getDMENO_L(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 56, to: 64).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getDMENO_C(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 77, to: 77).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getDMENO_COIN(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 78, to: 78).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getDMENO_Q(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 80, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
//GAMMAL

func getGAMMA_E(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 10, to: 19).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getGAMMA_DE(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 20, to: 21).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}

func getGAMMA_RI(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 22, to: 29).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getGAMMA_DRI(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 30, to: 31).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getGAMMA_M(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 32, to: 41).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getGAMMA_MR(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 42, to: 49).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getGAMMA_DMR(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 50, to: 55).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getGAMMA_CC(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 56, to: 62).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getGAMMA_DCC(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 63, to: 64).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getGAMMA_TI(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 65, to: 74).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getGAMMA_DTI(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 75, to: 76).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getGAMMA_C(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 77, to: 77).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getGAMMA_COIN(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 78, to: 78).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getGAMMA_Q(line : String) -> String?
{
    var mcom =  getValue(line: line, from: 80, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
    return mcom.isEmpty ? nil : mcom
}
func getGAMMALEVELREC(line : String, nrec : String) ->  GAMMALEVELREC
{
    let mrec = nrec.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : nrec
    var e = getGAMMA_E(line : line)
    var de = getGAMMA_DE(line : line)
    var ri = getGAMMA_RI(line : line)
    var dri = getGAMMA_DRI(line : line)

    var m = getGAMMA_M(line : line)
    var mr = getGAMMA_MR(line : line)
    var dmr = getGAMMA_DMR(line : line)
    var cc = getGAMMA_CC(line : line)
    var dcc = getGAMMA_DCC(line : line)
    var ti = getGAMMA_TI(line : line)
    var dti =  getGAMMA_DTI(line : line)
    var c = getGAMMA_C(line : line)
    var coin = getGAMMA_COIN(line : line)
    var q = getGAMMA_Q(line : line)
    var newcrosref = GAMMALEVELREC(nrec: mrec, E: e, DE: de, RI: ri, DRI: dri, M: m, MR: mr, DMR: dmr, CC: cc, DCC: dcc, TI: ti, DTI: dti, C: c, COIN: coin, Q: q)
    return newcrosref
}
func getDMENOPARTICLELEVELREC (line : String, nrec : String) -> DMENOPARTICLELEVELREC
{
    let mrec = nrec.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : nrec
    var e = getDMENO_E(line : line)
    var de = getDMENO_DE(line : line)
    var particle = getDMENO_Particle(line : line)

    var ip = getDMENO_IP(line : line)
    var dip = getDMENO_DIP(line : line)
    var ei = getDMENO_EI(line : line)
    var dei = getDMENO_DEI(line : line)
    var t = getDMENO_T(line : line)
    var dt = getDMENO_DT(line : line)
    var l =  getDMENO_L(line : line)
    var c = getDMENO_C(line : line)
    var coin = getDMENO_COIN(line : line)
    var q = getDMENO_Q(line : line)
    var newcrosref = DMENOPARTICLELEVELREC(nrec: mrec, Particle: particle, E: e, DE: de, IP: ip, DIP: dip, EI: ei, T: t, DT: dt, L: l, C: c, COIN: coin, Q: q)
    return newcrosref
}
func getALFALEVELREC (line : String, nrec : String) -> ALFALEVELREC
{
    let mrec = nrec.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : nrec
    var e = getALFA_E(line : line)
    var de = getALFA_DE(line : line)
    var ia = getALFA_IA(line : line)
    var dia = getALFA_DIA(line : line)
    var hf = getALFA_HF(line : line)
    var dhf = getALFA_DHF(line : line)
    var c = getALFA_C(line : line)
    var q = getALFA_Q(line : line)
    var newcrosref = ALFALEVELREC (nrec: mrec, E: e, DE: de, IA: ia, DIA: dia, HF: hf, DHT: dhf, C: c, Q: q)
    return newcrosref
}
func getECLEVELREC (line : String, nrec : String) -> ECLEVELREC
{
    let mrec = nrec.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : nrec
    var e = getEC_E(line : line)
    var de = getEC_DE(line : line)
    var ib = getEC_IB(line : line)
    var dib = getEC_DIB(line : line)
    var ie = getEC_IE(line : line)
    var die = getEC_DIE(line : line)
    var logft = getEC_LOGFT(line : line)
    var dft = getEC_DFT(line : line)
    var ti = getEC_TI(line : line)
    var dti = getEC_DTI(line : line)
    var c = getEC_C(line : line)
    var un = getEC_UN(line : line)
    var q = getEC_Q(line : line)
    var newcrosref = ECLEVELREC(nrec: mrec, E: e, DE: de, IB: ib, DIB: dib, IE: ie, DIE: die, LOGFT: logft, DFT: dft, TI: ti, DTI: dti, C: c, UN: un, Q: q)
    return newcrosref
}

func getBETAMENOLEVELREC(line : String, nrec : String) -> BETAMENOLEVELREC
{
    let mrec = nrec.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : nrec
    var e = getBM_E(line : line)
    var de = getBM_DE(line : line)
    var ib = getBM_IB(line : line)
    var dib = getBM_DIB(line : line)
    var logft = getBM_LOGFT(line : line)
    var dft = getBM_DFT(line : line)
    var c = getBM_C(line : line)
    var un = getBM_UN(line : line)
    var q = getBM_Q(line : line)
    var newcrosref = BETAMENOLEVELREC(nrec: mrec, E: e, DE: de, IB: ib, DIB: dib, LOGFT: logft, DFT: dft, C: c, UN: un, Q: q)
    return newcrosref
}

func getPNORMALIZATIONREC(line : String, DNUCID : String) -> PNORMALIZATIONREC
{
    
    var nrbr = getNRBR(line : line)
    var dnrbr = getDNRBR(line : line)
    var ntbr = getNTBR(line : line)
    var dntbr = getDNTBR(line : line)
    var nbbr = getNBBR(line : line)
    var dnbbr = getDNBBR(line : line)
    var np = getNP_P(line : line)
    var dnp = getDNP_P(line : line)
    var com = getCOM(line : line)
    var opt = getOPT(line : line)
   
    var newcrosref = PNORMALIZATIONREC (DNUCID: DNUCID,NRBR : nrbr,DNRBR : dnrbr,NTBR :ntbr,DNTBR :dntbr,NBBR : nbbr,DNBBR : dnbbr,NP: np, DNP :dnp, COM :com,  OPT: opt)
    return newcrosref
}

func getLEVELREC(line : String, nrec : String) -> LEVELREC
{
    let mrec = nrec.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : nrec
    var e = getLE(line : line)
    var de = getLDE(line : line)
    var j = getLJ(line : line)
    var t = getLT(line : line)
    var dt = getLDT(line : line)
    var l = getLL(line : line)
    var ls = getLS(line : line)
    var lds = getLDS(line : line)
    var lc = getLC(line : line)
    var lms = getLMS(line : line)
    var q = getLQ(line : line)
    var newcrosref = LEVELREC(nrec: mrec, E: e, DE: de, J: j, T: t, DT: dt, L: l, S: ls, DS: lds, C: lc, MS: lms, Q: q)
    return newcrosref
}


func getNORMALIZATIOREC(line : String, DNUCID : String) -> NORMALIZATIONREC
{
    var nrec = getNREC(line : line)
    var nr = getNR(line : line)
    var dnr = getDNR(line : line)
    var nt = getNT(line : line)
    var dnt = getDNT(line : line)
    var br = getBR(line : line)
    var dbr = getDBR(line : line)
    var nb = getNB(line : line)
    var dnb = getDNB(line : line)
    var np = getNP(line : line)
    var dnp = getDNP(line : line)
    var newcrosref = NORMALIZATIONREC(nrec: nrec, DNUCID: DNUCID, NR: nr, DNR: dnr, NT: nt, DNT: dnt, BR: br, DBR: dbr, NB: nb, DNB :dnb ,NP : np , DNP :dnp)
    return newcrosref
}
func getPARENTREC(line : String, PNUCID : String) -> PARENTREC
{
    var nrec = getNREC(line : line)
    var e = getE(line : line)
    var de = getDE(line : line)
    var j = getJ(line : line)
    var t = getT(line : line)
    var dt = getDT(line : line)
    var qp = getQP(line : line)
    var dqp = getDQP(line : line)
    var ion = getION(line : line)
    var newcrosref = PARENTREC(nrec: nrec,PNUCID:PNUCID, E: e, DE: de, J: j, T: t, DT: dt, QP: qp, DQP: dqp, ION: ion)
    return newcrosref
}

func getCROSSREFREC(line : String) -> CROSSREFREC
{
    var dsid = getDSIDINC(line : line)
    var dssym = getDSSIM(line : line)
    var newcrosref = CROSSREFREC(DSID: dsid, DSSYM: dssym)
    return newcrosref
}
func getGENCOMMREC(line : String, nrec : String, ctype: String) -> GENCOMMREC
{
    let mrec = nrec.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : nrec
    var PSYM =  getPSYM (line : line)
    var CTEXT = getCTEXT (line :line)
    var newrecCOM = GENCOMMREC(nrec: mrec, Ctype: ctype, PSYM: PSYM, CTEXT: CTEXT)
    return newrecCOM
}
func getHISTORYREC(line : String, nrec : String) -> HISTORYREC
{
    let mrec = nrec.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : nrec
    var hist = getHISTORY(line : line)
    var newrecHist = HISTORYREC(history: hist, nrec: mrec)
    return newrecHist
}
func getQMENOREC(line : String) -> QMENOREC
{
    
    var qmeno = getQMENO(line : line)
    var dqmeno = getDQMENO(line : line)
    var sn = getSN(line : line)
    var dsn =  getDSN(line : line)
    var sp =  getSP(line : line)
    var dsp = getDSP(line : line)
    var qa = getQA(line : line)
    var dqa =  getDQA(line : line)
    var dqref =  getQREF(line : line)
    
    var newrecQmeno = QMENOREC(QMENO: qmeno, DQMENO: dqmeno, SN: sn, DSN: dsn, SP: sp, DSP: dsp, QA: qa, DQA: dqa, QREF: dqref)
    return newrecQmeno
}
@MainActor func parseRecord(line : String) -> ParseRecordResp
{
    let trimmedString = line.trimmingCharacters(in: .whitespacesAndNewlines)
    if (trimmedString=="")
    {
        if ( datasetstart == true)
        {
          //  print("END DATASET")
            datasetstart = false
            return ParseRecordResp(success:true,resaon: ParserRecordFError.none)
        }
        return ParseRecordResp(success:true,resaon: ParserRecordFError.none)
    }
    var NUCID = ""
    let NUCID1 =  getNUCID1(line : line )
    let NUCID2 =  getNUCID2(line : line )
    if (NUCID2 == "  ")
    {
       // print("REF  \(line)")
    }
    else
    {
        NUCID = NUCID1 + NUCID2
        let tag = getTAG(line : line)
        let exttag = String(tag[String.Index(utf16Offset:2,in: line)...])
        let inttag = String(tag[String.Index(utf16Offset:0,in: line)])
        let inttagc = String(tag[String.Index(utf16Offset:1,in: line)])
        //if (tag == "    " && datasetstart == false)
        if (exttag == "  " && inttagc == " ") // 2 BL START DATASET
        {
         //   print("START BLOCK IDENTIFY FOR   \(NUCID)")
           
            var elemNucl = listNucleidi.filter{$0.id == NUCID.trimmingCharacters(in: .whitespacesAndNewlines)}
            datasetstart = true
            let DSID = getDSID(line : line).trimmingCharacters(in: .whitespacesAndNewlines)
            let DSREF = getDSREF(line : line)
            let PUB = getPUB(line : line)
            let DATE = getDATE(line : line)
            if (elemNucl.count == 0)
            {
              
                var newrecorset = Recordset(identification: DSID, DSREF : DSREF , PUB: PUB , DATE : DATE )
                var listRecordset = [Recordset] ()
                listRecordset.append(newrecorset)
                var nucleide = Nucleide(id: NUCID.trimmingCharacters(in: .whitespacesAndNewlines),A : Int(NUCID1.trimmingCharacters(in: .whitespacesAndNewlines)) ?? -1 , Symbol: NUCID2.trimmingCharacters(in: .whitespacesAndNewlines), lastidentifier : DSID, listRecordset : listRecordset)
                currentNUCID = NUCID.trimmingCharacters(in: .whitespacesAndNewlines)
                currentIDENTIF = DSID
                listNucleidi.append(nucleide)
            }
            else
            {
                var nucle = elemNucl[0]
                if (inttag != " " ) // 1 BL // IDETIFICATION in more than 1 record
                {
                    print("ID DA ACCODARE   \(NUCID)")
                    var elemRecorset = nucle.listRecordset.filter{$0.identification == nucle.lastidentifier}
                    elemRecorset[0].identification = elemRecorset[0].identification + DSID
                    nucle.lastidentifier = elemRecorset[0].identification
                    currentNUCID = NUCID.trimmingCharacters(in: .whitespacesAndNewlines)
                    currentIDENTIF = elemRecorset[0].identification
                   
                }
                else // NUCID already exist , add new recordset with new IDENT
                {
                    var newrecorset = Recordset(identification: DSID, DSREF : DSREF , PUB: PUB , DATE : DATE )
                    nucle.listRecordset.append(newrecorset)
                    nucle.lastidentifier = DSID
                    currentNUCID = NUCID.trimmingCharacters(in: .whitespacesAndNewlines)
                    currentIDENTIF = DSID
                }
              //  listNucleidi.append(nucleide)
            }
           
           
           
         //   print("DSID: \(DSID) DSREF: \(DSREF) PUB: \(PUB)  DATE: \(DATE)" )
        }
        else // OTHER RECORDS IN DATASET
        {
            if (datasetstart == true)
            {
               if (NUCID.trimmingCharacters(in: .whitespacesAndNewlines) != currentNUCID) //   P ERROR OR N
               {
                   if (exttag[String.Index(utf16Offset:0,in: exttag)] == "P") // PARENT
                    {
                       if (inttag == " " && inttagc == " ")
                       {
                           var elemNucl = listNucleidi.filter{$0.id == currentNUCID}
                           var elemRecorset = elemNucl[0].listRecordset.filter{$0.identification == currentIDENTIF}
                           var pare = getPARENTREC(line: line,PNUCID: NUCID.trimmingCharacters(in: .whitespacesAndNewlines))
                           elemRecorset[0].addInPARENTRECRecs(elem: pare)
                       }
                       else
                       {
                           var elemNucl = listNucleidi.filter{$0.id == currentNUCID}
                           var elemRecorset = elemNucl[0].listRecordset.filter{$0.identification == currentIDENTIF}
                           var gencom = getGENCOMMREC(line: line, nrec: inttag, ctype: inttagc)
                           var larrec = (elemRecorset[0].PARENTRECRecs ?? []).last
                           
                           if (larrec?.gcomm == nil )
                           {
                              larrec?.gcomm = []
                           }
                           if (larrec?.gcomm?.last != nil)
                           {
                               let last=larrec?.gcomm?.last
                               if (last!.Ctype == gencom.Ctype)
                               {
                                   if (gencom.nrec != nil)
                                   {
                                       last!.CTEXT = (last!.CTEXT ?? "") + " " + (gencom.CTEXT ?? "")
                                   }
                                   else
                                   {
                                       last!.CTEXT = (last!.CTEXT ?? "") + "\n" + (gencom.CTEXT ?? "")
                                   }
                               }
                               else
                               {
                                   larrec?.gcomm!.append(gencom)
                               }
                           }
                           else
                           {
                               larrec?.gcomm!.append(gencom)
                           }
                         //larrec?.gcomm?.append(gencom)
                           
                       }
                    }
                   else if (exttag[String.Index(utf16Offset:0,in: exttag)] == "N") // NORMALIZ
                    {
                       if (inttag == " " && inttagc == " ")
                       {
                           var elemNucl = listNucleidi.filter{$0.id == currentNUCID}
                           var elemRecorset = elemNucl[0].listRecordset.filter{$0.identification == currentIDENTIF}
                           var pare = getNORMALIZATIOREC(line: line,DNUCID: NUCID.trimmingCharacters(in: .whitespacesAndNewlines))
                           elemRecorset[0].addNORMALIZATIONRecs(elem: pare)
                       }
                       else
                       {
                           var elemNucl = listNucleidi.filter{$0.id == currentNUCID}
                           var elemRecorset = elemNucl[0].listRecordset.filter{$0.identification == currentIDENTIF}
                           var gencom = getGENCOMMREC(line: line, nrec: inttag, ctype: inttagc)
                           var larrec = (elemRecorset[0].NORMALIZATIONRecs ?? []).last
                           if (larrec?.gcomm == nil )
                           {
                              larrec?.gcomm = []
                           }
                           if (larrec?.gcomm?.last != nil)
                           {
                               let last=larrec?.gcomm?.last
                               if (last!.Ctype == gencom.Ctype)
                               {
                                   if (gencom.nrec != nil)
                                   {
                                       last!.CTEXT = (last!.CTEXT ?? "") + " " + (gencom.CTEXT ?? "")
                                   }
                                   else
                                   {
                                       last!.CTEXT = (last!.CTEXT ?? "") + "\n" + (gencom.CTEXT ?? "")
                                   }
                               }
                               else
                               {
                                   larrec?.gcomm!.append(gencom)
                               }
                           }
                           else
                           {
                               larrec?.gcomm!.append(gencom)
                           }
                           //larrec?.gcomm?.append(gencom)
                           
                       }
                    }
                   else
                   {
                       if (exttag == "H ")
                       {
                           return ParseRecordResp(success:true,resaon: ParserRecordFError.errorparging) // ERROR
                       }
                       else
                       {
                       return ParseRecordResp(success:true,resaon: ParserRecordFError.errorparging) // ERROR MOM TRUE for 252BK
                       }
                   }
                   return ParseRecordResp(success:true,resaon: ParserRecordFError.none)
               }
               var elemNucl = listNucleidi.filter{$0.id == NUCID.trimmingCharacters(in: .whitespacesAndNewlines)}
               var elemRecorset = elemNucl[0].listRecordset.filter{$0.identification == currentIDENTIF}
               if (exttag == "H ")
               {
                   var historyrec =  getHISTORYREC(line: line,nrec : inttag)
                   elemRecorset[0].addHYSTRecs(elem: historyrec)
               }
               else if (exttag == "Q ")
               {
                   if (inttag == " " && inttagc == " ")
                   {
                       var qmenorec = getQMENOREC(line: line)
                       elemRecorset[0].QMenoRec = qmenorec
                   }
                   else if (inttagc == "c" ||  inttagc == "C" || inttagc == "t" || inttagc == "T" || inttagc == "D" || inttagc == "d")
                   {
                       var gencom = getGENCOMMREC(line: line, nrec: inttag, ctype: inttagc)
                       var larrec = elemRecorset[0].QMenoRec
                       if (larrec?.gcomm == nil )
                       {
                          larrec?.gcomm = []
                       }
                       if (larrec?.gcomm?.last != nil)
                       {
                           let last=larrec?.gcomm?.last
                           if (last!.Ctype == gencom.Ctype)
                           {
                               if (gencom.nrec != nil)
                               {
                                   last!.CTEXT = (last!.CTEXT ?? "") + " " + (gencom.CTEXT ?? "")
                               }
                               else
                               {
                                   last!.CTEXT = (last!.CTEXT ?? "") + "\n" + (gencom.CTEXT ?? "")
                               }
                           }
                           else
                           {
                               larrec?.gcomm!.append(gencom)
                           }
                       }
                       else
                       {
                           larrec?.gcomm!.append(gencom)
                       }
                       //larrec?.gcomm?.append(gencom)
                   }
                   else
                   {
                       return ParseRecordResp(success:true,resaon: ParserRecordFError.errorparging) // ERROR MOM
                   }
                  
               }
               else if (inttag == " " && inttagc == " " && exttag[String.Index(utf16Offset:0,in: exttag)] == "X") // CROSS REF
                {
                   var crosref = getCROSSREFREC(line: line)
                   elemRecorset[0].addInCROSSRERecs(elem: crosref)
                }
                else if (exttag[String.Index(utf16Offset:0,in: exttag)] == "N") // NORMALIZ
                 {
                    if (inttag == " " && (inttagc == " " || inttagc == "P")) // ??
                    {
                        if (inttagc == " " )
                        {
                        var pare = getNORMALIZATIOREC(line: line,DNUCID: NUCID.trimmingCharacters(in: .whitespacesAndNewlines))
                        elemRecorset[0].addNORMALIZATIONRecs(elem: pare)
                        }
                        else
                        {
                        var pare = getPNORMALIZATIONREC(line: line,DNUCID: NUCID.trimmingCharacters(in: .whitespacesAndNewlines))
                        elemRecorset[0].addPNORMALIZATIONRecs(elem: pare)
                        }
                    }
                    else if (inttagc == "c" ||  inttagc == "C" || inttagc == "t" || inttagc == "T" || inttagc == "D" || inttagc == "d")
                    {
                         var gencom = getGENCOMMREC(line: line, nrec: inttag, ctype: inttagc)
                        var larrec = (elemRecorset[0].NORMALIZATIONRecs ?? []).last
                        if (larrec?.gcomm == nil )
                        {
                           larrec?.gcomm = []
                        }
                        if (larrec?.gcomm?.last != nil)
                        {
                            let last=larrec?.gcomm?.last
                            if (last!.Ctype == gencom.Ctype)
                            {
                                if (gencom.nrec != nil)
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + " " + (gencom.CTEXT ?? "")
                                }
                                else
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + "\n" + (gencom.CTEXT ?? "")
                                }
                            }
                            else
                            {
                                larrec?.gcomm!.append(gencom)
                            }
                        }
                        else
                        {
                            larrec?.gcomm!.append(gencom)
                        }
                        //larrec?.gcomm?.append(gencom)
                        
                    }
                    else
                    {
                        if (inttag != " " && inttagc == "P")
                        {
                             var gencom = getGENCOMMREC(line: line, nrec: inttag, ctype: inttagc)
                             var larrec = (elemRecorset[0].PNORMALIZATIONRecs ?? []).last
                             if (larrec?.gcomm == nil )
                             {
                                larrec?.gcomm = []
                             }
                            if (larrec?.gcomm?.last != nil)
                            {
                                let last=larrec?.gcomm?.last
                                if (last!.Ctype == gencom.Ctype)
                                {
                                    if (gencom.nrec != nil)
                                    {
                                        last!.CTEXT = (last!.CTEXT ?? "") + " " + (gencom.CTEXT ?? "")
                                    }
                                    else
                                    {
                                        last!.CTEXT = (last!.CTEXT ?? "") + "\n" + (gencom.CTEXT ?? "")
                                    }
                                }
                                else
                                {
                                    larrec?.gcomm!.append(gencom)
                                }
                            }
                            else
                            {
                                larrec?.gcomm!.append(gencom)
                            }
                             //larrec?.gcomm?.append(gencom)
                            
                        }
                        else
                        {
                            return ParseRecordResp(success:false,resaon: ParserRecordFError.errorparging) // ERROR
                        }
                    }
                 }
                else if (exttag[String.Index(utf16Offset:0,in: exttag)] == "L") // LEVEL
                 {
                    if ( inttagc == " ")
                    {
                        if (inttag == " ")
                        {
                            var pare = getLEVELREC(line: line,nrec: inttag)
                            elemRecorset[0].addLEVELRecs(elem: pare)
                        }
                        else
                        {
                            var addd = getValue(line: line, from: 10, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
                            var larrec = (elemRecorset[0].LEVELRecs ?? []).last
                            if (larrec?.addData == nil )
                            {
                               larrec?.addData = []
                            }
                            larrec?.addData?.append(addd)
                        }
                    }
                    else if (inttagc == "c" ||  inttagc == "C" || inttagc == "t" || inttagc == "T" || inttagc == "D" || inttagc == "d")
                    {
                        let gencom = getGENCOMMREC(line: line, nrec: inttag, ctype: inttagc)
                        var larrec = (elemRecorset[0].LEVELRecs ?? []).last
                        if (larrec?.gcomm == nil )
                        {
                            larrec?.gcomm = []
                        }
                        if (larrec?.gcomm?.last != nil)
                        {
                            let last=larrec?.gcomm?.last
                            if (last!.Ctype == gencom.Ctype)
                            {
                                if (gencom.nrec != nil)
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + " " + (gencom.CTEXT ?? "")
                                }
                                else
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + "\n" + (gencom.CTEXT ?? "")
                                }
                            }
                            else
                            {
                                larrec?.gcomm!.append(gencom)
                            }
                        }
                        else
                        {
                            larrec?.gcomm!.append(gencom)
                        }
                     
                        //larrec?.gcomm?.append(gencom)
                        
                    }
                    else
                    {
                        return ParseRecordResp(success:true,resaon: ParserRecordFError.errorparging) // ERROR  mom true for   70GE 2L $B(E1)=0.8 {I2}
                    }
                 }
                else if (exttag[String.Index(utf16Offset:0,in: exttag)] == "G") // GAMMAL
                 {
                    if ( inttagc == " ")
                    {
                        if (inttag == " ")
                        {
                            var pare = getGAMMALEVELREC(line: line,nrec: inttag)
                            elemRecorset[0].addGAMMALEVELRecs(elem: pare)
                        }
                        else
                        {
                            var addd = getValue(line: line, from: 10, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
                            var larrec = (elemRecorset[0].GAMMALEVELRecs ?? []).last
                            if (larrec?.addData == nil )
                            {
                               larrec?.addData = []
                            }
                            larrec?.addData?.append(addd)
                        }
                    }
                    else if (inttagc == "c" ||  inttagc == "C" || inttagc == "t" || inttagc == "T" || inttagc == "D" || inttagc == "d")
                    {
                        let gencom = getGENCOMMREC(line: line, nrec: inttag, ctype: inttagc)
                        var larrec = (elemRecorset[0].GAMMALEVELRecs ?? []).last
                        
                        if (larrec?.gcomm == nil )
                        {
                            larrec?.gcomm = []
                        }
                        if (larrec?.gcomm?.last != nil)
                        {
                            let last=larrec?.gcomm?.last
                            if (last!.Ctype == gencom.Ctype)
                            {
                                if (gencom.nrec != nil)
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + " " + (gencom.CTEXT ?? "")
                                }
                                else
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + "\n" + (gencom.CTEXT ?? "")
                                }
                            }
                            else
                            {
                                larrec?.gcomm!.append(gencom)
                            }
                        }
                        else
                        {
                            larrec?.gcomm!.append(gencom)
                        }
                        //larrec?.gcomm?.append(gencom)
                        
                    }
                    else
                    {
                        return ParseRecordResp(success:false,resaon: ParserRecordFError.errorparging) // ERROR
                    }
                 }
                else if (exttag[String.Index(utf16Offset:0,in: exttag)] == "B") // BETAMENOL
                 {
                    if ( inttagc == " ")
                    {
                        if (inttag == " ")
                        {
                            var pare = getBETAMENOLEVELREC(line: line,nrec: inttag)
                            elemRecorset[0].addBETAMENOLEVELRecs(elem: pare)
                        }
                        else
                        {
                            var addd = getValue(line: line, from: 10, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
                            var larrec = (elemRecorset[0].BETAMENOLEVELRecs ?? []).last
                            if (larrec?.addData == nil )
                            {
                               larrec?.addData = []
                            }
                            larrec?.addData?.append(addd)
                        }
                    }
                    else if (inttagc == "c" ||  inttagc == "C" || inttagc == "t" || inttagc == "T" || inttagc == "D" || inttagc == "d")
                    {
                         var gencom = getGENCOMMREC(line: line, nrec: inttag, ctype: inttagc)
                        var larrec = (elemRecorset[0].BETAMENOLEVELRecs ?? []).last
                        if (larrec?.gcomm == nil )
                        {
                           larrec?.gcomm = []
                        }
                        if (larrec?.gcomm?.last != nil)
                        {
                            let last=larrec?.gcomm?.last
                            if (last!.Ctype == gencom.Ctype)
                            {
                                if (gencom.nrec != nil)
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + " " + (gencom.CTEXT ?? "")
                                }
                                else
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + "\n" + (gencom.CTEXT ?? "")
                                }
                            }
                            else
                            {
                                larrec?.gcomm!.append(gencom)
                            }
                        }
                        else
                        {
                            larrec?.gcomm!.append(gencom)
                        }
                        //larrec?.gcomm?.append(gencom)
                        
                    }
                    else
                    {
                        return ParseRecordResp(success:false,resaon: ParserRecordFError.errorparging) // ERROR
                    }
                 }
                else if (exttag[String.Index(utf16Offset:0,in: exttag)] == "E") // ECL
                 {
                    if ( inttagc == " ")
                    {
                        if (inttag == " ")
                        {
                            var pare = getECLEVELREC(line: line,nrec: inttag)
                            elemRecorset[0].addECLEVELRecs(elem: pare)
                        }
                        else
                        {
                            var addd = getValue(line: line, from: 10, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
                            var larrec = (elemRecorset[0].ECLEVELRecs ?? []).last
                            if (larrec?.addData == nil )
                            {
                               larrec?.addData = []
                            }
                            larrec?.addData?.append(addd)
                        }
                    }
                    else if (inttagc == "c" ||  inttagc == "C" || inttagc == "t" || inttagc == "T" || inttagc == "D" || inttagc == "d")
                    {
                         var gencom = getGENCOMMREC(line: line, nrec: inttag, ctype: inttagc)
                        var larrec = (elemRecorset[0].ECLEVELRecs ?? []).last
                        if (larrec?.gcomm == nil )
                        {
                           larrec?.gcomm = []
                        }
                        if (larrec?.gcomm?.last != nil)
                        {
                            let last=larrec?.gcomm?.last
                            if (last!.Ctype == gencom.Ctype)
                            {
                                if (gencom.nrec != nil)
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + " " + (gencom.CTEXT ?? "")
                                }
                                else
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + "\n" + (gencom.CTEXT ?? "")
                                }
                            }
                            else
                            {
                                larrec?.gcomm!.append(gencom)
                            }
                        }
                        else
                        {
                            larrec?.gcomm!.append(gencom)
                        }
                        //larrec?.gcomm?.append(gencom)
                        
                    }
                    else
                    {
                        return ParseRecordResp(success:false,resaon: ParserRecordFError.errorparging) // ERROR
                    }
                 }
                else if (exttag[String.Index(utf16Offset:0,in: exttag)] == "A") //ALFA
                 {
                    if ( inttagc == " ")
                    {
                        if (inttag == " ")
                        {
                            var pare = getALFALEVELREC(line: line,nrec: inttag)
                            elemRecorset[0].addALFALEVELRecs(elem: pare)
                        }
                        else
                        {
                            var addd = getValue(line: line, from: 10, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
                            var larrec = (elemRecorset[0].ALFALEVELRecs ?? []).last
                            if (larrec?.addData == nil )
                            {
                               larrec?.addData = []
                            }
                            larrec?.addData?.append(addd)
                        }
                    }
                    else if (inttagc == "c" ||  inttagc == "C" || inttagc == "t" || inttagc == "T" || inttagc == "D" || inttagc == "d")
                    {
                         var gencom = getGENCOMMREC(line: line, nrec: inttag, ctype: inttagc)
                        var larrec = (elemRecorset[0].ALFALEVELRecs ?? []).last
                        if (larrec?.gcomm == nil )
                        {
                           larrec?.gcomm = []
                        }
                        if (larrec?.gcomm?.last != nil)
                        {
                            let last=larrec?.gcomm?.last
                            if (last!.Ctype == gencom.Ctype)
                            {
                                if (gencom.nrec != nil)
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + " " + (gencom.CTEXT ?? "")
                                }
                                else
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + "\n" + (gencom.CTEXT ?? "")
                                }
                            }
                            else
                            {
                                larrec?.gcomm!.append(gencom)
                            }
                        }
                        else
                        {
                            larrec?.gcomm!.append(gencom)
                        }
                        //larrec?.gcomm?.append(gencom)
                        
                    }
                    else
                    {
                        return ParseRecordResp(success:false,resaon: ParserRecordFError.errorparging) // ERROR
                    }
                 }
                else if (exttag[String.Index(utf16Offset:0,in: exttag)] == "D") //DDELAYL
                 {
                    if ( inttagc == " ")
                    {
                        if (inttag == " ")
                        {
                            var pare = getDMENOPARTICLELEVELREC(line: line,nrec: inttag)
                            elemRecorset[0].addDMENOPARTICLELEVELRecs(elem: pare)
                        }
                        else
                        {
                            var addd = getValue(line: line, from: 10, to: 80).trimmingCharacters(in: .whitespacesAndNewlines)
                            var larrec = (elemRecorset[0].DMENOPARTICLELEVELRecs ?? []).last
                            if (larrec?.addData == nil )
                            {
                               larrec?.addData = []
                            }
                            larrec?.addData?.append(addd)
                        }
                    }
                    else if (inttagc == "c" ||  inttagc == "C" || inttagc == "t" || inttagc == "T" || inttagc == "D" || inttagc == "d")
                    {
                        var gencom = getGENCOMMREC(line: line, nrec: inttag, ctype: inttagc)
                        var larrec = (elemRecorset[0].DMENOPARTICLELEVELRecs ?? []).last
                        if (larrec?.gcomm == nil )
                        {
                           larrec?.gcomm = []
                        }
                        if (larrec?.gcomm?.last != nil)
                        {
                            let last=larrec?.gcomm?.last
                            if (last!.Ctype == gencom.Ctype)
                            {
                                if (gencom.nrec != nil)
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + " " + (gencom.CTEXT ?? "")
                                }
                                else
                                {
                                    last!.CTEXT = (last!.CTEXT ?? "") + "\n" + (gencom.CTEXT ?? "")
                                }
                            }
                            else
                            {
                                larrec?.gcomm!.append(gencom)
                            }
                        }
                        else
                        {
                            larrec?.gcomm!.append(gencom)
                        }
                        //larrec?.gcomm?.append(gencom)
                        
                    }
                    else
                    {
                        return ParseRecordResp(success:false,resaon: ParserRecordFError.errorparging) // ERROR
                    }
                 }
                 else if (exttag[String.Index(utf16Offset:0,in: exttag)] == " ") //COMMENT
                 {
                    if (inttagc == "c" ||  inttagc == "C" || inttagc == "t" || inttagc == "T" || inttagc == "D" || inttagc == "d")
                    {
                        let gencom = getGENCOMMREC(line: line, nrec: inttag, ctype: inttagc)
                        elemRecorset[0].addGENERALCOMRecs(elem:gencom)
                       
                        
                    }
                    else
                    {
                        return ParseRecordResp(success:true,resaon: ParserRecordFError.errorparging) // ERROR MOM TRUE
                    }
                 }
               
          
                
                
           //  print(line)
            }
            else
            {
                return ParseRecordResp(success:false,resaon: ParserRecordFError.errorparging)
            }
        }
    }
    //print("a \(NUCID1) \(NUCID2)")
    return ParseRecordResp(success:true,resaon: ParserRecordFError.none)
}


class StreamReader  {
    
    let encoding : String.Encoding
    let chunkSize : Int
    var fileHandle : FileHandle!
    let delimData : Data
    var buffer : Data
    var atEof : Bool
    
    init?(path: String, delimiter: String = "\n", encoding: String.Encoding = .utf8,
          chunkSize: Int = 4096) {
        
        guard let fileHandle = FileHandle(forReadingAtPath: path),
            let delimData = delimiter.data(using: encoding) else {
                return nil
        }
        self.encoding = encoding
        self.chunkSize = chunkSize
        self.fileHandle = fileHandle
        self.delimData = delimData
        self.buffer = Data(capacity: chunkSize)
        self.atEof = false
    }
    
    deinit {
        self.close()
    }
    
    /// Return next line, or nil on EOF.
    func nextLine() -> String? {
        precondition(fileHandle != nil, "Attempt to read from closed file")
        
        // Read data chunks from file until a line delimiter is found:
        while !atEof {
            if let range = buffer.range(of: delimData) {
                // Convert complete line (excluding the delimiter) to a string:
                let line = String(data: buffer.subdata(in: 0..<range.lowerBound), encoding: encoding)
                // Remove line (and the delimiter) from the buffer:
                buffer.removeSubrange(0..<range.upperBound)
                return line
            }
            let tmpData = fileHandle.readData(ofLength: chunkSize)
            if tmpData.count > 0 {
                buffer.append(tmpData)
            } else {
                // EOF or read error.
                atEof = true
                if buffer.count > 0 {
                    // Buffer contains last line in file (not terminated by delimiter).
                    let line = String(data: buffer as Data, encoding: encoding)
                    buffer.count = 0
                    return line
                }
            }
        }
        return nil
    }
    
    /// Start reading from the beginning of file.
    func rewind() -> Void {
        fileHandle.seek(toFileOffset: 0)
        buffer.count = 0
        atEof = false
    }
    
    /// Close the underlying file. No reading must be done after calling this method.
    func close() -> Void {
        fileHandle?.closeFile()
        fileHandle = nil
    }
}

extension StreamReader : Sequence {
    func makeIterator() -> AnyIterator<String> {
        return AnyIterator {
            return self.nextLine()
        }
    }
}

@available(macOS 10.15.0, *)
func getfileNuc2() async throws
{
    
    
    let fm = FileManager.default
    let path = "/Users/albinomontella/Downloads/ensdf_241101/"

    do {
        let items = try fm.contentsOfDirectory(atPath: path)

        for item in items {
            print("parding file \(item) ")
            if let aStreamReader = StreamReader(path:path+item) {
               defer {
                   aStreamReader.close()
               }
               while let line = aStreamReader.nextLine() {
                   //print(line)
                   let pr =  await parseRecord(line: line)
                   
                   if pr.success == false
                   {
                       throw ParserENSDFError.invalidRecordLenght(file: "040")
                   }
               }
              //  await generateJSONData(from: listNucleidi)
            }
        }
    } catch {
        // failed to read directory – bad permissions, perhaps?
    }

   
     
 
}

func addm1(elemn: inout Nucleide, m1ele: [String: Any]  )
{
    elemn.ATOMIC_MASS =  (m1ele["ATOMIC_MASS"] as! String) != "" ? (m1ele["ATOMIC_MASS"] as! String) : nil
    elemn.BETA_DECAY_ENERGY =  (m1ele["BETA_DECAY_ENERGY"] as! String) != "" ? (m1ele["BETA_DECAY_ENERGY"] as! String) : nil
    elemn.Z =   m1ele["Z"] as! String
    elemn.N =  m1ele["N"] as! String
    elemn.MASS_EXCESS = (m1ele["MASS_EXCESS"] as! String) != "" ? (m1ele["MASS_EXCESS"] as! String) : nil
    elemn.ER_MASS_EXCESS = (m1ele["ER_MASS_EXCESS"] as! String) != "" ? (m1ele["ER_MASS_EXCESS"] as! String) : nil
    elemn.BINDING_ENERGY_div_A = (m1ele["BINDING_ENERGY_div_A"] as! String) != "" ? (m1ele["BINDING_ENERGY_div_A"] as! String) : nil
    elemn.ER_BINDING_ENERGY_div_A = (m1ele["ER_BINDING_ENERGY_div_A"] as! String) != "" ? (m1ele["ER_BINDING_ENERGY_div_A"] as! String) : nil
    elemn.ER_BETA_DECAY_ENERGY =  (m1ele["ER_BETA_DECAY_ENERGY"] as! String) != "" ? (m1ele["ER_BETA_DECAY_ENERGY"] as! String) : nil
    elemn.ER_ATOMIC_MASS =  (m1ele["ER_ATOMIC_MASS"] as! String) != "" ? (m1ele["ER_ATOMIC_MASS"] as! String) : nil
}
func addm2(elemn: inout Nucleide, m1ele: [String: Any]  )
{
    elemn.S_2n_ =  (m1ele["S_2n_"] as! String) != "" ? (m1ele["S_2n_"] as! String) : nil
    elemn.S_2p_ =  (m1ele["S_2p_"] as! String) != "" ? (m1ele["S_2p_"] as! String) : nil
    elemn.Q_a_ = (m1ele["Q_a_"] as! String) != "" ? (m1ele["Q_a_"] as! String) : nil
    elemn.Q_2BMeno_ = (m1ele["Q_2BMeno_"] as! String) != "" ? (m1ele["Q_2BMeno_"] as! String) : nil
    elemn.Q_ep_ = (m1ele["Q_ep_"] as! String) != "" ? (m1ele["Q_ep_"] as! String) : nil
    elemn.Q_BMenon_ = (m1ele["Q_BMenon_"] as! String) != "" ? (m1ele["Q_BMenon_"] as! String) : nil
    elemn.ER_S_2n_ = (m1ele["ER_S_2n_"] as! String) != "" ? (m1ele["ER_S_2n_"] as! String) : nil
    elemn.ER_S_2p_ = (m1ele["ER_S_2p_"] as! String) != "" ? (m1ele["ER_S_2p_"] as! String) : nil
    elemn.ER_Q_a_ =  (m1ele["ER_Q_a_"] as! String) != "" ? (m1ele["ER_Q_a_"] as! String) : nil
    elemn.ER_Q_2BMeno_ =  (m1ele["ER_Q_2BMeno_"] as! String) != "" ? (m1ele["ER_Q_2BMeno_"] as! String) : nil
    elemn.ER_Q_ep_ = (m1ele["ER_Q_ep_"] as! String) != "" ? (m1ele["ER_Q_ep_"] as! String) : nil
    elemn.ER_Q_BMenon_ = (m1ele["ER_Q_BMenon_"] as! String) != "" ? (m1ele["ER_Q_BMenon_"] as! String) : nil
}


func addm3(elemn: inout Nucleide, m1ele: [String: Any]  )
{
    elemn.S_n_ =  (m1ele["S_n_"] as! String) != "" ? (m1ele["S_n_"] as! String) : nil
    elemn.ER_S_n_ =  (m1ele["ER_S_n_"] as! String) != "" ? (m1ele["ER_S_n_"] as! String) : nil
    elemn.S_p_ = (m1ele["S_p_"] as! String) != "" ? (m1ele["S_p_"] as! String) : nil
    elemn.ER_S_p_ = (m1ele["ER_S_p_"] as! String) != "" ? (m1ele["ER_S_p_"] as! String) : nil
    elemn.Q_4BMeno_ = (m1ele["Q_4BMeno_"] as! String) != "" ? (m1ele["Q_4BMeno_"] as! String) : nil
    elemn.ER_Q_4BMeno_ = (m1ele["ER_Q_4BMeno_"] as! String) != "" ? (m1ele["ER_Q_4BMeno_"] as! String) : nil
    elemn.Q_da_ = (m1ele["Q_da_"] as! String) != "" ? (m1ele["Q_da_"] as! String) : nil
    elemn.ER_Q_da_ =  (m1ele["ER_Q_da_"] as! String) != "" ? (m1ele["ER_Q_da_"] as! String) : nil
    elemn.Q_pa_ =  (m1ele["Q_pa_"] as! String) != "" ? (m1ele["Q_pa_"] as! String) : nil
    elemn.ER_Q_pa_ = (m1ele["ER_Q_pa_"] as! String) != "" ? (m1ele["ER_Q_pa_"] as! String) : nil
    elemn.Q_na_ = (m1ele["Q_na_"] as! String) != "" ? (m1ele["Q_na_"] as! String) : nil
    elemn.ER_Q_na_ = (m1ele["ER_Q_na_"] as! String) != "" ? (m1ele["ER_Q_na_"] as! String) : nil

}

func addm4(elemn: inout Nucleide, m1ele: [String: Any]  )
{
    elemn.T =  (m1ele["T"] as! String) != "" ? (m1ele["T"] as! String) : nil
    elemn.T_UNIT =  (m1ele["T_UNIT"] as! String) != "" ? (m1ele["T_UNIT"] as! String) : nil
    elemn.T_UNC = (m1ele["T_UNC"] as! String) != "" ? (m1ele["T_UNC"] as! String) : nil
    elemn.Spin_Parity = (m1ele["Spin_Parity"] as! String) != "" ? (m1ele["Spin_Parity"] as! String) : nil
    elemn.Discovery = (m1ele["Discovery"] as! String) != "" ? (m1ele["Discovery"] as! String) : nil
    elemn.BR = (m1ele["BR"] as! String) != "" ? (m1ele["BR"] as! String) : nil

}



@available(macOS 10.15.0, *)
@MainActor func getNucleidiStruc(from : String) async throws -> [Nucleide]
{
    
    let m1 = parsemassfile()
    var m2 = parsemass2file()
    var m3 = parsemass3file()
    var m4 = parsemass4file()
    
    let fm = FileManager.default
    let path = from
    var i : Int = 0
    do {
        let items = try fm.contentsOfDirectory(atPath: path)

        for item in items {
            print("parding file \(item) ")
            if let aStreamReader = StreamReader(path:path+item) {
               defer {
                   aStreamReader.close()
               }
               while let line = aStreamReader.nextLine() {
                   //print(line)
                   let pr =   parseRecord(line: line)
                   
                   if pr.success == false
                   {
                       throw ParserENSDFError.invalidRecordLenght(file: "040")
                   }
               }
                i = i + 1
                print ("i: \(i) num nucleide : \(listNucleidi.count)")
            }
        }
        for i in  (0..<listNucleidi.count)
        {
            var itemn = listNucleidi[i]
            let allKey3 = m1.compactMap
            {
                
                if (($0["AEL"] as! String) == itemn.id )
                {
                    return $0
                }
                else
                {
                    return nil
                }
            }
            if (allKey3.count > 0)
            {
                addm1(elemn: &itemn, m1ele: allKey3[0])
            }
            
            let allKey32 = m2.compactMap
            {
                
                if (($0["AEL"] as! String) == itemn.id )
                {
                    return $0
                }
                else
                {
                    return nil
                }
            }
            if (allKey32.count > 0)
            {
                addm2(elemn: &itemn, m1ele: allKey32[0])
            }
            let allKey33 = m3.compactMap
            {
                
                if (($0["AEL"] as! String) == itemn.id )
                {
                    return $0
                }
                else
                {
                    return nil
                }
            }
            if (allKey33.count > 0)
            {
                addm3(elemn: &itemn, m1ele: allKey33[0])
            }
            var allKey34 = m4.compactMap
            {
                
                if (($0["AEL"] as! String) == itemn.id )
                {
                    return $0
                }
                else
                {
                    return nil
                }
            }
            if (allKey34.count > 0)
            {
                addm4(elemn: &itemn, m1ele: allKey34[0])
            }
            
        }
    } catch {
        print("err")
    }

    return  listNucleidi
     
 
}

@MainActor func SaveNucleidiToJsonInSeparateFiles(from : String )  throws
{
    let m1 = parsemassfile()
    let m2 = parsemass2file()
    let m3 = parsemass3file()
    var m4 = parsemass4file()
    
    let fm = FileManager.default
    let path = from
    var listanucleidiPrin = [Nucleide]()
    do {
        let items = try fm.contentsOfDirectory(atPath: path)

        for item in items {
            print("parding file \(item) ")
            if let aStreamReader = StreamReader(path:path+item) {
               defer {
                   aStreamReader.close()
               }
               listNucleidi.removeAll()
               while let line = aStreamReader.nextLine() {
                   //print(line)
                   let pr =   parseRecord(line: line)
                   
                   if pr.success == false
                   {
                       throw ParserENSDFError.invalidRecordLenght(file: "040")
                   }
               }
                for i in  (0..<listNucleidi.count)
                {
                    var itemn = listNucleidi[i]
                    var itemmom = Nucleide(id:itemn.id, A : itemn.A, Symbol: itemn.Symbol)
                    let allKey3 = m1.compactMap
                    {
                        
                        if (($0["AEL"] as! String) == itemn.id )
                        {
                            return $0
                        }
                        else
                        {
                            return nil
                        }
                    }
                    if (allKey3.count > 0)
                    {
                        
                        addm1(elemn: &itemmom, m1ele: allKey3[0])
                    }
                    let allKey32 = m2.compactMap
                    {
                        
                        if (($0["AEL"] as! String) == itemn.id )
                        {
                            return $0
                        }
                        else
                        {
                            return nil
                        }
                    }
                    if (allKey32.count > 0)
                    {
                        addm2(elemn: &itemmom, m1ele: allKey32[0])
                    }
                    let allKey33 = m3.compactMap
                    {
                        
                        if (($0["AEL"] as! String) == itemn.id )
                        {
                            return $0
                        }
                        else
                        {
                            return nil
                        }
                    }
                    if (allKey33.count > 0)
                    {
                        addm3(elemn: &itemmom, m1ele: allKey33[0])
                    }
                    let allKey34 = m4.compactMap
                    {
                        
                        if (($0["AEL"] as! String) == itemn.id )
                        {
                            return $0
                        }
                        else
                        {
                            return nil
                        }
                    }
                    if (allKey34.count > 0)
                    {
                        addm4(elemn: &itemmom, m1ele: allKey34[0])
                    }
                    listanucleidiPrin.append(itemmom)
                }
                let data = generateJSONData(from: listNucleidi)!
                saveJson(data : data , namefile: item )
                
            }
            let data = generateJSONData(from: listanucleidiPrin)!
            saveJson(data : data , namefile: "NucleidiPrinc" )
        }
    } catch {
        print ("error")
        // failed to read directory – bad permissions, perhaps?
    }

   
     
 
}

@MainActor func SaveNucleidiToJson(from : String )  throws
{
    let m1 = parsemassfile()
    let m2 = parsemass2file()
    let m3 = parsemass3file()
    var m4 = parsemass4file()
    
    let fm = FileManager.default
    let path = from

    do {
        let items = try fm.contentsOfDirectory(atPath: path)

        for item in items {
            print("parding file \(item) ")
            if let aStreamReader = StreamReader(path:path+item) {
               defer {
                   aStreamReader.close()
               }
               listNucleidi.removeAll()
               while let line = aStreamReader.nextLine() {
                   //print(line)
                   let pr =   parseRecord(line: line)
                   
                   if pr.success == false
                   {
                       throw ParserENSDFError.invalidRecordLenght(file: "040")
                   }
               }
                for i in  (0..<listNucleidi.count)
                {
                    var itemn = listNucleidi[i]
                    let allKey3 = m1.compactMap
                    {
                        
                        if (($0["AEL"] as! String) == itemn.id )
                        {
                            return $0
                        }
                        else
                        {
                            return nil
                        }
                    }
                    if (allKey3.count > 0)
                    {
                        addm1(elemn: &itemn, m1ele: allKey3[0])
                    }
                    let allKey32 = m2.compactMap
                    {
                        
                        if (($0["AEL"] as! String) == itemn.id )
                        {
                            return $0
                        }
                        else
                        {
                            return nil
                        }
                    }
                    if (allKey32.count > 0)
                    {
                        addm2(elemn: &itemn, m1ele: allKey32[0])
                    }
                    let allKey33 = m3.compactMap
                    {
                        
                        if (($0["AEL"] as! String) == itemn.id )
                        {
                            return $0
                        }
                        else
                        {
                            return nil
                        }
                    }
                    if (allKey33.count > 0)
                    {
                        addm3(elemn: &itemn, m1ele: allKey33[0])
                    }
                    let allKey34 = m4.compactMap
                    {
                        
                        if (($0["AEL"] as! String) == itemn.id )
                        {
                            return $0
                        }
                        else
                        {
                            return nil
                        }
                    }
                    if (allKey34.count > 0)
                    {
                        addm4(elemn: &itemn, m1ele: allKey34[0])
                    }
                }
                let data = generateJSONData(from: listNucleidi)!
                saveJson(data : data , namefile: item )
            }
        }
    } catch {
        print ("error")
        // failed to read directory – bad permissions, perhaps?
    }

   
     
 
}


@available(macOS 10.15.0, *)
@available(iOS 13.0.0, *)
@MainActor func getfileNuc()  throws
{
    //if let fileURL = Bundle.module.url(forResource: "ensdf", withExtension: "040") {
            /*
            let fileHandle = try! FileHandle.init(forReadingFrom: fileURL)
            if #available(iOS 15.0, *) {
            if #available(macOS 12.0, *) {
                for  try await line in fileHandle.bytes.lines {
                    if (line.count != 80 )
                    {
                        throw ParserENSDFError.invalidRecordLenght(file: "040")
                    }
                    //await readDataSFromFile()
                    //print(line)
                    
                    await parseRecord(line: line)
                    
                }
            } else {
                print("failed")
            }
        } else {
            print("failed2")
        }
            try  fileHandle.close()
             */
        if let aStreamReader = StreamReader(path: "/Users/albinomontella/Downloads/ensdf_241101/ensdf.067") {
           defer {
               aStreamReader.close()
           }
           while let line = aStreamReader.nextLine() {
               //print(line)
               let pr =  parseRecord(line: line)
               if pr.success == false
               {
                   throw ParserENSDFError.invalidRecordLenght(file: "040")
               }
           }
        }
        var data = generateJSONData(from: listNucleidi)!
        saveJson(data : data , namefile: "067" )
           //
        
  //  }
 //   else  {
  //      print("file missing")
  //  }
}



func saveJson(data: Data, namefile :String) {
    do {
       
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        var fileURL = documentsDirectory.appendingPathComponent(namefile + ".json")
        try data.write(to: fileURL)
    } catch {
        print("Error saving JSON: \(error)")
    }
}





// Legge un campo alfanumerico (A)
func readAlphanumeric(_ line: String, start: Int, length: Int) -> String {
    if (start > line.count)
    {
        return ""
    }
    let startIndex = line.index(line.startIndex, offsetBy: start)
    var endIndex = line.endIndex
    if (start+length < line.count)
    {
        endIndex = line.index(startIndex, offsetBy: length)
    }
    return String(line[startIndex..<endIndex]).trimmingCharacters(in: .whitespaces).filter { !"\r".contains($0) }
}

// Legge un campo intero (I)
func readInteger(_ line: String, start: Int, length: Int) -> Int? {
    let rawValue = readAlphanumeric(line, start: start, length: length)
    return Int(rawValue)
}

// Legge un campo a virgola mobile (F)
func readFloat(_ line: String, start: Int, length: Int) -> Double? {
    let rawValue = readAlphanumeric(line, start: start, length: length)
    return Double(rawValue)
}

// Ignora un campo di tipo X (spazio)
func skipField(_ start: Int, length: Int) -> Int {
    return start + length
}

func parseLine(line: String) -> [String: Any] {
    var fields: [String: Any] = [:]
    var position = 0
/*
    fields["f"] = readAlphanumeric(line, start: position, length: 1)
    position += 1
                               
    fields["NmZ"] = readInteger(line, start: position, length: 3)
    position += 3
   
    fields["N"] = readInteger(line, start: position, length: 5)
    position += 5
   
    fields["Z"] = readInteger(line, start: position, length: 5)
    position += 5
   
    fields["A"] = readInteger(line, start: position, length: 5)
    position += 5
   
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["EL"] = readAlphanumeric(line, start: position, length: 3)
    position += 3
   
    fields["O"] = readAlphanumeric(line, start: position, length: 4)
    position += 4
   
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["MASS_EXCESS"] = readFloat(line, start: position, length: 14)
    position += 14
   
    fields["ERR_MASS_EXCESS"] = readFloat(line, start: position, length: 12)
    position += 12
   
    fields["BINDING_ENERGY_div_A"] = readFloat(line, start: position, length: 13)
    position += 13
   
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["ER_BINDING_ENERGY_div_A"] = readFloat(line, start: position, length: 10)
    position += 10
   
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["B"] = readAlphanumeric(line, start: position, length: 2)
    position += 2
   
    fields["BETA_DECAY_ENERGY"] = readFloat(line, start: position, length: 13)
    position += 13
   
    fields["ER_BETA_DECAY_ENERGY"] = readFloat(line, start: position, length: 11)
    position += 11
   
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["_?_"] = readInteger(line, start: position, length: 3)
    position += 3
   
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["ATOMIC_MASS"] = readFloat(line, start: position, length: 13)
    position += 13
   
    fields["ER_ATOMIC_MASS"] = readFloat(line, start: position, length: 12)
   */
    fields["f"] = readAlphanumeric(line, start: position, length: 1)
    position += 1
                               
    fields["NmZ"] = readAlphanumeric(line, start: position, length: 3)
    position += 3
   
    fields["N"] = readAlphanumeric(line, start: position, length: 5)
    position += 5
   
    fields["Z"] = readAlphanumeric(line, start: position, length: 5)
    position += 5
   
    fields["A"] = readAlphanumeric(line, start: position, length: 5)
    position += 5
   
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["EL"] = readAlphanumeric(line, start: position, length: 3)
    position += 3
   
    fields["O"] = readAlphanumeric(line, start: position, length: 4)
    position += 4
   
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["MASS_EXCESS"] = readAlphanumeric(line, start: position, length: 14)
    position += 14
   
    fields["ER_MASS_EXCESS"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
   
    fields["BINDING_ENERGY_div_A"] = readAlphanumeric(line, start: position, length: 13)
    position += 13
   
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["ER_BINDING_ENERGY_div_A"] = readAlphanumeric(line, start: position, length: 10)
    position += 10
   
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["B"] = readAlphanumeric(line, start: position, length: 2)
    position += 2
   
    fields["BETA_DECAY_ENERGY"] = readAlphanumeric(line, start: position, length: 13)
    position += 13
   
    fields["ER_BETA_DECAY_ENERGY"] = readAlphanumeric(line, start: position, length: 11)
    position += 11
   
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["_?_"] = readAlphanumeric(line, start: position, length: 3)
    position += 3
   
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["ATOMIC_MASS"] = readAlphanumeric(line, start: position, length: 13)
    position += 13
   
    fields["ER_ATOMIC_MASS"] = readAlphanumeric(line, start: position, length: 12)
    
    fields["AEL"] = (fields["A"] as! String) + (fields["EL"] as! String).uppercased()
   
    return fields
}


func parsemassfile () -> [[String: Any]]
{
    var ret  : [[String: Any]] = []
    if let aStreamReader = StreamReader(path: "/Users/albinomontella/doc2/DatiLibNucl/mass_1.mas20_mod.txt") {
       defer {
           aStreamReader.close()
       }
       while let line = aStreamReader.nextLine() {
           //print(line)
           let pr =  parseLine(line: line)
           ret.append(pr )
           
       }
    }
    
    return ret
   
}

func parseLine2(line: String) -> [String: Any] {
    var fields: [String: Any] = [:]
    var position = 0

    fields["f"] = readAlphanumeric(line, start: position, length: 1)
    position += 1
                               
    fields["A"] = readAlphanumeric(line, start: position, length: 3)
    position += 3
    
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["EL"] = readAlphanumeric(line, start: position, length: 3)
    position += 3
    
    fields["Z"] = readAlphanumeric(line, start: position, length: 3)
    position += 3
    
    position = skipField(position, length: 1) // Ignora 1X
 

            
    fields["S_2n_"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
    fields["ER_S_2n_"] = readAlphanumeric(line, start: position, length: 10)
    position += 10
    fields["S_2p_"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
    fields["ER_S_2p_"] = readAlphanumeric(line, start: position, length: 10)
    position += 10
    fields["Q_a_"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
    fields["ER_Q_a_"] = readAlphanumeric(line, start: position, length: 10)
    position += 10
    fields["Q_2BMeno_"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
    fields["ER_Q_2BMeno_"] = readAlphanumeric(line, start: position, length: 10)
    position += 10
    fields["Q_ep_"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
    fields["ER_Q_ep_"] = readAlphanumeric(line, start: position, length: 10)
    position += 10
    fields["Q_BMenon_"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
    fields["ER_Q_BMenon_"] = readAlphanumeric(line, start: position, length: 10)
    position += 10
    
    fields["AEL"] = (fields["A"] as! String) + (fields["EL"] as! String).uppercased()
    return fields
}


func parsemass2file () -> [[String: Any]]
{
    var ret  : [[String: Any]] = []
    if let aStreamReader = StreamReader(path: "/Users/albinomontella/doc2/DatiLibNucl/rct1.mas20_mod.txt") {
       defer {
           aStreamReader.close()
       }
       while let line = aStreamReader.nextLine() {
           //print(line)
           let pr =  parseLine2(line: line)
           ret.append(pr )
           
       }
    }
    
    return ret
}


func parseLine3(line: String) -> [String: Any] {
    var fields: [String: Any] = [:]
    var position = 0

    fields["f"] = readAlphanumeric(line, start: position, length: 1)
    position += 1
                               
    fields["A"] = readAlphanumeric(line, start: position, length: 3)
    position += 3
    
    position = skipField(position, length: 1) // Ignora 1X
   
    fields["EL"] = readAlphanumeric(line, start: position, length: 3)
    position += 3
    
    fields["Z"] = readAlphanumeric(line, start: position, length: 3)
    position += 3
    
    position = skipField(position, length: 1) // Ignora 1X
 
    fields["S_n_"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
    fields["ER_S_n_"] = readAlphanumeric(line, start: position, length: 10)
    position += 10
    fields["S_p_"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
    fields["ER_S_p_"] = readAlphanumeric(line, start: position, length: 10)
    position += 10
    fields["Q_4BMeno_"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
    fields["ER_Q_4BMeno_"] = readAlphanumeric(line, start: position, length: 10)
    position += 10
    fields["Q_da_"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
    fields["ER_Q_da_"] = readAlphanumeric(line, start: position, length: 10)
    position += 10
    fields["Q_pa_"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
    fields["ER_Q_pa_"] = readAlphanumeric(line, start: position, length: 10)
    position += 10
    fields["Q_na_"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
    fields["ER_Q_na_"] = readAlphanumeric(line, start: position, length: 10)
    position += 10
    fields["AEL"] = (fields["A"] as! String) + (fields["EL"] as! String).uppercased()
    return fields
}

func parseLine4(line: String) -> [String: Any] {
    var fields: [String: Any] = [:]
    var position = 0

  


                               
    fields["A"] = readAlphanumeric(line, start: position, length: 3)
    position += 3
    
    position = skipField(position, length: 1) // Ignora 1X

    fields["Z"] = readAlphanumeric(line, start: position, length: 4)
    position += 4
    
    position = skipField(position, length: 3) // Ignora 1X
 
    fields["EL"] = readAlphanumeric(line, start: position, length: 5)
    position += 5
    
    fields["s"] = readAlphanumeric(line, start: position, length: 1)
    position += 1
    
    position = skipField(position, length: 1) // Ignora 1X
    
    fields["MASS"] = readAlphanumeric(line, start: position, length: 13)
    position += 13
    
    fields["DMASS"] = readAlphanumeric(line, start: position, length: 11)
    position += 11
    
    fields["EXC"] = readAlphanumeric(line, start: position, length: 12)
    position += 12
    
    fields["DEXC"] = readAlphanumeric(line, start: position, length: 11)
    position += 11
    
    fields["Orig"] = readAlphanumeric(line, start: position, length: 2)
    position += 2
    

    fields["IsomUnc"] = readAlphanumeric(line, start: position, length: 1)
    position += 1
    fields["IsomInv"] = readAlphanumeric(line, start: position, length: 1)
    position += 1
    
    fields["T"] = readAlphanumeric(line, start: position, length: 9)
    position += 9
    fields["T_UNIT"] = readAlphanumeric(line, start: position, length: 2)
    position += 2
    
    position = skipField(position, length: 1) // Ignora 1X
    
    fields["T_UNC"] = readAlphanumeric(line, start: position, length: 7)
    position += 7
    
    fields["Spin_Parity"] = readAlphanumeric(line, start: position, length: 14)
    position += 14
    
    fields["Ensdfyear"] = readAlphanumeric(line, start: position, length: 2)
    position += 2
    
    position = skipField(position, length: 10) // Ignora 1X
    
    fields["Discovery"] = readAlphanumeric(line, start: position, length: 4)
    position += 4
    
    position = skipField(position, length: 1) // Ignora 1X
    
    fields["BR"] = readAlphanumeric(line, start: position, length: 90)
    position += 90
    
    fields["AEL"] = (fields["EL"] as! String).uppercased()
    return fields
}


func parsemass3file () -> [[String: Any]]
{
    var ret  : [[String: Any]] = []
    if let aStreamReader = StreamReader(path: "/Users/albinomontella/doc2/DatiLibNucl/rct2_1.mas20_mod.txt") {
       defer {
           aStreamReader.close()
       }
       while let line = aStreamReader.nextLine() {
           //print(line)
           let pr =  parseLine3(line: line)
           ret.append(pr )
           
       }
    }
    return ret
    
   
}


func parsemass4file () -> [[String: Any]]
{
    var ret  : [[String: Any]] = []
    if let aStreamReader = StreamReader(path: "/Users/albinomontella/doc2/DatiLibNucl/nubase_4.mas20_mod.txt") {
       defer {
           aStreamReader.close()
       }
       while let line = aStreamReader.nextLine() {
           //print(line)
           let pr =  parseLine4(line: line)
           print(pr)
           ret.append(pr )
           
       }
    }
    return ret
    
   
}
