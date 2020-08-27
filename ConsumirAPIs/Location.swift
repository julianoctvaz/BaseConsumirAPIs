//
//  Location.swift
//  ConsumirAPIs
//
//  Created by Juliano Vaz on 27/08/20.
//  Copyright © 2020 Francisco Soares Neto. All rights reserved.
//

import Foundation
// MARK: - Incident
struct Location: Codable {
    let type: String
    let features: [Feature]
}
// MARK: - Feature
struct Feature: Codable {
    let type: FeatureType
    let properties: Properties
    let geometry: Geometry
}
// MARK: - Geometry
struct Geometry: Codable {
    let type: GeometryType
    let coordinates: [Double]
}
enum GeometryType: String, Codable {
    case point = "Point"
}
// MARK: - Properties
struct Properties: Codable {
    let id: Int
    let type: PropertiesType
    let occurredAt: Int
    enum CodingKeys: String, CodingKey {
        case id, type
        case occurredAt = "occurred_at"
    }
}
enum PropertiesType: String, Codable {
    case hazard = "Hazard"
    case theft = "Theft"
    case unconfirmed = "Unconfirmed"
}
enum FeatureType: String, Codable {
    case feature = "Feature"
}
