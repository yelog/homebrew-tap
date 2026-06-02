cask "rust-redis-desktop" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.3"
  sha256 arm:   "36a8ea4cd2d542a5340762e761a4e685cf8b971465ea8ccbc926dded54b9327e",
         intel: "e3b66b98d8847e9458a545fe224c6ad54c3a9f4a6c8249f399ebb8e84f452932"

  url "https://github.com/yelog/rust-redis-desktop/releases/download/v#{version}/rust-redis-desktop-#{arch}.dmg"
  name "Rust Redis Desktop"
  desc "Redis desktop manager"
  homepage "https://github.com/yelog/rust-redis-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Rust Redis Desktop.app"

  zap trash: "~/Library/Application Support/rust-redis-desktop"
end
