class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.1.6/lazydb_0.1.6_x86_64-apple-darwin.tar.xz"
      sha256 "07a8fd8bc5ad9a16be19451021f42443468e685418206967e5227c0030cea6f1"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.1.6/lazydb_0.1.6_aarch64-apple-darwin.tar.xz"
      sha256 "1430c705f093c3718dbad9f3e2727550ddac35bd4182caa56e044bbbaa0ad192"
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
