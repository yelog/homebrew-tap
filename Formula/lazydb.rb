class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.1.1/lazydb_0.1.1_x86_64-apple-darwin.tar.xz"
      sha256 "d4b570cc620e18458f6dd18ee3659fe79da544787d51c8b47031cf25812a0e33"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.1.1/lazydb_0.1.1_aarch64-apple-darwin.tar.xz"
      sha256 "2ea9587a9fa4ad0878ae243dc10b9746ed01cc6b5465f2630794f64ef28efad6"
    end
  end

  def install
    bin.install "lazydb"
  end

  def caveats
    <<~EOS
      To configure LazyDB for Claude Code, Codex, or OpenCode, run:
        lazydb mcp setup
      from inside your project.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lazydb version --json")
  end
end
