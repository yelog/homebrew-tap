class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.3.1/lazydb_0.3.1_x86_64-apple-darwin.tar.xz"
      sha256 "bc963a0a9ed68328f1b3a47b5c714233f66f60011d4e88df1611a005e990aade"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.3.1/lazydb_0.3.1_aarch64-apple-darwin.tar.xz"
      sha256 "93869570846e2b330ee12bfcddd2a9d916149235fc81d74ccac20079e1ea2417"
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
