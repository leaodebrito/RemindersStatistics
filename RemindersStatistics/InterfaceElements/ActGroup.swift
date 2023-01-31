//
//  ActGroup.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 30/01/23.
//

import SwiftUI

struct ActGroup: View {
    
    @State var image: String = "archivebox"
    @State var listName: String = "Concluídos"
    
    var alturaRoundedRectangle: CGFloat = 130
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(height: alturaRoundedRectangle)
                .shadow(radius: 5)
            VStack{
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 40, height: 40)
                            .shadow(radius: 5)
                        Image(systemName: image)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                        
                    }
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.top)
                    
                    Text("\(listName)")
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)             .font(.title3)
                        .padding(.bottom)
                }
            }
            .padding()
            
        }
        .frame(minWidth: 140, maxWidth: .infinity, idealHeight: alturaRoundedRectangle-25, maxHeight: alturaRoundedRectangle, alignment: .center)
    }
}


struct ActGroup_Previews: PreviewProvider {
    static var previews: some View {
        ActGroup()
    }
}
