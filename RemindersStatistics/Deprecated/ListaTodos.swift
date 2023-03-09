//
//  ListaTodos.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 12/02/23.
//

import SwiftUI

//MARK: - Organização de subviews
//Lista todos
struct ListaTodos: View {
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "titulo", ascending: true)]) var lembrete: FetchedResults<Reminder>
    

    @State var totalProjetos: Int

    
    
    var body: some View {
        NavigationLink(destination: {
            List{
                ForEach(lembrete) { lembrete in
                    reminderButton(lembrete: lembrete)
                        .navigationTitle("Todos os lembretes")
                }
                .onDelete{ indexSet in for index in indexSet {moc.delete(lembrete[index])}
                    do {try moc.save()} catch {print(error.localizedDescription)}
                }
            }
            .toolbar{ToolbarItem(placement: .navigationBarTrailing){EditButton()}}
        }, label: {
            ListCard(image: "archivebox", count: $totalProjetos, listName: "Todos", colorLight: azulClaroBotao, colorDark: azulEscuroBotao)
                .shadow(radius: 10)
        })
    }
}


//MARK: - Abre sheetview a partir da lista de tarefas
//Essa struct é utilizada em todas as vistas que apresentação atividades por meio de List{ ForEach{}}
struct reminderButton: View{
    @State var showSheet = false
    var lembrete: Reminder

    var body: some View {
        Button(action:{self.showSheet = true}){
            ReminderListDetail(nomeLembrete: lembrete.titulo ?? "-", notaLembrete: lembrete.notas ?? "-", concluido: lembrete.flag, status: lembrete.status)
        }.sheet(isPresented: $showSheet){
            ReminderDetail(lembrete: lembrete)
        }
    }
}
