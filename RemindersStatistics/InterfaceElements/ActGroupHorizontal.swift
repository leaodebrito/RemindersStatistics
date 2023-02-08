//
//  ActGroupHorizontal.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 01/02/23.
//

import SwiftUI

struct ActGroupHorizontal: View {
    
    @State var image: String = "list.bullet"
    @State var listName: String = "Concluídos"
    @State var colorBackground: Color = .red
    @State var colorBackgroundSymbol: Color = .red
    
    
    var alturaRoundedRectangle: CGFloat = 130
    
    @Environment (\.colorScheme) var colorScheme
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(colorBackground)
                .padding(.vertical)
                .frame(height: alturaRoundedRectangle)
                .shadow(radius: 5)
            
            VStack{
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 45, height: 45)
                            .shadow(radius: 5)
                            .foregroundColor(colorBackgroundSymbol)
                        
                        Image(systemName: image)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 20)
                        
                    }
                    .frame(width: 40, height: 40, alignment: .center)
                    
                    Text("\(listName)")
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
                        .font(.title3)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .padding(.leading)
                }
            }
            .padding()
            
        }
        .frame(minWidth: 140, maxWidth: .infinity, idealHeight: alturaRoundedRectangle-25, maxHeight: alturaRoundedRectangle, alignment: .center)
    }
}

struct ActGroupHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        ActGroupHorizontal()
    }
}
