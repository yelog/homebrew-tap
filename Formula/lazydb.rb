class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.1.8/lazydb_0.1.8_x86_64-apple-darwin.tar.xz"
      sha256 "4d49fd2ea68ecd79ddc63e1c4f1420aafdb9cdf83b3f2d2fa575e93510fdbd38"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.1.8/lazydb_0.1.8_aarch64-apple-darwin.tar.xz"
      sha256 "0127947a3a241161b1f56c73cf881e2b005b8838bc5c85a33bcca556166ab4fb"
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
