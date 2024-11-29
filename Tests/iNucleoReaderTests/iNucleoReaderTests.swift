import Testing
import Foundation
@testable import iNucleoReader

@MainActor
@Test func example() async throws { // esporta tutt L list in un solo json
 
    do {
        //try await getfileNuc2()
        //try await getfileNuc()
        //try SaveNucleidiToJson(from : "/Users/albinomontella/Downloads/ensdf_241101/"   )
        
        var listnuc=try await getNucleidiStruc(from : "/Users/albinomontella/doc2/DatiLibNucl/ensdf_241101/"  )
        print(listnuc.count)
        var aa = listnuc
        //var aa = listnuc.compactMap{$0.id}
        let encoder = JSONEncoder()
        encoder.outputFormatting =  [.sortedKeys, .prettyPrinted] // Formattazione leggibile
        
        do {
            let jsonData = try encoder.encode(aa)
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            var fileURL = documentsDirectory.appendingPathComponent("num" + ".json")
            try jsonData.write(to: fileURL)
        } catch {
            print("Errore durante la codifica JSON: \(error)")
       
        }
        
            /*
            if let jsonString = generateJSON(from: listNucleidi) {
                print(jsonString)
            }
            */
         } catch {
                print(error)
            }
       
   
}

@MainActor
@Test func exportaindifferentifiles() async throws { // esporta tutt L list in piu json
    do
    {
        try SaveNucleidiToJson(from : "/Users/albinomontella/Downloads/ensdf_241101/"   )
    }
    catch
    {
        print(error)
    }
}
@MainActor
@Test func exportaindifferentifilesPlusPrinc() async throws { // esporta tutt L list in piu json + file principale
    do
    {
        try SaveNucleidiToJsonInSeparateFiles(from : "/Users/albinomontella/Downloads/ensdf_241101/"   )
    }
    catch
    {
        print(error)
    }
}


@MainActor
@Test func savejsonsingle() async throws { // il file e fissato nel codice
 
    do {
    
        try getfileNuc()
       
         } catch {
                print(error)
            }
       
   
}

@MainActor
@Test func saveaFile() async throws {
 
    do {
        //try await getfileNuc2()
        //try await getfileNuc()
        try SaveNucleidiToJson(from : "/Users/albinomontella/Downloads/ensdf_241101/"   )
        
        
        
           
            if let jsonString = generateJSON(from: listNucleidi) {
                print(jsonString)
            }
           
         } catch {
                print(error)
            }
       
   
}

@MainActor
@Test func massfile() async throws {
 
    do {
    
            parsemassfile()
        
        
        
           /*
            if let jsonString = generateJSON(from: listNucleidi) {
                print(jsonString)
            }
            */
         } catch {
                print(error)
            }
       
   
}

@MainActor
@Test func mass2file() async throws {
 
    do {
    
            parsemass2file()
        
        
        
           /*
            if let jsonString = generateJSON(from: listNucleidi) {
                print(jsonString)
            }
            */
         } catch {
                print(error)
            }
       
   
}

@MainActor
@Test func mass3file() async throws {
 
    do {
    
            parsemass3file()
        
        
        
           /*
            if let jsonString = generateJSON(from: listNucleidi) {
                print(jsonString)
            }
            */
         } catch {
                print(error)
            }
       
   
}

@MainActor
@Test func mass4file() async throws {
 
    do {
    
            parsemass4file()
        
        
        
           /*
            if let jsonString = generateJSON(from: listNucleidi) {
                print(jsonString)
            }
            */
         } catch {
                print(error)
            }
       
   
}



/*
@MainActor
@Test func getNuclMass() async throws {
 
    do {
        //try await getfileNuc2()
        //try await getfileNuc()
        //try SaveNucleidiToJson(from : "/Users/albinomontella/Downloads/ensdf_241101/"   )
        
        var listnuc=try await getNucleiByNBase(from : "/Users/albinomontella/doc2/DatiLibNucl/NBase/"  )
        print(listnuc.count)
        
        var aa = listnuc.compactMap{$0.id}
        let encoder = JSONEncoder()
        encoder.outputFormatting =  [.sortedKeys, .prettyPrinted] // Formattazione leggibile
        
        do {
            let jsonData = try encoder.encode(aa)
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            var fileURL = documentsDirectory.appendingPathComponent("num" + ".json")
            try jsonData.write(to: fileURL)
        } catch {
            print("Errore durante la codifica JSON: \(error)")
       
        }
        
            /*
            if let jsonString = generateJSON(from: listNucleidi) {
                print(jsonString)
            }
            */
         } catch {
                print(error)
            }
       
   
}
*/
