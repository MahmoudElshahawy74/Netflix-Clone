//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Mahmoud Elshahawy on 21/07/2024.
//

import Foundation

struct Constants {
    static let API_KEY = "37faa3490988e88118b757c6fc3f508f"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeAPI_KEY = "AIzaSyD5MZcI9RX7DCmlk9r8Jc7jL84DHonXkf8"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    
    static let shared = APICaller()
    
    // MARK -> Trending Movies
    
   func getTrendingMovies(comletion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                //                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //                print(results)
                
                        let APIResults = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                        //print(APIResults)
 //Check if results are not nil and not empty
                        if let results = APIResults.results, !results.isEmpty {
                            comletion(.success(results))
                        } else {
//  If results are nil or empty
                            comletion(.failure(APIError.failedToGetData))
                        }
                    } catch {
                        comletion(.failure(APIError.failedToGetData))
                    }
                }
        task.resume()
    }
    
    // MARK -> Trending TV
    
    func getTrendingTvs(comletion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let APIResults = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
             //  print(APIResults)
                if let results = APIResults.results, !results.isEmpty {
                    comletion(.success(results))
                } else {
//  If results are nil or empty
                    comletion(.failure(APIError.failedToGetData))
                }
            } catch {
                comletion(.failure(APIError.failedToGetData))
            }
                }
        task.resume()
    }
    
    // MARK -> UpComing Movies
    
    func getUpcomingMovies(comletion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
          
                let APIResults = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
              // print(APIResults)
                if let results = APIResults.results, !results.isEmpty {
                    comletion(.success(results))
                } else {
//  If results are nil or empty
                    comletion(.failure(APIError.failedToGetData))
                }
                    } catch {
                        comletion(.failure(APIError.failedToGetData))
                    }
                }
        task.resume()
    }
    
    
    // MARK -> Popular
    
    func getPopular(comletion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {

                let APIResults = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                comletion(.success(APIResults.results!))
              // print(APIResults)
                if let results = APIResults.results, !results.isEmpty {
                    comletion(.success(results))
                } else {
//  If results are nil or empty
                    comletion(.failure(APIError.failedToGetData))
                }
            } catch {
                        comletion(.failure(APIError.failedToGetData))
                    }
                }
        task.resume()
    }
    
    
    // MARK -> Top Rated
    
    func getTopRated(comletion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let APIResults = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                comletion(.success(APIResults.results!))
              // print(APIResults)
                if let results = APIResults.results, !results.isEmpty {
                    comletion(.success(results))
                } else {
//  If results are nil or empty
                    comletion(.failure(APIError.failedToGetData))
                }
                    } catch {
                        comletion(.failure(APIError.failedToGetData))
                    }
                }
        task.resume()
    }
    
    
    // MARK -> Discover Movies
    
    func getDiscoverMovies(comletion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let APIResults = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                comletion(.success(APIResults.results!))
              // print(APIResults)
                if let results = APIResults.results, !results.isEmpty {
                    comletion(.success(results))
                } else {
//  If results are nil or empty
                    comletion(.failure(APIError.failedToGetData))
                }
                    } catch {
                        comletion(.failure(APIError.failedToGetData))
                    }
                }
        task.resume()
    }
    
    // MARK -> Search
    
    func search(with query: String, comletion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else{
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let APIResults = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                comletion(.success(APIResults.results!))
              // print(APIResults)
                if let results = APIResults.results, !results.isEmpty {
                    comletion(.success(results))
                } else {
//  If results are nil or empty
                    comletion(.failure(APIError.failedToGetData))
                }
                    } catch {
                        comletion(.failure(APIError.failedToGetData))
                    }
                }
        task.resume()
    }
    
    
    func getMovie(with query: String, comletion: @escaping (Result<VideoElement, Error>) -> Void){
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let APIResults = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                  
                comletion(.success(APIResults.items![0]))
                
                    } catch {
                        comletion(.failure(APIError.failedToGetData))
                        print(error.localizedDescription)
                    }
                }
        task.resume()
        
        
    }
    
    
}




