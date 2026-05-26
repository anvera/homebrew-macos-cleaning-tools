class MacosCleaningTools < Formula
  desc "Collection of macOS cleaning and maintenance scripts"
  homepage "https://github.com/anvera/homebrew-macos-cleaning-tools"
  url "https://github.com/anvera/homebrew-macos-cleaning-tools/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "" # Fill in after: curl -L <url> | shasum -a 256
  license "MIT"

  def install
    bin.install Dir["bin/*"]
  end

  test do
    output = shell_output("#{bin}/unused-apps --help")
    assert_match "DAYS", output
  end
end
