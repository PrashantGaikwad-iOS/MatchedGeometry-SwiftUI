//
//  ContentView.swift
//  MatchedGeoDemo
//
//  Created by Prashant Gaikwad on 17/07/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showTree = false
    @State private var showText = false
    
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            VStack {
                Image("tree")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .cornerRadius(25)
                    .matchedGeometryEffect(id: "tree", in: namespace)
                Text("Show me more detail.")
            }
            
            
            if showTree {
                
                VStack {
                    
                    ScrollView {
                        
                        VStack {
                            
                            Image("tree")
                                .resizable()
                                .frame(width: 300, height: 300)
                                .cornerRadius(25)
                                .matchedGeometryEffect(id: "tree", in: namespace)
                            
                            if showText {
                                TextEditor(text: .constant("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."))
                                    .frame(width: 300, height: 300)
                            }
                            
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                showText.toggle()
                            }
                        }
                        .onDisappear {
                            showText.toggle()
                        }
                        
                    }
                    
                }
                
            }
            
        }
        .animation(.spring())
        .onTapGesture {
            showTree.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
