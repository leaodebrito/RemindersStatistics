//
//  dataController.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 30/01/23.
//

import CoreData
import Foundation


class DataController: ObservableObject {
 
    let container = NSPersistentContainer(name: "Reminders")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core data falhou ao carregar: \(error.localizedDescription)")
            }
            
        }
    }
    
}
