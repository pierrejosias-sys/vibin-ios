# Vibin iOS App

The official iOS companion app for **Vibin Apparel** — streetwear that speaks for you.

## Features

- **Browse Products** — Shop tees, hoodies, joggers, and more
- **Category Filters** — Find exactly what you're looking for
- **Product Details** — Size and color selection with real-time pricing
- **Cart Management** — Add, remove, and adjust quantities
- **Secure Checkout** — Streamlined ordering flow
- **User Profiles** — Order history and account management
- **Supabase Backend** — Real-time data sync with web store

## Requirements

- iOS 16.0+
- Xcode 15+
- Swift 5.9+

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/pierrejosias-sys/vibin-ios.git
   ```

2. Open Xcode and create a new iOS App project named "VibinApp"

3. Copy the Swift files from this repo into your Xcode project:
   - `VibinApp/VibinApp.swift`
   - `VibinApp/Models/Product.swift`
   - `VibinApp/Services/SupabaseService.swift`
   - `VibinApp/Views/*.swift`

4. Set the bundle identifier to `com.vibin.app`

5. Build and run on simulator or device

## Configuration

The app connects to the Vibin Supabase backend. The configuration is in `SupabaseService.swift`:
- URL: `https://grbwnjnngzcsjlubcmtp.supabase.co`
- Anon Key: Configured in the service

## App Structure

```
VibinApp/
├── Models/
│   └── Product.swift
├── Services/
│   └── SupabaseService.swift
├── Views/
│   ├── ContentView.swift (Tab bar)
│   ├── HomeView.swift
│   ├── ShopView.swift
│   ├── ProductView.swift
│   ├── CartView.swift
│   └── ProfileView.swift
└── VibinApp.swift (Entry point)
```

## Design

The app follows Vibin's monochrome aesthetic with coral accents:
- **Primary**: Black (#000000)
- **Accent**: Coral (#FF6B4A)
- **Background**: Off-white (#FAFAF8)
- **Typography**: System fonts with Anton for headers

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

Vibin Apparel - [@vibin_](https://instagram.com/vibin_)

Project Link: [https://github.com/pierrejosias-sys/vibin-ios](https://github.com/pierrejosias-sys/vibin-ios)
