class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.3.0/lazydb_0.3.0_x86_64-apple-darwin.tar.xz"
      sha256 "13be1af8bb5b0f3fbb7d571328075b33aa63a825aefb95a87ee9b8abbd7bb779"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.3.0/lazydb_0.3.0_aarch64-apple-darwin.tar.xz"
      sha256 "b0aadf30334e950fed935213d9c416567cd5732c493588cbfa6e8f09c98303a7"
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
