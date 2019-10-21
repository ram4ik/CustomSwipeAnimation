//
//  ContentView.swift
//  CustomSwipeAnimation
//
//  Created by ramil on 21.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var backViewSize: CGFloat = 80
    @State var size: CGSize = .zero
    
    var body: some View {
            
        // geometry property is used to resad parent view size or coordinates...
        GeometryReader { reader in
            ZStack {
                VStack {
                    Color.blue
                }.frame(width: reader.size.width - 160, height: 300)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: -30)
                
                VStack {
                    Color.orange
                }.frame(width: reader.size.width - self.backViewSize, height: 300)
                .cornerRadius(20)
                .shadow(radius: 20)
                    .offset(y: -15)
                
                VStack {
                    Color.red
                }.frame(width: reader.size.width - 50, height: 300)
                .cornerRadius(20)
                .shadow(radius: 20)
                    .gesture(DragGesture().onChanged({ (value) in
                        self.size = value.translation
                        self.backViewSize = 50
                    }).onEnded({ (value) in
                        self.size = .zero
                        self.backViewSize = 80
                    }))
                    .offset(self.size)
            }
        }
        .animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
   
// you can use your custom animations and effects to your card...
