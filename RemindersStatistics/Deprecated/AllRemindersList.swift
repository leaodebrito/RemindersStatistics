//
//  AllRemindersList.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 01/02/23.
//

import SwiftUI

struct AllRemindersList: View {
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "titulo", ascending: true)]) var lembrete: FetchedResults<Reminder>
    @FetchRequest(entity: Reminder.entity(), sortDescriptors: [])
    
    var lembretesCriados: FetchedResults<Reminder>
    
    var body: some View {
        NavigationView{
            List{
                ForEach(lembrete) { lembrete in
                    NavigationLink(destination: ReminderDetail(lembrete: lembrete), label: {
                        Text(lembrete.titulo ?? "")
                    })
                    
                }
                .onDelete{ indexSet in
                    for index in indexSet {
                        moc.delete(lembrete[index])
                    }
                    do {
                        try moc.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Todos")
        }
        
    }
}

struct AllRemindersList_Previews: PreviewProvider {
    static var previews: some View {
        AllRemindersList()
    }
}
