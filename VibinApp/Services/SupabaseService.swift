import Foundation

class SupabaseService {
    static let shared = SupabaseService()
    
    private let baseURL = "https://grbwnjnngzcsjlubcmtp.supabase.co"
    private let anonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdyYnduam5uZ3pjc2psdWJjbXRwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzczNTgzMDEsImV4cCI6MjA5MjkzNDMwMX0.SYKFZJ0XVua0JmZ-tkaNhec2M3KtG3tS5vj_1Nl261c"
    
    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: "\(baseURL)/rest/v1/products?select=*") else {
            return []
        }
        
        var request = URLRequest(url: url)
        request.setValue(anonKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(anonKey)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        // Try to decode, fallback to static if fails
        if let products = try? JSONDecoder().decode([Product].self, from: data) {
            return products.isEmpty ? getStaticProducts() : products
        }
        
        return getStaticProducts()
    }
    
    private func getStaticProducts() -> [Product] {
        return [
            Product(id: 1, name: "VIBIN Classic Tee", price: 48, image: "https://images.unsplash.com/photo-1523381210434-271e8be1f52b", description: "Premium heavyweight cotton tee", category: "Tops", sizes: ["S", "M", "L", "XL"], colors: ["Black", "White", "Coral"]),
            Product(id: 2, name: "VIBIN Street Hoodie", price: 96, image: "https://images.unsplash.com/photo-1556821840-3a63f95609a7", description: "Heavyweight pullover hoodie", category: "Outerwear", sizes: ["S", "M", "L", "XL"], colors: ["Black", "Grey"]),
            Product(id: 3, name: "VIBIN Joggers", price: 72, image: "https://images.unsplash.com/photo-1523381210434-271e8be1f52b", description: "Tapered fit joggers", category: "Bottoms", sizes: ["S", "M", "L", "XL"], colors: ["Black", "Olive"]),
            Product(id: 4, name: "VIBIN Cap", price: 36, image: "https://images.unsplash.com/photo-1523381210434-271e8be1f52b", description: "Embroidered snapback", category: "Accessories", sizes: nil, colors: ["Black", "White"]),
            Product(id: 5, name: "VIBIN Longsleeve", price: 64, image: "https://images.unsplash.com/photo-1523381210434-271e8be1f52b", description: "Heavyweight longsleeve", category: "Tops", sizes: ["S", "M", "L", "XL"], colors: ["Black", "White"]),
            Product(id: 6, name: "VIBIN Shorts", price: 56, image: "https://images.unsplash.com/photo-1523381210434-271e8be1f52b", description: "Athletic mesh shorts", category: "Bottoms", sizes: ["S", "M", "L", "XL"], colors: ["Black", "Grey"])
        ]
    }
}
