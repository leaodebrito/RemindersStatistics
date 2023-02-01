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
    @State var colorLight: Color = .gray
    @State var colorDark: Color = .black

    
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(colorScheme == .light ? colorLight : colorDark)
            
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 45, height: 45)
                        .foregroundColor(colorScheme == .light ? colorDark : colorLight)
                    
                    Image(systemName: image)
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Text("\(count)")
                    .font(.title)
                    .bold()
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("\(listName)")
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding([.top])
                    .foregroundColor(colorScheme == .light ? .black : .white)
                
            }
            .padding()
            
        }
        .frame(minWidth: 150, maxWidth: 200, idealHeight: 200, maxHeight: 200, alignment: .center)
    }
}

struct ListCard_Previews: PreviewProvider {
    static var previews: some View {
        ListCard()
    }
}
