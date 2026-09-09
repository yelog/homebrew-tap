class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.1.2/lazydb_0.1.2_x86_64-apple-darwin.tar.xz"
      sha256 "be3c1d13691478aaa2e26a81f808c13b6676c0b1f19f2c000832ba48e23f9b76"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.1.2/lazydb_0.1.2_aarch64-apple-darwin.tar.xz"
      sha256 "754dcbcef2df2fe46d6a1ef2fb41bb318bb5f9ab40f6fa0f620b2b5d3cecfa51"
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
