//
//  ListaInbox.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 12/02/23.
//

import SwiftUI

//Lista Inbox
struct ListaInbox: View {
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "titulo", ascending: true)]) var lembrete: FetchedResults<Reminder>
    
    var body: some View {
        NavigationLink(destination: {
            List{
                ForEach(lembrete) { lembrete in
                    reminderButton(lembrete: lembrete)
                        .navigationTitle("Inbox")
                }
                .onDelete{ indexSet in
                    for index in indexSet {
                        moc.delete(lembrete[index])
                    }
                    do {try moc.save()} catch {print(error.localizedDescription)}
                  }
                 
            }.toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    EditButton()
                }
            }
        }, label: {
            ActGroupHorizontal(listName: "Inbox", alturaRoundedRectangle: 100)
                .padding(.horizontal)
        })
        .padding(.bottom)
    }
}
