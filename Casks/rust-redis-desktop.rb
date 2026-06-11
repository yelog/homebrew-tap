cask "rust-redis-desktop" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.7"
  sha256 arm:   "1e50ffb785b5aa6b9fb67ff9001840bd634e38906fcfba3d34b7311f92c97ab0",
         intel: "5dcd13d263e6b8c7f01320a7404060364eda4055e8c7a38c8998b9e9bc33c38b"

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
