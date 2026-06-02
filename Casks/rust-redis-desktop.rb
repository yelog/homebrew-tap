cask "rust-redis-desktop" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.4"
  sha256 arm:   "0d90ca41791c4547b2d507c96601fdfc12aa9dba60a83175e886053eb59c48bc",
         intel: "1f22482fe53e42c1442f5b43e485d11dfd17e1bba333dbaf85e67deaed10bdce"

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
