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
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
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
                    
                    Text("\(listName)")
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)             .font(.title3)
                }
            }
            .padding()
            
        }
        .frame(minWidth: 140, maxWidth: .infinity, idealHeight: 80, maxHeight: 80, alignment: .center)
    }
}


struct ActGroup_Previews: PreviewProvider {
    static var previews: some View {
        ActGroup()
    }
}
