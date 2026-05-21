# CipherTick

A crypto market tracker built with engineering taste. Live prices, market data, and coin details — built on a custom architecture designed for control, performance, and developer clarity.

---

## What it does

 - Live cryptocurrency prices, market cap, 24h change, highs and lows
 - Coin detail view with full market data
 - Sortable coin list — by price, market cap, 24h change, trending
 - Search across coins by name or symbol
 - Skeleton loading states, empty states, error states with retry
 - Pull-to-refresh with rate-aware cooldown
 - Watchlist tab (in progress)

---

# Architecture

## Control Room (APIConfig.swift)

 - A 3-tier API control layer that manages the entire app's network behaviour from one place — readable by anyone, not just engineers.

```
let isAppWorking = true        // kill switch — shuts down the entire app instantly
let useAPIKey = true           // toggle API key on/off, switching to off uses public base URL.
let isKeyPremium = false       // switches between demo and premium base URLs

let isEnabledCoin    = true    // feature flags per endpoint namespace
let isEnabledChart   = false
let isEnabledSearch  = false
```

 - Every endpoint checks its own feature flag before firing. Every URL routes through URLConstructor which reads APIConfig to decide which base URL to use. Flipping isAppWorking to false stops the entire app at the network layer without touching any view code.
 - Designed independently as a way to make the config layer self-documenting and non-technical-user readable.
 - Endpoint Namespace System (Endpoint.swift)
 - Each API domain is its own enum conforming to EndpointType. Every endpoint carries its own feature-disable error — so if a feature is off, the error is thrown at the endpoint level before a URL is even constructed.

```
protocol EndpointType {
    var path: String { get }
    var isFeatureDisableError: APIError? { get }
}
```

Nine namespaces: Coins, Charts, Search, Global, NFTs, Categories, OnChain, Exchanges, Treasury. Disabled ones throw featureDisabled immediately, never reaching the network layer.

## Clean Architecture

 - CryptoRepository protocol with CryptoRepositoryImpl — network layer is fully swappable via dependency injection
 - NetworkServiceProtocol — injectable for testing
 - @Observable ViewModels with @MainActor — no manual DispatchQueue.main calls
 - NetworkState enum drives all UI states: .isLoading, .isSuccess, .isError, .isEmpty
 - NetworkStateController — single component handles all four states, injected with a retry closure and success view

## RateThrottler (RateThrottler.swift)

 - A Swift actor that enforces minimum intervals between API requests. Reads delay from APIConfig — 3.3s for demo keys, 0.3s for premium. Prevents rate-limit errors without any external dependency.
 ```
swiftactor RateThrottler {
    var canProceed: Bool { ... }  // actor-isolated, thread-safe
}
```
 - isFetching Guard + manualRefresh Cooldown 
 MarketViewModel carries two independent guards:

 - isFetching: Bool — prevents duplicate concurrent fetches if fetch() is called while already running
 - manualRefresh() — checks time elapsed since last manual refresh against the same interval as the throttler before allowing a pull-to-refresh to fire


## UI Patterns

 - PolymorphicStyle (PolymorphicStyle.swift)
 - A single view component that detects content type at runtime and applies appropriate styling automatically.
 - swift// Same call site — works for SF Symbols, asset images, or plain text
 - ActionButton(buttonDisplay: "arrow.up", infinite: false, alignLeft: false) { }
 - ActionButton(buttonDisplay: "My Label", infinite: false, alignLeft: false) { }
 - Internally checks UIImage(systemName:) first, then UIImage(named:), then falls back to Text. Each path gets its own styling. The caller never needs to know or specify which type it is.
 - This collapses what would normally be three separate button components into one unified API.
FeatureEnabler (FeatureEnabler.swift)
 - A view-level feature flag wrapper. Wraps any view with a boolean flag from APIConfig. If the flag is off, the view simply doesn't render — no conditionals scattered across view code.
 ```
swiftFeatureEnabler(flag: APIConfig.shared.isEnabledCoin) {
    // entire coin list view
}
```

## ActionButton + PrimaryButton

 - Two button families — action and primary — each with tap animation, spring scale effect, neon glow shadow on press, and selected state. Both use PolymorphicStyle internally so they accept any content type through the same interface.
 - Navigation variants (ActionNavigationButton, PrimaryNavigationButton) follow the same API with a destination view instead of an action closure.
 - AppRoute (AppRoute.swift)
 - Type-safe navigation routing via NavigationStack value-based navigation. All routes are cases of a single AppRoute enum, eliminating stringly-typed navigation entirely.
 - if View Extension (ifView.swift)
 - A @ViewBuilder extension on View that allows conditional modifier application inline without breaking the view builder chain.
 - Sizing Protocol (CoinDetails+Sizing.swift)
 - A protocol-based responsive layout system. CoinDetailsView picks between RegularSizing and CompactSizing based on horizontalSizeClass. New size classes can be added by conforming to Sizing without touching view layout code.

## Skeleton Loading

 - Three-layer skeleton system: LoadingStateView → ContentSkeletonView → SkeletonFlashView. The flash animates using .blendMode(.destinationOut) with .compositingGroup() — cutting a moving light shape through the skeleton rather than overlaying it. Sizes are driven by the content size passed in, making the skeleton proportionally accurate to the actual content.

# Planned Optimizations

 ### Ghostframe Strategy

   - Designed to solve request flooding during fast scrolling. The approach:

   -  Only cells currently on screen fetch live data
   -  When a cell leaves the viewport, its fetch is paused and its last known state is cached
   -  When it returns, the cached "ghost" frame renders immediately, then live fetching resumes after a short delay — creating the illusion of continuous refresh without redundant API calls

   -  The re-render delay is intentional, not artificial latency — it matches the actual fetch time and doubles as a UX signal that data is updating, preventing users from mistaking a state change for a UI glitch.
     
 ### 3-Page Sliding Window Prefetch
 
   -  Inspired by how TikTok and Instagram Reels handle video buffering. The approach:

   -  Memory holds exactly 3 pages at any time: previous, current, next
   -  On page transition, a 250ms spatial animation plays
   -  During that animation window, the next-next page prefetches in the background
   -  On transition complete, the previous page is cleared from memory

   - This gives zero visible latency on forward navigation, absolute memory control (locked at 60 items maximum), and ties the network fetch to proven user intent (the swipe gesture) rather than speculative prefetching.

## Performance (Real Device — iPad 10th Gen, A14 Bionic)

 - Measured via Xcode Instruments. Idle figures taken after initial load with no active network requests.
 - State Memory Idle: 12MB
 - Active (fetching + rendering): 38MB, Energy:Low, CPU: 0% ideal

### Stack

Swift · SwiftUI · async/await · Swift actors · @Observable · Clean Architecture · Protocol-based DI · CoinGecko API



