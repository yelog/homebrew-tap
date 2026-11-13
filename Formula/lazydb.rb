class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.3.3/lazydb_0.3.3_x86_64-apple-darwin.tar.xz"
      sha256 "e5155d234b55c8a6cacc544e2a68c3dda7e10ff53c8fc19bc04bec6a45e9c142"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.3.3/lazydb_0.3.3_aarch64-apple-darwin.tar.xz"
      sha256 "876ac2e0778baa7070f8abc095de48513dd7052b036151400e33761f5a6593f3"
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
