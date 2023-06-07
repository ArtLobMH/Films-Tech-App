//
//  API.swift
//  Film&Tech
//
//  Created by Макбук on 06.06.2023.
//

import Foundation

class API{
    func getFilmCard(completion: @escaping ([FilmCard]) -> ()){
        if let url = URL(string: "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=1") {
            var request = URLRequest(url: url)
            request.addValue("403f07b8-4e7a-410f-b9a4-d123cdf27b52", forHTTPHeaderField: "TRN-Api-Key")
            request.httpMethod = "GET"
            let dataTask = URLSession.shared.dataTask(with: request) { (data, _, _) in
                print(1)
                guard let data else {
                    print("data")
                    return
                }
                print("data \(data)")
                let filmCards = try? JSONDecoder().decode([FilmCard].self, from: data)
                DispatchQueue.main.async {
                    completion(filmCards ?? [])
                }
            }
            dataTask.resume()
        }
    }
}
