import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Double
    let image: String?
    let description: String?
    let category: String?
    let sizes: [String]?
    let colors: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, price, image, description, category, sizes, colors
    }
}

struct Order: Codable, Identifiable {
    let id: String
    let guest_email: String
    let total: Double
    let status: String
    let created_at: String
    let items: Int?
}

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
    var selectedSize: String
    var selectedColor: String
}
