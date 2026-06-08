cask "rust-redis-desktop" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.6"
  sha256 arm:   "969a3dbb4b0d87d01bd805b94df9d9220704e2d8199946bd5eac5aafe924f350",
         intel: "91797f544058339030f3624a3c6ff7cd2968ab4777067273d0d2f8e6ae9a9da8"

  url "https://github.com/yelog/rust-redis-desktop/releases/download/v#{version}/rust-redis-desktop-#{arch}.dmg"
  name "Rust Redis Desktop"
  desc "Redis desktop manager"
  homepage "https://github.com/yelog/rust-redis-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :catalina

  app "Rust Redis Desktop.app"

  zap trash: "~/Library/Application Support/rust-redis-desktop"
end
