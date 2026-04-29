import SwiftUI

struct CartView: View {
    @State private var cartItems: [CartItem] = []
    
    var total: Double {
        cartItems.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if cartItems.isEmpty {
                    Spacer()
                    Text("Your cart is empty")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(cartItems) { item in
                                CartItemRow(item: item)
                            }
                        }
                        .padding()
                    }
                    
                    // Cart Footer
                    VStack(spacing: 12) {
                        HStack {
                            Text("TOTAL")
                                .font(.system(size: 11, weight: .bold))
                                .kerning(2)
                            Spacer()
                            Text("$\(Int(total))")
                                .font(.system(size: 20, weight: .bold))
                        }
                        
                        NavigationLink(destination: CheckoutView()) {
                            Text("CHECKOUT")
                                .font(.system(size: 14, weight: .bold))
                                .kerning(2)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(red: 1.0, green: 0.4, blue: 0.3))
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .shadow(color: .black.opacity(0.05), radius: 10, y: -5)
                }
            }
            .navigationTitle("CART")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CartItemRow: View {
    let item: CartItem
    
    var body: some View {
        HStack(spacing: 12) {
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 80, height: 80)
                .overlay(Text("Photo").font(.system(size: 10)).foregroundColor(.gray))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.product.name)
                    .font(.system(size: 14, weight: .semibold))
                Text("Size: \(item.selectedSize) • Color: \(item.selectedColor)")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text("$\(Int(item.product.price))")
                    .font(.system(size: 14, weight: .semibold))
            }
            
            Spacer()
            
            Text("×\(item.quantity)")
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
    }
}

struct CheckoutView: View {
    @State private var email = ""
    @State private var name = ""
    @State private var address = ""
    @State private var city = ""
    @State private var zip = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("CHECKOUT")
                    .font(.system(size: 28, weight: .black))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                Group {
                    TextField("Email", text: $email)
                    TextField("Full Name", text: $name)
                    TextField("Address", text: $address)
                    HStack {
                        TextField("City", text: $city)
                        TextField("ZIP", text: $zip)
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {}) {
                    Text("PLACE ORDER")
                        .font(.system(size: 14, weight: .bold))
                        .kerning(2)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}
