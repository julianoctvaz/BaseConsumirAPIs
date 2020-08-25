//
//  Film.swift
//  ConsumirAPIs
//
//  Created by Francisco Soares Neto on 20/08/20.
//  Copyright © 2020 Francisco Soares Neto. All rights reserved.
//

import Foundation

/// Film é um struct que pode ser decodificado a partir de um JSON

// MARK: - Film
struct Film: Codable {
    let id, title, filmDescription, director: String
    let producer, releaseDate, rtScore: String
    let people, species, locations, vehicles: [String]
    let url: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case filmDescription = "description"
        case director, producer
        case releaseDate = "release_date"
        case rtScore = "rt_score"
        case people, species, locations, vehicles, url
    }
}

//typealias Films = [Film] // o que é isso kkkkk scr tipo um apelido, aceito


//https://ghibliapi.herokuapp.com/films
//https://app.quicktype.io/ site que formata para varias linguagens modelos de json
