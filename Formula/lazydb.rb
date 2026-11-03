class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.3.2/lazydb_0.3.2_x86_64-apple-darwin.tar.xz"
      sha256 "02080bcf239219e460053788e8a2d7df1fdac937cb405449b95aa4559693464f"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.3.2/lazydb_0.3.2_aarch64-apple-darwin.tar.xz"
      sha256 "9d1ce56b9af88845da9ee9a067ebada02e743886c3711a2c68850c17fdde4f7b"
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
