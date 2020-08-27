// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let incidents: [Incident]
}

// MARK: - Incident
struct Incident: Codable {
    let id: Int
    let title: String
    let incidentDescription: String?
    let address: String
    let occurredAt, updatedAt: Int
    let url: String
    let source: Source
    let media: Media
    //let locationType, locationDescription: JSONNull? //aqui
    let type: TypeEnum
  //  let typeProperties: JSONNull? //aqui

    enum CodingKeys: String, CodingKey {
        case id, title
        case incidentDescription = "description"
        case address
        case occurredAt = "occurred_at"
        case updatedAt = "updated_at"
        case url, source, media
        case locationType = "location_type"
        case locationDescription = "location_description"
        case type
        case typeProperties = "type_properties"
    }
}

// MARK: - Media
struct Media: Codable {
    let imageURL, imageURLThumb: String?

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case imageURLThumb = "image_url_thumb"
    }
}

// MARK: - Source
struct Source: Codable {
    let name: Name
    let htmlURL, apiURL: String

    enum CodingKeys: String, CodingKey {
        case name
        case htmlURL = "html_url"
        case apiURL = "api_url"
    }
}

enum Name: String, Codable {
    case bikeIndexOrg = "BikeIndex.org"
    case seeClickFixCOM = "SeeClickFix.com"
}

enum TypeEnum: String, Codable {
    case hazard = "Hazard"
    case theft = "Theft"
    case unconfirmed = "Unconfirmed"
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable { //aqui
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
