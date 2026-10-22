class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.2.1/lazydb_0.2.1_x86_64-apple-darwin.tar.xz"
      sha256 "1618584820da2872ac6a76b1fd6fe6cabc75c90757f92e670a85dec7bc60762f"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.2.1/lazydb_0.2.1_aarch64-apple-darwin.tar.xz"
      sha256 "c3e3fe7e3c80b8b6186e5e4f00c16f055ab12001484aa690058ace4ec819f483"
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
