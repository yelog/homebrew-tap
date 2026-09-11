class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.1.4/lazydb_0.1.4_x86_64-apple-darwin.tar.xz"
      sha256 "82a817609fd3c387eae72c440843b95ad826e4654fb3c14798e7a2ffbcb58cd9"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.1.4/lazydb_0.1.4_aarch64-apple-darwin.tar.xz"
      sha256 "ac6bd9b59e5bb48eb6dbc87534fac4fbd1aec5302c767bc0bf2fc087fa658c0c"
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
