cask "rust-redis-desktop" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.2"
  sha256 arm:   "6bed107f6f818e16ee73519fe8e432893eae63b0ca93d51c70b27fef71cb13d8",
         intel: "d76b9b8f21604f4c6bf95f771793409db27919043f9eec24aa582790638d2cd1"

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
