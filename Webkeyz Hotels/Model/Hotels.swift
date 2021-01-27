//
//  Hotels.swift
//  Webkeyz Hotels
//
//  Created by Amr Fawzy on 1/26/21.
//

import Foundation


// MARK: - Hotels
struct Hotels : Decodable {
    var hotel: [Hotel]
}

// MARK: - Hotel
struct Hotel : Decodable {
    var hotelID: Int?
    var image: [Image]
    var location: Location?
    var summary: Summary?
}

// MARK: - Image
struct Image : Decodable {
    var url: String?
}

// MARK: - Location
struct Location : Decodable {
    var address: String?
    var latitude, longitude: Double?
}

// MARK: - Summary
struct Summary : Decodable {
    var highRate: Double?
    var hotelName: String?
    var lowRate: Double?
}
