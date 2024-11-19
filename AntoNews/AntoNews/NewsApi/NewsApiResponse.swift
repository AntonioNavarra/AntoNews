//
//  NewsApiResponse.swift
//  AntoNews
//
//  Created by Antonio Navarra on 13/11/24.
//

import Foundation

struct NewsAPIResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
    let urlToImage: String?
    let publishedAt: String
    let urlArticle: String
}
