class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.1.9/lazydb_0.1.9_x86_64-apple-darwin.tar.xz"
      sha256 "a67781b381804585d2c8cfa838072ac11b3b0c9651440300933f957553dc0714"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.1.9/lazydb_0.1.9_aarch64-apple-darwin.tar.xz"
      sha256 "1b5d73a872bf651225331ca7eb64786f59e446d53d6557c3bf3bbc3bc3b703e6"
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
