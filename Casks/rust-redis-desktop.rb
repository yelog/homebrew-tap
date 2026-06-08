cask "rust-redis-desktop" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.5"
  sha256 arm:   "7f6657c51a326d2285fba57cdf439ea134af917d536f190c0099ec28d70e7d97",
         intel: "7e7b51b20487dd96f05189b4394826b0568a4414ffd6f508884b20ac3cbd86dd"

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
