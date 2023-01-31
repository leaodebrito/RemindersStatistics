//
//  NewReminder.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 30/01/23.
//

import SwiftUI

struct NewReminder: View {
    
    @State var title: String = ""
    @State var note: String = ""
    
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
                        ProjectSelection(texto: "Projetos")
                            .padding(.top, 30)
                    })
                    
                    
                    
                }.padding()
            }
            .navigationTitle("Novo Lembrete")
        }
    }
}

struct NewReminder_Previews: PreviewProvider {
    static var previews: some View {
        NewReminder()
    }
}
