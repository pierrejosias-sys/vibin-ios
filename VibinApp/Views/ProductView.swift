import SwiftUI

struct ProductView: View {
    let product: Product
    @State private var selectedSize = ""
    @State private var selectedColor = ""
    @State private var quantity = 1
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Product Image
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 400)
                    .overlay(
                        Text("Product Photo")
                            .foregroundColor(.gray)
                    )
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(product.name.uppercased())
                        .font(.system(size: 24, weight: .black))
                    
                    Text("$\(Int(product.price))")
                        .font(.system(size: 20, weight: .semibold))
                    
                    if let description = product.description {
                        Text(description)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    
                    // Sizes
                    if let sizes = product.sizes, !sizes.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("SIZE")
                                .font(.system(size: 11, weight: .bold))
                                .kerning(2)
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 10) {
                                ForEach(sizes, id: \.self) { size in
                                    Button(action: { selectedSize = size }) {
                                        Text(size)
                                            .font(.system(size: 14, weight: .semibold))
                                            .frame(width: 44, height: 44)
                                            .background(selectedSize == size ? Color.black : Color.gray.opacity(0.1))
                                            .foregroundColor(selectedSize == size ? .white : .black)
                                    }
                                }
                            }
                        }
                    }
                    
                    // Colors
                    if let colors = product.colors, !colors.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("COLOR")
                                .font(.system(size: 11, weight: .bold))
                                .kerning(2)
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 10) {
                                ForEach(colors, id: \.self) { color in
                                    Button(action: { selectedColor = color }) {
                                        Text(color)
                                            .font(.system(size: 12))
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 8)
                                            .background(selectedColor == color ? Color.black : Color.gray.opacity(0.1))
                                            .foregroundColor(selectedColor == color ? .white : .black)
                                    }
                                }
                            }
                        }
                    }
                    
                    // Quantity
                    HStack {
                        Text("QTY")
                            .font(.system(size: 11, weight: .bold))
                            .kerning(2)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        HStack(spacing: 20) {
                            Button(action: { if quantity > 1 { quantity -= 1 } }) {
                                Image(systemName: "minus")
                                    .foregroundColor(.black)
                            }
                            
                            Text("\(quantity)")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(minWidth: 30)
                            
                            Button(action: { quantity += 1 }) {
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                    // Add to Cart Button
                    Button(action: {}) {
                        Text("ADD TO CART")
                            .font(.system(size: 14, weight: .bold))
                            .kerning(2)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 12)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
