//
//  ReminderListDetail.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 06/02/23.
//

import SwiftUI

struct ReminderListDetail: View {
    
    @State var nomeLembrete: String = "Lorem Ipsum"
    @State var notaLembrete: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    @State var concluido: Bool = false
    @State var status: Float = 0
    
    
    
    var body: some View {
        
        HStack{
            //MARK: - Texto descritivo
            VStack(alignment: .leading){
                Text(nomeLembrete)
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 2)
                
                Text(notaLembrete)
                    .font(.callout)
                
                barraDeEvolucao(status: status)
            
            }
        }
        .frame(maxWidth: .infinity, minHeight: 60, idealHeight: 80, alignment: .leading)
        
    }
}

struct ReminderListDetail_Previews: PreviewProvider {
    static var previews: some View {
        ReminderListDetail()
    }
}


struct barraDeEvolucao: View{
    
    
    
    let alturaBarra: CGFloat = 10
    let corner: CGFloat = 5
    
    @State var status: Float = 0
    
    var body: some View{
        
        HStack{
            RoundedRectangle(cornerRadius: corner)
                .frame(maxWidth: .infinity, maxHeight: alturaBarra)
                .foregroundColor(.green)
            
            if status == 0{
                RoundedRectangle(cornerRadius: corner)
                    .frame(maxWidth: .infinity, maxHeight: alturaBarra)
                    .foregroundColor(.gray)
                
                RoundedRectangle(cornerRadius: corner)
                    .frame(maxWidth: .infinity, maxHeight: alturaBarra)
                    .foregroundColor(.gray)
            }else if status == 1{
                RoundedRectangle(cornerRadius: corner)
                    .frame(maxWidth: .infinity, maxHeight: alturaBarra)
                    .foregroundColor(.green)
                
                RoundedRectangle(cornerRadius: corner)
                    .frame(maxWidth: .infinity, maxHeight: alturaBarra)
                    .foregroundColor(.gray)
                
            }else if status == 2{
                RoundedRectangle(cornerRadius: corner)
                    .frame(maxWidth: .infinity, maxHeight: alturaBarra)
                    .foregroundColor(.green)
                
                RoundedRectangle(cornerRadius: corner)
                    .frame(maxWidth: .infinity, maxHeight: alturaBarra)
                    .foregroundColor(.green)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 5)
        
    }
    
}
