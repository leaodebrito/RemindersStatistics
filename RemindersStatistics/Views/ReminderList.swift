//
//  ReminderList.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 30/01/23.
//

import SwiftUI





struct ReminderList: View {
    
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Reminder>
    
    @State var newReminder: Bool = false
    @State var newProject: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ScrollView(.horizontal){
                        HStack{
                            ListCard(image: "archivebox", count: 0, listName: "Todos")
                                .shadow(radius: 5)
                            ListCard(image: "checkmark", count: 0, listName: "Concluídos")
                                .shadow(radius: 5)
                            ListCard(image: "calendar", count: 0, listName: "Programados")
                                .shadow(radius: 5)
                            ListCard(image: "archivebox", count: 0, listName: "Concluídos")
                                .shadow(radius: 5)
                        }
                        .padding(.horizontal)
                        .frame(height: 170)
                    }
                    
                    .padding(.vertical)
                    
                    Text("Grupos de atividades")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    LazyVStack{
                        ForEach(0..<10, id: \.self){
                            ActGroup(image: "archivebox", listName: "\($0) - Doutorado")
                                .padding(.horizontal)
                                .shadow(radius: 5)
                        }
                    }
                    .padding(.bottom)
                    
                }
            }
            .navigationTitle("Lembretes")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Menu{
                        Button("Novo Lembrete", action: {
                            newReminder = true
                        }).sheet(isPresented: $newReminder, content: {
                            NewReminder()
                        })
                        Button("Novo Projeto", action: {
                            newProject = true
                        }).sheet(isPresented: $newProject, content: {
                            NewProject()
                        })
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
            }
        }
    }
}

struct ReminderList_Previews: PreviewProvider {
    static var previews: some View {
        ReminderList()
    }
}




