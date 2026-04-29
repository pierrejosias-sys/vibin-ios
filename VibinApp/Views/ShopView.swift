import SwiftUI

struct ShopView: View {
    @State private var products: [Product] = []
    @State private var selectedCategory = "All"
    
    let categories = ["All", "Tops", "Bottoms", "Outerwear", "Accessories"]
    
    var filteredProducts: [Product] {
        if selectedCategory == "All" {
            return products
        }
        return products.filter { $0.category == selectedCategory }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Category Filter
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            Button(action: { selectedCategory = category }) {
                                Text(category.uppercased())
                                    .font(.system(size: 11, weight: .bold))
                                    .kerning(1.5)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedCategory == category ? Color.black : Color.gray.opacity(0.1))
                                    .foregroundColor(selectedCategory == category ? .white : .black)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                }
                
                // Products Grid
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                        ForEach(filteredProducts) { product in
                            NavigationLink(destination: ProductView(product: product)) {
                                ProductGridCard(product: product)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("SHOP")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await loadProducts()
            }
        }
    }
    
    func loadProducts() async {
        do {
            products = try await SupabaseService.shared.fetchProducts()
        } catch {
            products = []
        }
    }
}

struct ProductGridCard: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    Text("Photo")
                        .foregroundColor(.gray)
                )
            
            Text(product.name)
                .font(.system(size: 13, weight: .semibold))
                .lineLimit(1)
            
            Text("$\(Int(product.price))")
                .font(.system(size: 13))
                .foregroundColor(.gray)
        }
    }
}
