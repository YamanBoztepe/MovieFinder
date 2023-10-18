//
//  HomeModel.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 18.10.2023.
//

import Foundation

enum HomeModel {
    
    struct Response: Codable, Hashable {
        let title: String?
        let year: String?
        let genre: String?
        let actors: String?
        let plot: String?
        let poster: String?
        let error: String?
        
        enum CodingKeys: String, CodingKey {
            case title = "Title"
            case year = "Year"
            case genre = "Genre"
            case actors = "Actors"
            case plot = "Plot"
            case poster = "Poster"
            case error = "Error"
        }
    }
}

/*
 object        {22}
 Title    :    Alice in Borderland
 Year    :    2020–
 Rated    :    TV-MA
 Released    :    10 Dec 2020
 Runtime    :    50 min
 Genre    :    Action, Drama, Mystery
 Director    :    N/A
 Writer    :    Haro Aso
 Actors    :    Kento Yamazaki, Tao Tsuchiya, Nijirô Murakami
 Plot    :    Obsessed gamer Arisu suddenly finds himself in a strange, emptied-out version of Tokyo in which he and his friends must compete in dangerous games in order to survive.
 Language    :    Japanese
 Country    :    Japan
 Awards    :    N/A
 Poster    :    https://m.media-amazon.com/images/M/MV5BODI0OGIxM2MtZTQ0YS00ZjhhLWE3YzYtYzE2N2JkNThmY2RkXkEyXkFqcGdeQXVyODkzMzE0Nzc@._V1_SX300.jpg
     Ratings        [1]
     0        {2}
 Source    :    Internet Movie Database
 Value    :    7.7/10
 Metascore    :    N/A
 imdbRating    :    7.7
 imdbVotes    :    89,721
 imdbID    :    tt10795658
 Type    :    series
 totalSeasons    :    2
 Response    :    True

 
 */
