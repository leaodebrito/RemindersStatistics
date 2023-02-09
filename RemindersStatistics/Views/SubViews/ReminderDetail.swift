//
//  ReminderDetail.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 01/02/23.
//

import SwiftUI

struct ReminderDetail: View {
    
    @State var lembrete: Reminder
    
    @State var novoTítulo: String = ""
    @State var novaNota: String = ""
    @State var novoURL: String = ""
    

    
    var body: some View {
        ScrollView{
            VStack{
                
                TextField("",text: $novoTítulo)
                    .font(.title)
                    .onAppear(){
                        novoTítulo = lembrete.titulo ?? ""
                    }
                    
                Divider()
                
                TextEditor(text: $novaNota)
                    .foregroundColor(.secondary)
                    .onAppear(){
                        novaNota = lembrete.notas ?? ""
                    }
                
                
                Divider()
                
                TextField("", text: $novoURL)
                    .font(.title3)
                    .foregroundColor(.gray)
                    .onAppear(){
                        novoURL = lembrete.externalLink ?? "URL"
                    }
                
                Divider()
                
                barraDeEvolucao(status: lembrete.status)
                    .padding(.vertical)
                
                HStack{
                    //Prioridade
                    Button(action: {
                        print("ok")
                    }, label: {
                        imagemBotao(imagem: "flag", alturaImagem: 30, larguraImagem: 25)
                    })
                    
                    Spacer()
                        .frame(width: 35)
                    
                    //Projeto
                    
                    Button(action: {
                        print("ok")
                    }, label: {
                        imagemBotao(imagem: "list.clipboard", alturaImagem: 30, larguraImagem: 20)
                    })
                    
                    Spacer()
                        .frame(width: 35)
                    
                    //Data e hora
                    Button(action: {
                        print("ok")
                    }, label: {
                        imagemBotao(imagem: "calendar", alturaImagem: 30, larguraImagem: 30)
                    })
                    
                    //Status
                    
                    
                }
                
                
                
                    
            }
            .padding(.horizontal)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        print("ok")
                    }, label: {
                        Text("Salvar!")
                    })
                }
            }
        }
    }
}

struct ReminderDetail_Previews: PreviewProvider {
    static var previews: some View {
        ReminderDetail(lembrete: Reminder())
    }
}


struct imagemBotao: View{
    @State var imagem: String = ""
    @State var alturaImagem: CGFloat = 30
    @State var larguraImagem: CGFloat = 30
    var body: some View{
        Image(systemName: imagem)
            .resizable()
            .frame(width: larguraImagem, height: alturaImagem)
    }
}
