//
//  ContentView.swift
//  UI-570
//
//  Created by nyannyan0328 on 2022/05/27.
//

import SwiftUI

struct ContentView: View {
    @State var showDetail : Bool = false
    @State var showDetailContent : Bool = false
    
    @Namespace var animation
    var body: some View {
        NavigationView{
            
            
            VStack(spacing:15){
                
                cardView(cardName: "p1")
                
                if !showDetail{
                    cardView(cardName: "p2")
                        .matchedGeometryEffect(id: "CARD", in: animation)
                        .onTapGesture {
                            
                            
                            withAnimation(.easeInOut(duration: 5)){
                                
                                showDetail = true
                            }
                        }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
            .navigationTitle("Hack")
            
        }
        .overlay(alignment: .top) {
            
            if showDetail{
                
                VStack(spacing:15){
                    
                  
                    
                    
                    cardView(cardName: "p2")
                        .matchedGeometryEffect(id: "CARD", in: animation)
                        .onTapGesture {
                            
                            withAnimation(.easeOut(duration: 4)){
                                
                                showDetailContent = false
                            }
                            
                            
                            withAnimation(.easeOut(duration: 4).delay(0.05)){
                                
                                showDetail = false
                            }
                        }
                    
                    VStack{
                        
                      Image("p2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                        
                    }
                    .opacity(showDetailContent ? 1 : 0)
                    
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
                .background(.white.opacity(showDetailContent ? 1 : 0))
                .transition(.offset(x: 1, y: 1))
                .onAppear {
                    
                    withAnimation(.easeInOut.delay(4)){
                        
                        showDetailContent = true
                    }
                }
            }
                
            
            
        }
    }
@ViewBuilder
    func cardView(cardName : String)->some View{
        
        Image(cardName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
