//
//  DetailsNewsView.swift
//  AntoNews
//
//  Created by Antonio Navarra on 13/11/24.
//

import SwiftUI

struct DetailNewsView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("SkySportsImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 450)
                .clipped()
            
            ZStack(alignment: .top) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.white)
                        .shadow(radius: 5)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("The 31-year-old Australia captain, who has missed the majority of this year with an ACL injury, revealed the news in a post on Instagram on Monday, saying: Mewis-Kerr baby coming 2025!. It came with a picture of the couple kissing and showing off Mewis' baby bump.While many were quick to congratulate them, they faced what Chelsea described as unacceptable and hateful homophobic comments")
                                .font(.body)
                                .foregroundColor(.black)
                                .lineSpacing(5)
                            
                            Divider()
                                .background(Color.gray.opacity(0.7))
                            
                            Text("Comments on Kerr's original post were also limited after it had initially gone up.In a statement, a spokesperson for Chelsea said: Chelsea Football Club is aware of recent unacceptable and hateful homophobic comments published across various social media platforms.")
                                .font(.body)
                                .foregroundColor(.black)
                                .lineSpacing(5)
                            
                            Divider()
                                .background(Color.gray.opacity(0.7))
                            
                            Text("There is no place in society for any form of discrimination and we will not accept any abuse directed towards our players, staff or supporters.We are extremely proud to be a diverse, inclusive club that celebrates and welcomes people from all cultures, communities and identities.")
                                .font(.body)
                                .foregroundColor(.black)
                                .lineSpacing(5)
                        }
                        .padding(.horizontal, 25)
                        .padding(.top, 50)
                        .padding(.bottom, 20)
                    }
                }
                .padding(.top, 50)

                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.darkBlue)
                        .frame(height: 140)
                        .shadow(radius: 5)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Tuesday, 19 November 2024")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                        
                        Text("Chelsea have condemned homophobic abuse aimed at striker Sam Kerr")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        
                        Text("Published by Sky Sports.com")
                            .font(.subheadline)
                            .foregroundColor(.beige)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                }
                .padding(.horizontal, 20)
                .offset(y: -60)
            }
            .padding(.top, -80)
        }
        .background(Color(.systemGray6))
        .ignoresSafeArea()
    }
}

#Preview {
    DetailNewsView()
}
