//
//  ReminderDetail.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 01/02/23.
//

import SwiftUI

struct ReminderDetail: View {
    
    @Environment(\.managedObjectContext) private var moc
    @State var lembrete: Reminder
    //Fechar visualização do sheetview de criação de projeto
    @Environment (\.presentationMode) var presentationMode
    
    @State var novoTítulo: String = ""
    @State var novaNota: String = ""
    @State var novoURL: String = ""
    @State var novaPrioridade: Double = 1.0
    @State var novoStatus: Double = 0
    
    @State var novaData: Date =  Date.now
    
    @Environment (\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL

    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    TextEditor(text: $novoTítulo)
                        .font(.title)
                        .bold()
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .lineLimit(2...7)
                        .onAppear(){
                            novoTítulo = lembrete.titulo ?? ""
                        }
                        .padding(.top, 15)
                    
                    Divider()
                    
                    TextEditor(text: $novaNota)
                        .foregroundColor(.secondary)
                        .lineLimit(2...7)
                        .onAppear(){
                            novaNota = lembrete.notas ?? ""
                        }
                    
                    
                    Divider()
                    
                    HStack{
                        TextField("URL", text: $novoURL)
                            .font(.title3)
                            .foregroundColor(.gray)
                            .lineLimit(2...7)
                            .onAppear(){
                                novoURL = lembrete.externalLink ?? ""
                            }
                        
                        //TODO: - Corrigir erro de abertura de URL
                        if novoURL != ""{
                            Button(action: {
                                    openURL(URL(string: novoURL)!)
                            }, label: {
                                Image(systemName: "link.circle.fill")
                                    .font(.largeTitle)
                            })
                        }
                        
                    }
                    
                    Divider()
                    
                    DatePicker(selection: $novaData, displayedComponents: .date) {
                        Text("Data limite")
                    }
                    
                    Divider()
                    
                    barraDeEvolucao(status: $novoStatus)
                        .padding(.vertical)
                        .onAppear(){
                            novoStatus = lembrete.status
                        }
                    
                    HStack{
                        Spacer()
                        
                    
                        //Prioridade
                        Menu{
                            Button(action: {novaPrioridade = 1.0}, label: {simboloNome(simbolo: "exclamationmark", nome: "Prioridade 1")})
                            Button(action: {novaPrioridade = 2.0}, label: {simboloNome(simbolo: "exclamationmark.2", nome: "Prioridade 2")})
                            Button(action: {novaPrioridade = 3.0}, label: {simboloNome(simbolo: "exclamationmark.3", nome: "Prioridade 3")})
                        }label:{
                            simboloPrioridade(prioridade: $novaPrioridade)
                        }
                        
                        Spacer()
                            .frame(width: 35)
                   
                        //Status
                        Menu{
                            Button(action: {novoStatus = 0.0}, label: {Text("Não iniciado")})
                            Button(action: {novoStatus = 1.0}, label: {Text("Em desenvolvimento")})
                            Button(action: {novoStatus = 2.0}, label: {Text("Concluído")})
                        }label:{
                            imagemBotao(imagem: "play", alturaImagem: 25, larguraImagem: 20)
                        }
                        
                        
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
                            print("Adicionado")
                            
                            //A linha abaixo cria um novo lembrete segundo o contexto moc
                            //let lembrete = Reminder (context: moc)
                            lembrete.id = UUID()
                            lembrete.titulo = novoTítulo
                            lembrete.notas = novaNota
                            lembrete.priority = novaPrioridade
                            lembrete.status = novoStatus
                            lembrete.date = novaData
                            lembrete.externalLink = novoURL
                            
                            
                            do {
                                try moc.save()
                                print("Projeto Salvo")
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                    presentationMode.wrappedValue.dismiss()
                                }
                                
                            } catch {
                                print(error.localizedDescription)
                            }
                        }, label: {
                            Text("Salvar!")
                        })
                    }
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




//MARK: - Estruturas de apoio da vista
//Botão de mudança de status da atividade
struct imagemBotao: View{
    @State var imagem: String = ""
    @State var alturaImagem: CGFloat = 30
    @State var larguraImagem: CGFloat = 30
    @Environment (\.colorScheme) var colorScheme
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(colorScheme == .light ? brancoBotao : pretoBotao)
                .frame(width: 40, height: 40)
            Image(systemName: imagem)
                .resizable()
                .frame(width: larguraImagem, height: alturaImagem)
        }
    }
}

//View com simbolo e texto
/// "!! - Prioridade 2"
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


//Estrutura para apresentação do simbolo de prioridade
///Variação de exclamações (!, !! e !!!)
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
