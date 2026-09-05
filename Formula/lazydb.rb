class Lazydb < Formula
  desc "A keyboard-first terminal database IDE"
  homepage "https://github.com/yelog/lazydb"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yelog/lazydb/releases/download/v0.1.0/lazydb_0.1.0_x86_64-apple-darwin.tar.xz"
      sha256 "9df39c6f76b2b6e6d663b659e38bb9faafc04101047e343564e8ab6e6d76bd13"
    else
      url "https://github.com/yelog/lazydb/releases/download/v0.1.0/lazydb_0.1.0_aarch64-apple-darwin.tar.xz"
      sha256 "adcb1324db4250d8d15c912f6c1c43754b96eb23cff9436e3a74f00694894207"
    end
  end

  def install
    bin.install "lazydb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lazydb version --json")
  end
end
