class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.2.0/lazydb_0.2.0_x86_64-apple-darwin.tar.xz"
      sha256 "10473095eec680b5812b8f900a3a1a4b90863999c08c1c31ab9793af7eccce16"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.2.0/lazydb_0.2.0_aarch64-apple-darwin.tar.xz"
      sha256 "797b827a758c6cd87b0871a58d64a4b6656020dce9ea8c435088ec433d94ac40"
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
