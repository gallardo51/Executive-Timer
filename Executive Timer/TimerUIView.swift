//
//  TimerUIView.swift
//  Executive Timer
//
//  Created by Александр Соболев on 26.11.2023.
//

import SwiftUI

struct TimerUIView: View {
    var body: some View {
        TabView{
            TimerView()
                .padding()
                .tabItem {
                    Image(systemName: "timer")
                    Text("Timer")
                }
                .tag(1)
            
            TimerSettingsUIView()
                        .padding()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                        .tag("Settings")
                }
            }
        }

#Preview {
    TimerUIView()
}
