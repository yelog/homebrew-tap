class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.1.7/lazydb_0.1.7_x86_64-apple-darwin.tar.xz"
      sha256 "02bd7775b9eef62c09e788a7354e4d60f9b2f999faae81f2cff04adcb801a389"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.1.7/lazydb_0.1.7_aarch64-apple-darwin.tar.xz"
      sha256 "8c4b977addf8bc648bcc3edac5d64b16ecf23a1dd66bfe737aee13960b042a46"
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
