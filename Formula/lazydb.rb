class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.2.2/lazydb_0.2.2_x86_64-apple-darwin.tar.xz"
      sha256 "16c4a0148e86adec672464d3ad3842e3c271c695eef5057414ebdfd1933616b7"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.2.2/lazydb_0.2.2_aarch64-apple-darwin.tar.xz"
      sha256 "98424ac1d8ff059a5559516be872f4917b3bc755693a561bc0ce561d69e715f6"
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
