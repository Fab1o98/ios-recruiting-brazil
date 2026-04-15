//
//  Untitled.swift
//  RatingMovie
//
//  Created by Fábio Ribeiro de Lima on 08/04/26.
//
import Foundation
import Combine

struct MovieResponse: Codable, Sendable {
    let results: [Movie]
}

struct Movie: Codable, Identifiable, Sendable {
    let id : Int
    let title : String?
    let overview : String?
    let genre_ids : [Int]?
    let poster_path : String? 
    
    // Caso o nome das variaveis seja diferente do que a API me entrega preciso declarar isso com o "codingKeys"
}
