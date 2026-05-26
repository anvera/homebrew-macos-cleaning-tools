class MacosCleaningTools < Formula
  desc "Collection of macOS cleaning and maintenance scripts"
  homepage "https://github.com/anvera/homebrew-macos-cleaning-tools"
  url "https://github.com/anvera/homebrew-macos-cleaning-tools/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "ca24cf3d388c348a62ca2af39526b2754cfb517b926194f623f4a5832ae8ae8b"
  license "MIT"

  def install
    bin.install Dir["bin/*"]
  end

  test do
    output = shell_output("#{bin}/unused-apps --help")
    assert_match "DAYS", output
  end
end
