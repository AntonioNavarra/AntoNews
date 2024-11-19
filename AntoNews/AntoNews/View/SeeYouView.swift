//
//  SeeYouView.swift
//  AntoNews
//
//  Created by Antonio Navarra on 18/11/24.
//

import SwiftUI

struct SeeYouView: View {
    @State private var animateCircle = false
    @State private var rotateGradient = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.darkBlue)
                    .ignoresSafeArea()
                VStack(spacing: 40) {
                    ZStack {
                        Circle()
                            .stroke(
                                AngularGradient(
                                    gradient: Gradient(colors: [Color(.highlight).opacity(0.4), Color(.darkBlue), Color(.highlight)]),
                                    center: .center,
                                    angle: .degrees(rotateGradient ? 360 : 0)
                                ),
                                lineWidth: 10
                            )
                            .frame(width: animateCircle ? 250 : 230, height: animateCircle ? 250 : 230)
                            .blur(radius: 20)
                            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animateCircle)
                        
                        Circle()
                            .fill(
                                AngularGradient(
                                    gradient: Gradient(colors: [Color(.highlight), Color(.darkBlue), Color(.highlight)]),
                                    center: .center,
                                    angle: .degrees(rotateGradient ? 360 : 0)
                                )
                            )
                            .frame(width: 200, height: 200)
                            .shadow(color: Color(.highlight), radius: 20, x: 0, y: 10)
                            .animation(.linear(duration: 4).repeatForever(autoreverses: false), value: rotateGradient)
                    }
                    .onAppear {
                        animateCircle = true
                        rotateGradient = true
                    }
                    
                    Text("See You Tomorrow!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color(.highlight), .skyBlue],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 0)
                    
                    Text("Every day you will receive a notification with news based on the topics you’ve chosen.")
                        .foregroundColor(.white)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                        .lineSpacing(6)
                }
                .padding(.bottom, 60)
            }
        }
    }
}

#Preview {
    SeeYouView()
}
