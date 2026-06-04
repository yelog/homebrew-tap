cask "vibebar" do
  version "1.3.7"
  sha256 "32753820a67bcfc417a94687f90325b8d0c16c6a462605cd4b837a11a792375f"

  url "https://github.com/yelog/VibeBar/releases/download/v#{version}/VibeBar-#{version}-universal.dmg"
  name "VibeBar"
  desc "Menu bar app for monitoring AI coding sessions"
  homepage "https://github.com/yelog/VibeBar"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:-(?:beta|alpha|rc)\.?\d*)?)$/i)
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "VibeBar.app"

  postflight do
    FileUtils.mkdir_p("#{Dir.home}/Library/Application Support/VibeBar/sessions")
    FileUtils.mkdir_p("#{Dir.home}/Library/Application Support/VibeBar/runtime")
  end

  uninstall quit: "com.vibebar.app"

  zap trash: [
    "~/Library/Application Support/VibeBar",
    "~/Library/Caches/com.vibebar.app",
    "~/Library/Logs/VibeBar",
    "~/Library/Preferences/com.vibebar.app.plist",
  ]
end
