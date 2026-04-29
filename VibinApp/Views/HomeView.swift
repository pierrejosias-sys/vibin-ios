import SwiftUI

struct HomeView: View {
    @State private var products: [Product] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Hero Section
                    ZStack {
                        Rectangle()
                            .fill(Color.black)
                            .frame(height: 300)
                        
                        VStack {
                            Text("VIBIN")
                                .font(.system(size: 48, weight: .black))
                                .foregroundColor(.white)
                            
                            Text("Different.")
                                .font(.system(size: 24, weight: .light, design: .italic))
                                .foregroundColor(Color(red: 1.0, green: 0.4, blue: 0.3))
                            
                            Text("Streetwear that speaks for you.")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .padding(.top, 8)
                        }
                    }
                    
                    // Featured Products
                    HStack {
                        Text("FEATURED")
                            .font(.system(size: 12, weight: .bold))
                            .kerning(3)
                            .foregroundColor(Color(red: 1.0, green: 0.4, blue: 0.3))
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(products.prefix(6)) { product in
                                NavigationLink(destination: ProductView(product: product)) {
                                    ProductCard(product: product)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarHidden(true)
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

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 160, height: 200)
                .overlay(
                    Text("Photo")
                        .foregroundColor(.gray)
                )
            
            Text(product.name)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
            
            Text("$\(Int(product.price))")
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
        .frame(width: 160)
    }
}
