class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.1.3/lazydb_0.1.3_x86_64-apple-darwin.tar.xz"
      sha256 "221ecde9131150071c851beafe97dc9396d7ad26b6d12fe95fa46d661bd2e9d1"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.1.3/lazydb_0.1.3_aarch64-apple-darwin.tar.xz"
      sha256 "3c2872ef102ea50d3275d9d7651bc4c47937f5c811244d77261634c543ebaeb1"
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
