//
//  ContentView.swift
//  Dice
//
//  Created by KOTA TAKAHASHI on 2023/10/14.
//

import SwiftUI

struct ContentView: View {
    @State var randomNumber = 1
    @State var timer: Timer?
    @State var isRolling = false

    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "die.face.\(randomNumber)")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2)
                .padding()
            
            Spacer()
            Button(action: {
                print("Rolled the Dice")
                isRolling = true
                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    randomNumber = Int.random(in: 1...6)
                }
 
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    timer?.invalidate()
                    timer = nil
                    isRolling = false
                }

            }) {
                Text("Roll the Dice")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
    
    func playDice(){
        
    }
}

#Preview {
    ContentView()
}
