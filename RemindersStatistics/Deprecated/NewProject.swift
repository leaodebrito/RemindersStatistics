//
//  NewProject.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 30/01/23.
//

import SwiftUI

struct NewProject: View {
    
    @Environment (\.colorScheme) var colorScheme
    
    @State var titulo: String = ""
    
    @State var alturaLarguraCirculo: CGFloat = 40
    @State var corEscolhida: Color = .blue
    @State var figuraProjeto: String = "archivebox"
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    //Retangulo superior
                    ///Icone do projeto  e nome do projeto
                    ZStack(alignment: .center){
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 270)
                            .foregroundColor(colorScheme == .light ? brancoBotao : pretoBotao)
                        VStack{
                            ZStack{
                                Circle()
                                    .frame(width: 130, height: 130)
                                    .foregroundColor(corEscolhida)
                                
                                Image(systemName: figuraProjeto)
                                    .resizable()
                                    .frame(width: 60, height: 55)
                                    .foregroundColor(.white)
                            }
                            .padding(.bottom)
                            
                            TextField("Título do projeto...", text: $titulo)
                                .textFieldStyle(MyTextFieldStyle())
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    .padding(.horizontal)
                    
                    //Retangulo central
                    ///Escolha da cor de projeto
                    ZStack(alignment: .center){
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 100)
                            .foregroundColor(colorScheme == .light ? brancoBotao : pretoBotao)
                        
                        HStack{
                            Button(action: {
                                print("cor azul")
                                corEscolhida = .blue
                                
                            }, label: {Circle().frame(width: alturaLarguraCirculo, height: alturaLarguraCirculo).foregroundColor(.blue)})
                            
                            Button(action: {
                                print("cor vermelha")
                                corEscolhida = .red
                            }, label: {Circle().frame(width: alturaLarguraCirculo, height: alturaLarguraCirculo).foregroundColor(.red)})
                            
                            Button(action: {
                                print("cor verde")
                                corEscolhida = .green
                            }, label: {Circle().frame(width: alturaLarguraCirculo, height: alturaLarguraCirculo).foregroundColor(.green)})
                            
                            Button(action: {
                                print("cor amarela")
                                corEscolhida = .yellow
                            }, label: {Circle().frame(width: alturaLarguraCirculo, height: alturaLarguraCirculo).foregroundColor(.yellow)})
                            
                            Button(action: {
                                print("cor larajna")
                                corEscolhida = .orange
                            }, label: {Circle().frame(width: alturaLarguraCirculo, height: alturaLarguraCirculo).foregroundColor(.orange)})
                            
                            Button(action: {
                                print("cor verde")
                                corEscolhida = .green
                            }, label: {Circle().frame(width: alturaLarguraCirculo, height: alturaLarguraCirculo).foregroundColor(.green)})
                        }
                    }
                    .padding(.horizontal)
                    
                    //TODO: - Retangulo inferior
                    ///Escolha do ícone de projeto
                    ZStack(alignment: .center){
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 100)
                            .foregroundColor(colorScheme == .light ? brancoBotao : pretoBotao)
                        
                        HStack{
                            Button(action: {
                                figuraProjeto = "list.bullet"
                            }, label: {circleSymbols(color: .gray, symbols: "list.bullet")})
                            
                            Button(action: {
                                figuraProjeto = "list.number"
                            }, label: {circleSymbols(color: .gray, symbols: "list.number")})
                            
                            Button(action: {
                                figuraProjeto = "studentdesk"
                            }, label: {circleSymbols(color: .gray, symbols: "studentdesk")})
                            
                            Button(action: {
                                figuraProjeto = "pencil.and.ruler"
                            }, label: {circleSymbols(color: .gray, symbols: "pencil.and.ruler")})
                            
                            Button(action: {
                                figuraProjeto = "lamp.desk"
                            }, label: {circleSymbols(color: .gray, symbols: "lamp.desk")})
                            
                            Button(action: {
                                print("person")
                                figuraProjeto = "person"
                            }, label: {circleSymbols(color: .gray, symbols: "person")})
                        }
                    }
                    .padding(.horizontal)
                    
                }
                
            }.navigationTitle("Novo Projeto")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button(action: { print("Criado")}, label: {Text("Adicionar")})
                    })
                }
        }
    }
    
    
}

struct NewProject_Previews: PreviewProvider {
    static var previews: some View {
        NewProject()
    }
}


struct circleSymbols: View{
    @State var color: Color = .blue
    @State var symbols: String = "arquivebox"
    @State var alturaLarguraCirculo: CGFloat = 40
    
    var body: some View{
        ZStack{
            Circle()
                .frame(width: alturaLarguraCirculo, height: alturaLarguraCirculo)
                .foregroundColor(color)
            
            Image(systemName: symbols)
                .resizable()
                .frame(width: alturaLarguraCirculo-17, height: alturaLarguraCirculo-20)
                .foregroundColor(.white)
        }
    }
}
