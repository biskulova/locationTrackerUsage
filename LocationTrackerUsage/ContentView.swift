//
//  ContentView.swift
//  LocationTrackerUsage
//
//  Created by Oleksandra Biskulova on 05.04.2024.
//

import LocationTracker
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button(action: {
                shareLocation()
            }, label: {
                Text("Send location")
            })
        }
        .padding()
        .task {
            await LocationTracker.shared.initialize()
        }
    }
    
    private func shareLocation() {
        Task {
            await LocationTracker.shared.sendCurrentLocation()
        }
    }
}

#Preview {
    ContentView()
}
