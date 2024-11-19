//
//  TopicsView.swift
//  Anto-News
//
//  Created by Mariarita Patrelli on 13/11/24.
//

import SwiftUI

struct TopicsView: View {
    let topics = [
        ("Art", "ArtIcon"),
        ("Astrology", "AstrologyIcon"),
        ("Cinema", "CinemaIcon"),
        ("Fashion", "FashionIcon"),
        ("Gastronomy", "GastronomyIcon"),
        ("Health", "HealthIcon"),
        ("History", "HistoryIcon"),
        ("Music", "MusicIcon"),
        ("Nature", "NatureIcon"),
        ("Popular Culture", "PopularCultureIcon"),
        ("Science", "ScienceIcon"),
        ("Sport", "SportIcon"),
        ("Technology", "TechnologyIcon"),
        ("Travel", "TravelIcon"),
        ("Videogames", "VideogamesIcon")
    ]
    .sorted(by: { $0.0 < $1.0 })

    @State private var selectedTopics: Set<String> = []
    @State private var navigateToNextScreen = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("DarkBlue")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Choose Your Topics")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(
                        LinearGradient(
                            colors: [Color(.skyBlue), .highlight],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                            )
                        )
                        .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 2)
                        .padding(.top, 40)
                        .padding(.bottom, 20)
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 30) {
                            ForEach(topics, id: \.0) { topic, imageName in
                                Button(action: {
                                    if selectedTopics.contains(topic) {
                                        selectedTopics.remove(topic)
                                    } else {
                                        selectedTopics.insert(topic)
                                    }
                                }) {
                                    VStack {
                                        Image(imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 60)
                                            .padding(5)
                                        
                                        Text(topic)
                                            .font(.caption)
                                            .foregroundColor(selectedTopics.contains(topic) ? .white : .gray)
                                    }
                                    .frame(width: 100, height: 120)
                                    .background(selectedTopics.contains(topic) ? Color("SelectedBackground") : Color("CardBackground"))
                                    .cornerRadius(12)
                                    .shadow(radius: 5)
                                    .scaleEffect(selectedTopics.contains(topic) ? 1.1 : 1.0)
                                    .animation(.spring(), value: selectedTopics)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 20)
                    
                    NavigationLink(destination: SeeYouView()) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("Highlight"))
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        savePreferences()
                    })
                    .padding(.horizontal, 40)
                    .padding(.bottom, 30)
                }
            }
        }
    }
    
    func savePreferences() {
        let topicsArray = Array(selectedTopics)
        UserDefaults.standard.set(topicsArray, forKey: "SelectedTopics")
    }
}

#Preview {
    TopicsView()
}

