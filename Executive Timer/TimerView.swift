//
//  ContentView.swift
//  Executive Timer
//
//  Created by Александр Соболев on 26.11.2023.
//

import SwiftUI

let defaultTime: CGFloat = 20
let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct TimerView: View {
    
    @State private var timeRunning = false
    @State private var countdownTime: CGFloat = defaultTime
    
    
    var body: some View {
        
        let strokeStyle = StrokeStyle(lineWidth: 15, lineCap: .round)
        
        let buttonIcon = timeRunning ? "pause.rectangle.fill" : "play.rectangle.fill"
        
        let countdownColor: Color = {
            switch (countdownTime) {
            case 6...: return Color.green
            case 3...: return Color.yellow
            default: return Color.red
            }
        } ()
        
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), style: strokeStyle)
            Circle()
                .trim(from: 0, to: 1 - ((defaultTime - countdownTime) / defaultTime))
                .stroke(countdownColor, style: strokeStyle)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut, value: 0.5)
            HStack(spacing: 25) {
                Label("", systemImage: buttonIcon)
                    .foregroundColor(.black).font(.title)
                    .onTapGesture (
                        perform: { timeRunning.toggle() })
                Text("\(Int(countdownTime))")
                    .font(.largeTitle)
                Label("", systemImage: "gobackward")
                    .foregroundColor(.red)
                    .font(.title)
                    .onTapGesture (perform: {
                        timeRunning = false
                        countdownTime = defaultTime
                    })
            } .frame(width: 150 * 2, height: 150 * 2)
                .onReceive(timer, perform: { _ in
                    guard timeRunning else { return }
                    if countdownTime > 0 {
                        countdownTime -= 1
                    } else {
                        timeRunning = false
                        countdownTime = defaultTime
                    }
                })
        }
    }
}
    
#Preview {
            TimerView()
        }
