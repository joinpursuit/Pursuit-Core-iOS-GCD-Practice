import Foundation

struct xkcdComic: Codable {
    let title: String
    let alt: String
    let img: String
    let num: Int
    static let maxComicNum = 2265
}
