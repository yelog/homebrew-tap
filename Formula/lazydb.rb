class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.2.3/lazydb_0.2.3_x86_64-apple-darwin.tar.xz"
      sha256 "0d27c2f9ccc80ffdcba3874ab94f0444da5d18d91360820e36c9b3748761f8b0"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.2.3/lazydb_0.2.3_aarch64-apple-darwin.tar.xz"
      sha256 "f8bc7ad329cee04b79595df6cc6c67e057d94783263065f4be3fcd4533320bde"
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
