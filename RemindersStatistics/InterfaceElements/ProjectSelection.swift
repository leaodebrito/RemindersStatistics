//
//  ProjectSelection.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 31/01/23.
//

import SwiftUI

struct ProjectSelection: View {
    
    @Environment (\.colorScheme) var colorScheme
    
    @State var texto: String = "Projetos"
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 70)
                .foregroundColor(colorScheme == .light ? brancoBotao : pretoBotao)
            
            HStack{
                Text(texto)
                    .bold()
                    .foregroundColor(colorScheme == .light ? .black : .white)
                
                Spacer()
                
                Image(systemName: "arrowtriangle.right")
                    .bold()
                    .foregroundColor(colorScheme == .light ? .black : .white)
                
                
            }.padding(.horizontal)
        }
    }
}

struct ProjectSelection_Previews: PreviewProvider {
    static var previews: some View {
        ProjectSelection()
    }
}
