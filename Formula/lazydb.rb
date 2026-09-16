class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.1.5/lazydb_0.1.5_x86_64-apple-darwin.tar.xz"
      sha256 "31fdbf58a6a92a6409d65c5262377d6dd18836176925d224bc4f4f192c7efbd4"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.1.5/lazydb_0.1.5_aarch64-apple-darwin.tar.xz"
      sha256 "2d626dba749e4c38ea0d7dfc3fdacdfc09597ac87f4eb6190b784855ed08643f"
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
