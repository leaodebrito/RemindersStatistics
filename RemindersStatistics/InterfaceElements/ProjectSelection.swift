//
//  ProjectSelection.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 31/01/23.
//

import SwiftUI

struct ProjectSelection: View {
    
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 70)
                .foregroundColor(colorScheme == .light ? brancoBotao : pretoBotao)
        }
    }
}

struct ProjectSelection_Previews: PreviewProvider {
    static var previews: some View {
        ProjectSelection()
    }
}
