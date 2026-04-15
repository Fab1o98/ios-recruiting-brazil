//
//  ModelToPull.swift
//  RatingMovie
//
//  Created by Fábio Ribeiro de Lima on 06/04/26.
//

import Foundation
import Combine

//@Observable dar uma olhada
class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    func fetchMovies(){
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(APIConfig.apiKey)&language=pt-BR&page=1"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                
                if let decodedResponse = try? decoder.decode(MovieResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.movies = decodedResponse.results
                        //Estudar async e await após concluir a etapa de construção
                    }
                }
            }
        }.resume( )
    }
}
