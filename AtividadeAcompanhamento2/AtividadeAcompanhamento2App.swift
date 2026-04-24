//
//  AtividadeAcompanhamento2App.swift
//  AtividadeAcompanhamento2
//
//  Created by Derrossi, Juan Arruda on 24/04/26.
//

import SwiftUI

@main
struct AtividadeAcompanhamento2App: App {
    var body: some Scene {
        DocumentGroup(newDocument: AtividadeAcompanhamento2Document()) { file in
            ContentView(document: file.$document)
        }
    }
}
