//
//  NewsApiService.swift
//  AntoNews
//
//  Created by Antonio Navarra on 12/11/24.
//

import Foundation

class NewsAPIService {
    private let apiKey = "200b8be6747f49e98001562b57f9d2cf"
    private let baseURL = "https://newsapi.org/v2/everything"
    
    func fetchNews(for topics: [String], completion: @escaping (Result<[Article], Error>) -> Void) {
        let query = topics.joined(separator: " OR ")
        guard let url = URL(string: "\(baseURL)?q=\(query)&apiKey=\(apiKey)") else {
            completion(.failure(NewsAPIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NewsAPIError.noData))
                return
            }
            
            do {
                let newsResponse = try JSONDecoder().decode(NewsAPIResponse.self, from: data)
                let articles = newsResponse.articles.map {
                    Article(
                        title: $0.title,
                        description: $0.description,
                        urlToImage: $0.urlToImage,
                        publishedAt: $0.publishedAt,
                        urlArticle: $0.urlArticle
                    )
                }
                completion(.success(articles))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

enum NewsAPIError: Error {
    case invalidURL
    case noData
}

