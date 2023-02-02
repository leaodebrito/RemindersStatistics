//
//  ListCard.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 30/01/23.
//

import SwiftUI

struct ListCard: View {
    
    @State var image: String = "archivebox"
    @Binding var count: Int
    @State var listName: String = "Concluídos"
    @State var colorLight: Color = .gray
    @State var colorDark: Color = .black

    
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(colorScheme == .light ? colorLight : colorDark)
            
            VStack{
                
                VStack(alignment: .trailing){
                    Text("\(count)")
                        .font(.title)
                        .bold()
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    if count == 1{
                        Text("Lembrete nesta lista")
                            .font(.footnote)
                            .frame(width: 120, alignment: .trailing)
                    }else{
                        Text("Lembretes nesta lista")
                            .font(.footnote)
                            .frame(width: 120, alignment: .trailing)
                    }
                }
                
                Spacer()
                
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 40, height: 40)
                            .foregroundColor(colorScheme == .light ? colorDark : colorLight)
                        
                        Image(systemName: image)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(listName)")
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                }
                
            }
            .padding()
            
        }
        .frame(minWidth: 150, maxWidth: 200, idealHeight: 200, maxHeight: 200, alignment: .center)
    }

}

//struct ListCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ListCard()
//    }
//}

