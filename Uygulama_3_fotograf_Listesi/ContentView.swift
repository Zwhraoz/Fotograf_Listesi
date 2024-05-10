//
//  ContentView.swift
//  Uygulama_3_fotograf_Listesi
//
//  Created by zehra özer on 9.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
       Home()
    }
}


struct Home : View {
    @State var sekmeler = ["Doğa" , "Hayvanlar" , "Balıklar" , "Çiçekler"]
    @State var arananIfade = ""
    @State var secilenSekme = "Doğa"
    
    @State var secilenGoruntuler : [[String]] = [["d11" , "d12"],["d21" , "d22"],["d31" , "d32"]]
        @State var dogaGoruntuleri : [[String]] = [["d11" , "d12"],["d21" , "d22"],["d31" , "d32"]]
        @State var balikGoruntuleri : [[String]] = [["b11" , "b12"],["b21" , "b22"],["b31" , "b32"]]
    @State var hayvanGoruntuleri : [[String]] = [["h11" , "h12"],["h21" , "h22"],["h31" , "h32"]]
    @State var cicekGoruntuleri : [[String]] = [["c11" , "c12"],["c21" , "c22"],["c31" , "c32"]]
    
    var body: some View {
        VStack {
            
            HStack {
                Button(action : { }) {
                    Image("menu")
                    .renderingMode(.original)}
                    Spacer()
                }.padding()
                .padding(.top , 0)
                    .background(Color.white)
                    .overlay(
                        Image("logo")
                            .renderingMode(.original))
                
                ScrollView(.vertical , showsIndicators: false) {
                    VStack (alignment:.leading , spacing:15) {
                        HStack {
                            Image("ara").renderingMode(.original)
                            TextField("Ara..." , text: $arananIfade)
                            
                        }.padding(12)
                            .background(Color.renk1)
                            .clipShape(Capsule())
                
                      
                        ZStack (alignment: .bottomTrailing) {
                            Image("anaGoruntu")
                                .resizable()
                                .frame(height: 350)
                            
                            HStack (spacing:15) {
                                Button(action: { }) {Image("ekle").renderingMode(.original)}
                                Button(action: { }) {Image("begeni").renderingMode(.original)}
                                Button(action: { }) {Image("indir").renderingMode(.original)}

                            }.padding()
                        }
                        
                        Text( "Trend Olanlar").font(.title).padding(.top)
                        
                        HStack (spacing:15){
                            
                            ForEach(sekmeler , id:\.self) { sekme in
                            
                                Button(action: {
                                    self.secilenSekme = sekme
                                    
                                    switch sekme {
                                    case "Doğa" : secilenGoruntuler = self.dogaGoruntuleri
                                    case "Balıklar" : secilenGoruntuler = self.balikGoruntuleri
                                    case "Hayvanlar" : secilenGoruntuler = self.hayvanGoruntuleri
                                    case "Çiçekler" : secilenGoruntuler = self.cicekGoruntuleri
                                    default : self.secilenGoruntuler = self.dogaGoruntuleri
                                    }
                                }) {
                                    VStack {
                                        Text(sekme).foregroundColor(.black)
                                        Capsule().fill(self.secilenSekme == sekme ? Color.black : Color.clear).frame(height:6)
                                    }
                                }
                            }
                            
                        }.padding(.top)
                        
                        VStack (spacing:15){
                            ForEach (secilenGoruntuler , id:\.self) { s in
                                HStack {
                                    ForEach(s , id:\.self) { goruntununAdi in
                                        Image(goruntununAdi).renderingMode(.original)
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width / 2 - 20 , height: 180)
                                            .cornerRadius(15)
                                            .contextMenu{
                                                Button (action: { 
                                                    UIImageWriteToSavedPhotosAlbum(UIImage(named: goruntununAdi)!, nil, nil, nil)
                                                }) {
                                                    HStack {
                                                        Text("Kaydet")
                                                            Image(systemName: "arrow.down")
                                                            .resizable()
                                                            .frame(width:15 , height: 15)
                                                    }
                                                }
                                            }
                                    }
                                }
                            }
                        }
                        
                    }.padding()
                }
            
        }.background(Color.arkaplan)
            .edgesIgnoringSafeArea(.bottom)
           
        
    }
}
#Preview {
    ContentView()
}
