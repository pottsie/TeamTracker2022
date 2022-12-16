//
//  PlayerFormViewModel.swift
//  TeamTracker2022
//
//  Created by Michael Potts on 12/14/22.
//

import Foundation

final class PlayerFormViewModel: ObservableObject {
    
    let viewContext = DataManager.shared.container.viewContext
    
    @Published var newFirstName: String = ""
    @Published var newLastName: String = ""
    @Published var newPosition: String = ""
    
    func addPlayer() {
        
        let newPlayer = PlayerEntity(context: viewContext)
        newPlayer.firstName_ = newFirstName
        newPlayer.lastName_ = newLastName
        newPlayer.position_ = newPosition
        
        do {
            try viewContext.save()
        } catch {
            print("ERROR SAVING DATA \(error.localizedDescription)")
        }
        
    }
}