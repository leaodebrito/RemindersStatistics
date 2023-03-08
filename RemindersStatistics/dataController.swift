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
    
    
    func saveReminder(titulo: String, priority: Double, status: Double, externalLink: String, list: String, notas: String, flag: Bool, date: Date, hour: Date, id: UUID){
        let reminder = Reminder(context: container.viewContext)
        
        reminder.titulo = titulo
        reminder.priority = priority
        reminder.status = status
        reminder.externalLink = externalLink
        reminder.list = list
        reminder.notas = notas
        reminder.flag = flag
        reminder.date = date
        reminder.hour = hour
        reminder.id = id
        
        do{
            try container.viewContext.save()
        }catch{
            print("\(error)")
        }
    }
    
}
