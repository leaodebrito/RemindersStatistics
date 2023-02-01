//
//  ListOfAllProjects.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 31/01/23.
//

import SwiftUI

struct ListOfAllProjects: View {
    
    @State var listaDeProjetos: [String] = ["Doutorado", "Inbox", "Alice", "Projetos de aplicativos", "Sonhos", "Formação Pessoal", "Pesquisa", "LB Arquitetura e Tecnologia", ]
    
    var body: some View {
        List{
            ForEach(listaDeProjetos, id: \.self) { item in
                
                Text(item)
                
            }
        }
        .navigationTitle("Lista de projetos")
    }
}

struct ListOfAllProjects_Previews: PreviewProvider {
    static var previews: some View {
        ListOfAllProjects()
    }
}



