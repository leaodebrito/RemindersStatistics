//
//  dataController.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 30/01/23.
//

import CoreData
import Foundation


class DataController: ObservableObject {
 
    let containerReminder = NSPersistentContainer(name: "Reminders")
    let containerProject = NSPersistentContainer(name: "Project")
    
    init(){
        containerReminder.loadPersistentStores{ description, error in
            if let error = error {
                print("Core data falhou ao carregar: \(error.localizedDescription)")
            }
            
        }
        
        containerProject.loadPersistentStores{ description, error in
            if let error = error {
                print("Core data falhou ao carregar: \(error.localizedDescription)")
            }
            
        }
    }
    
}
