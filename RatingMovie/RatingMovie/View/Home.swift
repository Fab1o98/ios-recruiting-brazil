//
//  Home.swift
//  RatingMovie
//
//  Created by Fábio Ribeiro de Lima on 02/04/26.
//
import SwiftUI
import SwiftData

struct Home: View {
    @StateObject var viewModel = MovieViewModel()
    var body: some View {
        NavigationStack{
            List(viewModel.movies) { movie in
                Text(movie.title ?? "Title is empty")
                    .font(.headline)
                
                HStack{
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(movie.poster_path ?? "")")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView() // Tela enquanto carrega o filme.
                        case .success(let image): // Imagem carregada com sucesso.
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 120)
                                .cornerRadius(10)
                        case .failure:
                            // Caso foto não carregue
                            Image(systemName: "photo")
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                
//                Text("\(movie.id)")
//                    .font(.caption)
//                    .foregroundColor(.gray)
            }
        }
        .navigationTitle(Text("Popular Movies"))
        .onAppear(perform: viewModel.fetchMovies)
    }
}
