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



//MARK: - Abre sheetview a partir da lista de tarefas
//Essa struct é utilizada em todas as vistas que apresentação atividades por meio de List{ ForEach{}}
struct reminderButton: View{
    @State var showSheet = false
    var lembrete: Reminder

    var body: some View {
        Button(action:{self.showSheet = true}){
            ReminderListDetail(nomeLembrete: lembrete.titulo ?? "-", notaLembrete: lembrete.notas ?? "-", concluido: lembrete.flag, status: lembrete.status, prioridade: lembrete.priority)
        }.sheet(isPresented: $showSheet){
            ReminderDetail(lembrete: lembrete)
        }
    }
}



