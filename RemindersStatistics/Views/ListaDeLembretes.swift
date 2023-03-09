//
//  ListaDeLembretes.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 08/03/23.
//

import SwiftUI

struct ListaDeLembretes: View {
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "titulo", ascending: true)]) var lembrete: FetchedResults<Reminder>
    
    @State var newReminder: Bool = false
    @State var newProject: Bool = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(lembrete) { lembrete in
                    reminderButton(lembrete: lembrete)
                }
                .onDelete{ indexSet in for index in indexSet {moc.delete(lembrete[index])}
                    do {try moc.save()} catch {print(error.localizedDescription)}
                }
                
            }
            .padding(.top)
            .navigationTitle("Lembretes")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Menu{
                        Button("Novo Lembrete", action: {
                            newReminder.toggle()
                            print("new reminder")
                        })
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarLeading){EditButton()}
                
            }.sheet(isPresented: $newReminder) {NewReminder()}
                .sheet(isPresented: $newProject){NewProject()}
        }
    }
}

struct ListaDeLembretes_Previews: PreviewProvider {
    static var previews: some View {
        ListaDeLembretes()
    }
}


