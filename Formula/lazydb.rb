class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.3.4/lazydb_0.3.4_x86_64-apple-darwin.tar.xz"
      sha256 "0629c46a062b3de116130e77f8a3cc88a056452b60d88d68ccaf1305a696f44f"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.3.4/lazydb_0.3.4_aarch64-apple-darwin.tar.xz"
      sha256 "708ce1412e19c0099c2347854c0caddf8ceb818523978d81186378beb82efffd"
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
