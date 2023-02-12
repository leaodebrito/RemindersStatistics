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
    @State var status: Double = 0
    @State var prioridade: Double = 1
    
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View {
        
        HStack{
            //MARK: - Texto descritivo
            VStack(alignment: .leading){
                HStack{
                    Text(nomeLembrete)
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 2)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                    
                    Spacer()
                    
                    simboloPrioridadeTag(prioridade: $prioridade)
                }
                
                barraDeEvolucao(status: $status)
                    .padding(.vertical,2)
                
                Text(notaLembrete)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2...7)
                    .foregroundColor(colorScheme == .light ? .black : .white)
                
                
            
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct ReminderListDetail_Previews: PreviewProvider {
    static var previews: some View {
        ReminderListDetail()
    }
}



//MARK: - Estruturas de complementares da vista
//Símbolos de exclamação para explicitação de prioridade da atividade
struct simboloPrioridadeTag: View{
    
    @Binding var prioridade: Double
    var alturaFigura: CGFloat = 20
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View{
        ZStack{
            
            if prioridade == 1.0{
                Image(systemName: "exclamationmark")
                    .resizable()
                    .frame(width: 5, height: alturaFigura)
                    .foregroundColor(colorScheme == .light ? .gray : .white)
            }else if prioridade == 2.0{
                Image(systemName: "exclamationmark.2")
                    .resizable()
                    .frame(width: 15, height: alturaFigura)
                    .foregroundColor(colorScheme == .light ? .gray : .white)
            }else if prioridade == 3.0{
                Image(systemName: "exclamationmark.3")
                    .resizable()
                    .frame(width: 22, height: alturaFigura)
                    .foregroundColor(colorScheme == .light ? .gray : .white)
            }else{
                Image(systemName: "exclamationmark")
                    .resizable()
                    .frame(width: 5, height: alturaFigura)
                    .foregroundColor(colorScheme == .light ? .gray : .white)
            }
        }
    }
}
