//
//  NewReminder.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 30/01/23.
//

import SwiftUI

struct NewReminder: View {
    
    // PERSISTÊNCIA DE DADOS
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: []) var lembrete: FetchedResults<Reminder>
    
    //Fechar visualização do sheetview de criação de projeto
    @Environment (\.presentationMode) var presentationMode
    
    @State var title: String = ""
    @State var note: String = ""
    @State var project: String = "Inbox"
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    TextField("Título...", text: $title)
                        .textFieldStyle(MyTextFieldStyle())
                        .padding(.bottom)
                    
                    TextField("Notas...", text: $note, axis:.vertical)
                        .textFieldStyle(MyTextFieldStyle2())
                    
                    NavigationLink(destination: {
                        ListOfAllProjects()
                    }, label: {
                        ProjectSelection(texto: project)
                            .padding(.top, 30)
                    })
                    
                    
                    
                }.padding()
            }
            .navigationTitle("Novo Lembrete")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        print("Adicionado")
                        
                        let lembrete = Reminder (context: moc)
                        lembrete.id = UUID()
                        lembrete.titulo = title
                        lembrete.notas = note
                        lembrete.list = project
                        
                        
                        do {
                            try moc.save()
                            print("Projeto Salvo")
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                presentationMode.wrappedValue.dismiss()
                            }
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                    }, label: {
                        Text("Adicionar")
                    })
                })
            }
        }
    }
}

struct NewReminder_Previews: PreviewProvider {
    static var previews: some View {
        NewReminder()
    }
}
