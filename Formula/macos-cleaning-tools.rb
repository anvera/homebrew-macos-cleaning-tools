class MacosCleaningTools < Formula
  desc "Collection of macOS cleaning and maintenance scripts"
  homepage "https://github.com/anvera/homebrew-macos-cleaning-tools"
  url "https://github.com/anvera/homebrew-macos-cleaning-tools/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "22d4387f1d40018cbfd3bc380babd71e01eab4ee7e75fe5e17b2df37603d91ee"
  license "MIT"

  def install
    bin.install Dir["bin/*"]
  end

  test do
    output = shell_output("#{bin}/unused-apps --help")
    assert_match "DAYS", output
  end
end
