//
//  ReminderList.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 30/01/23.
//

import SwiftUI





struct ProjectList: View {
    
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Reminder>
    
    @State var newReminder: Bool = false
    @State var newProject: Bool = false
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
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
                    
                    
                    Text("Grupos de atividades")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    LazyVGrid(columns: columns){
                        ForEach(0..<10, id: \.self){
                            ActGroup(image: "archivebox", listName: "\($0) - Doutorado")
                                .shadow(radius: 5)
                                
                        }
                    }
                    .padding(.horizontal)
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
                        Button("Novo Projeto", action: {
                            newProject = true
                            print("new project")
                        })
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    
                }
            }.sheet(isPresented: $newReminder) {NewReminder()}
                .sheet(isPresented: $newProject){NewProject()}
        }
    }
}

struct ReminderList_Previews: PreviewProvider {
    static var previews: some View {
        ProjectList()
    }
}

