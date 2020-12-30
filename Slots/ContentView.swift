//
//  ContentView.swift
//  Slots
//
//  Created by Gustas on 2020-12-30.
//

import SwiftUI

struct ContentView: View {
    
    private var slots: [String] = ["apple", "star", "cherry"]
    @State private var firstSlot: Int = 0
    @State private var secondSlot: Int = 0
    @State private var thirdSlot: Int = 0
    @State private var credits: Int = 1000
    @State private var gameOver: Bool = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("SwiftUI Slots!").font(.largeTitle)
                .fontWeight(.semibold)
            
            Spacer()
            
            Text("Credits: \(credits)")
            
            Spacer()
            
            HStack {
                Image(slots[firstSlot])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image(slots[secondSlot])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(slots[thirdSlot])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.padding()
            
            Spacer()
            
            Button(action: {
                
                if credits <= 0 {
                    gameOver = true
                    return
                }
                
                firstSlot = Int.random(in: 0...2)
                secondSlot = Int.random(in: 0...2)
                thirdSlot = Int.random(in: 0...2)
                
                if (firstSlot == secondSlot) && (firstSlot == thirdSlot) {
                    credits += 120
                } else {
                    credits -= 20
                }
                
            }) {
                HStack {
                    Image(systemName: "bolt")
                        .font(.title)
                    Text("Spin").font(.system(size: 21.0))
                        .fontWeight(.semibold)
                }
                .frame(width: 140, height: 60, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .bottom))
                .foregroundColor(.white)
                .cornerRadius(25.0)
                .shadow(radius: 5.0)
            }
            
            Spacer()
            
        }.alert(isPresented: $gameOver, content: {
            Alert(title: Text("Important"), message: Text("You don't have enough credits!"), dismissButton: .default(Text("Got it!")))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
