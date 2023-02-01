//
//  ListCard.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 30/01/23.
//

import SwiftUI

struct ListCard: View {
    
    @State var image: String = "archivebox"
    @State var count: Int = 0
    @State var listName: String = "Concluídos"
    
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(colorScheme == .light ? brancoBotao : pretoBotao)
            
            VStack{
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 40, height: 40)
                            
                        Image(systemName: image)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            
                        
                    }
                    .frame(width: 40, height: 40, alignment: .center)
                    
                    Spacer()
                    
                    Text("\(count)")
                        .font(.title)
                        .bold()
                        .foregroundColor(colorScheme == .light ? .black : .gray)
                }
                
                
                Text("\(listName)")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
                    .foregroundColor(colorScheme == .light ? .black : .gray)
                
            }
            .padding()
            
        }
        .frame(minWidth: 140, maxWidth: .infinity, idealHeight: 130, maxHeight: 130, alignment: .center)
    }
}

struct ListCard_Previews: PreviewProvider {
    static var previews: some View {
        ListCard()
    }
}
