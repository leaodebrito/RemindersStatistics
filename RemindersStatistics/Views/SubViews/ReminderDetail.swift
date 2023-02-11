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
    @State var novaPrioridade: Double = 1.0
    
    
    @Environment (\.colorScheme) var colorScheme

    
    var body: some View {
        ScrollView{
            VStack{
                TextEditor(text: $novoTítulo)
                    .font(.title)
                    .bold()
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .lineLimit(2)
                    .onAppear(){
                        novoTítulo = lembrete.titulo ?? ""
                    }
                    .padding(.top, 15)
                
                Divider()
                
                TextEditor(text: $novaNota)
                    .foregroundColor(.secondary)
                    .onAppear(){
                        novaNota = lembrete.notas ?? ""
                    }
                    .frame(height: 200)
                
                
                Divider()
                
                TextEditor(text: $novoURL)
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
                    Menu{
                        Button(action: {
                            novaPrioridade = 1.0
                        }, label: {
                            simboloNome(simbolo: "exclamationmark", nome: "Prioridade 1")
                        })
                        Button(action: {
                            novaPrioridade = 2.0
                        }, label: {
                            simboloNome(simbolo: "exclamationmark.2", nome: "Prioridade 2")
                        })
                        Button(action: {
                            novaPrioridade = 3.0
                        }, label: {
                            simboloNome(simbolo: "exclamationmark.3", nome: "Prioridade 3")
                        })
                        
                    }label:{
                        simboloPrioridade(prioridade: $novaPrioridade)
                    }
                    
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
                    
                    Spacer()
                        .frame(width: 35)
                    
                    //Status
                    Button(action: {
                        print("ok")
                    }, label: {
                        imagemBotao(imagem: "play", alturaImagem: 25, larguraImagem: 20)
                    })
                    
                    Spacer()
                        .frame(width: 35)
                    
                    //Lembrete
                    Button(action: {
                        print("ok")
                    }, label: {
                        imagemBotao(imagem: "alarm", alturaImagem: 25, larguraImagem: 25)
                    })
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





//Estruturas de apoio
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


struct simboloNome: View{
    @State var simbolo: String = ""
    @State var nome: String = ""
    
    var body: some View{
        HStack{
            Image(systemName: simbolo)
            Text(nome)
        }
    }
}



struct simboloPrioridade: View{
    @Binding var prioridade: Double
    
    var alturaFigura: CGFloat = 25
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View{
        ZStack{
            
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(colorScheme == .light ? brancoBotao : pretoBotao)
                .frame(width: 40, height: 40)
            
            if prioridade == 1.0{
                Image(systemName: "exclamationmark")
                    .resizable()
                    .frame(width: 5, height: alturaFigura)
                    .bold()
            }else if prioridade == 2.0{
                Image(systemName: "exclamationmark.2")
                    .resizable()
                    .frame(width: 15, height: alturaFigura)
                    .bold()
            }else if prioridade == 3.0{
                Image(systemName: "exclamationmark.3")
                    .resizable()
                    .frame(width: 22, height: alturaFigura)
                    .bold()
            }else{
                Image(systemName: "exclamationmark")
                    .resizable()
                    .frame(width: 10, height: alturaFigura)
                    .bold()
            }
        }
    }
}
