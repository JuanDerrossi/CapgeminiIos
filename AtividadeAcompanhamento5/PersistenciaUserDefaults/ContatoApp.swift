import SwiftUI

// Principal
@main
struct ContatoApp: App {
    
    // Criar referência do PersistenceController
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
            // Injetar o Core Data
            .environment(
                \.managedObjectContext,
                 persistenceController.container.viewContext
            )
            
        }
    }
}
