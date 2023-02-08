//
//  ReminderList.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 30/01/23.
//

import SwiftUI
import CoreData



struct ProjectList: View {
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "titulo", ascending: true)]) var lembrete: FetchedResults<Reminder>
    
    
    @State var newReminder: Bool = false
    @State var newProject: Bool = false
    
    @State var totalProjetos: Int = 0
    @State var totalProjetosProgramados: Int = 0
    @State var totalProjetosConcluídos: Int = 0
    
    @State var isPresentedLista: Bool = false
    
    
    
    //Calculo de quantidade de lembretes
    func remindersAmount() -> Int{
        var count = 0
        for _ in lembrete{
            count = count + 1
        }
        return count
    }
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ScrollView(.horizontal){
                        HStack{
                            //MARK: - Lembretes programados
                            ListCard(image: "calendar", count: $totalProjetosProgramados, listName: "Programados", colorLight: laranjaClaroBotao, colorDark: laranjaEscuroBotao)
                                .shadow(radius: 10)
                                .padding(.trailing, 5)
                            
                            //MARK: - Lembretes concluídos
                            ListCard(image: "checkmark", count: $totalProjetosConcluídos, listName: "Concluídos", colorLight: verdeClaroBotao, colorDark: verdeEscuroBotao)
                                .shadow(radius: 10)
                                .padding(.trailing, 5)
                            
                            
                            //MARK: - Todos os lembretes
                            //TODO: - implantar sheetview from list₢
                            NavigationLink(destination: {
                                List(lembrete) { lembrete in
                                    NavigationLink(destination: ReminderDetail(lembrete: lembrete), label: {
                                        ReminderListDetail(nomeLembrete: lembrete.titulo ?? "-", notaLembrete: lembrete.notas ?? "-", concluido: lembrete.flag, status: lembrete.status)
                                    })
                                    .navigationTitle("Todos os lembretes")
                                }
                            }, label: {
                                ListCard(image: "archivebox", count: $totalProjetos, listName: "Todos", colorLight: azulClaroBotao, colorDark: azulEscuroBotao)
                                    .shadow(radius: 10)
                            })
                            
                        }
                        .padding(.horizontal)
                        .frame(height: 250)
                    }
                    
                    
                    Text("Grupos de atividades")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    //MARK: - Lista Inbox
                    NavigationLink(destination: {
                        List(lembrete) { lembrete in
                            NavigationLink(destination: ReminderDetail(lembrete: lembrete), label: {
                                ReminderListDetail(nomeLembrete: lembrete.titulo ?? "-", notaLembrete: lembrete.notas ?? "-", concluido: lembrete.flag, status: lembrete.status)
                            })
                            .navigationTitle("Inbox")
                            
                        }
                        
                    }, label: {
                        ActGroupHorizontal(listName: "Inbox", alturaRoundedRectangle: 100)
                            .padding(.horizontal)
                    })
                    .padding(.bottom)
                    
                    //MARK: - Grupos de atividades
                    LazyVGrid(columns: columns){
                        ForEach(0..<10, id: \.self){
                            ActGroup(image: "archivebox", listName: "\($0) - Doutorado")
                                .shadow(radius: 10)
                                
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
                .onAppear(perform: {self.totalProjetos = remindersAmount()})
        }
    }
}

struct ReminderList_Previews: PreviewProvider {
    static var previews: some View {
        ProjectList()
    }
}

