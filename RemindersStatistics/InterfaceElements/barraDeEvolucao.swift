//
//  barraDeEvolucao.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 11/02/23.
//

import SwiftUI

struct barraDeEvolucao: View{

    let alturaBarra: CGFloat = 10
    let corner: CGFloat = 5
    
    @Binding var status: Double
    
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
