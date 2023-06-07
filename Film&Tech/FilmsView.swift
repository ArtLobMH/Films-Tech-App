//
//  FilmsView.swift
//  Film&Tech
//
//  Created by Макбук on 06.06.2023.
//

import SwiftUI

struct FilmsView: View {
    
    @State var filmCards: [FilmCard] = []
    
    var body: some View {
            NavigationView{
                List(filmCards){ filmCard in
                    VStack {
                        Text(filmCard.nameRu)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                    }
                }
                Text("Films")
                .onAppear(){
                    API().getFilmCard { (filmCards) in
                        self.filmCards = filmCards
                    }
                }
                .navigationBarTitle("Films")
            }
    }
}

struct Country: Codable, Equatable {
    let country: String
}

struct Genre: Codable, Equatable {
    let genre: String
}

struct ResultTop250: Codable, Equatable {
    let pagesCount: Int
    let films: [FilmCard]
}

struct FilmsView_Previews: PreviewProvider {
    static var previews: some View {
        FilmsView()
    }
}

struct FilmCard: Codable, Equatable, Identifiable {
    static func == (lhs: FilmCard, rhs: FilmCard) -> Bool {
        lhs.filmId == rhs.filmId &&
        lhs.rating == rhs.rating &&
        lhs.ratingVoteCount == rhs.ratingVoteCount
    }
    
    let filmId: Int
    let nameRu: String
    let nameEn: String?
    let year: String
    let filmLength: String
    let countries: [Country]
    let genres: [Genre]
    let rating: String
    let ratingVoteCount: Int
    let posterUrl: String
    let posterUrlPreview: String
    
    var id: Int {
        filmId
    }
    
    var preview: URL {
        URL(string: posterUrlPreview)!
    }
    
    var original: URL {
        URL(string: posterUrl)!
    }
    
    var genresList: String {
        genres.compactMap({ $0.genre }).joined(separator: ", ")
    }
    
    var countriesList: String {
        countries.compactMap({ $0.country }).joined(separator: ", ")
    }
    
    var ratingNumber: Double {
        Double(rating) ?? 0.0
    }
    
    var ratingColor: String {
        if ratingNumber >= 7.0 { return "ratingGreen" }
        if ratingNumber < 5.0 { return "ratingRed" }
        
        return "ratingGray"
    }
    
    var ratingVoteString: String {
        "\(ratingVoteCount / 1000)K"
    }
}

/*"filmId": 435,
"nameRu": "Зеленая миля",
"nameEn": "The Green Mile",
"year": "1999",
"filmLength": "03:09",
"countries": [],
"genres": [],
"rating": "9.1",
"ratingVoteCount": 882768,
"posterUrl": "https://kinopoiskapiunofficial.tech/images/posters/kp/435.jpg",
"posterUrlPreview": "https://kinopoiskapiunofficial.tech/images/posters/kp_small/435.jpg",
"ratingChange": null
}
*/
