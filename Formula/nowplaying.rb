class Nowplaying < Formula
  desc "Pixel-art now-playing card for the terminal (macOS)"
  homepage "https://github.com/kraklin/nowplaying-tui"
  url "https://github.com/kraklin/nowplaying-tui/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "277eaac1c8cb1fb9a02b53f963dfa2367de37d5d9c2418d50591e3f3aba30774"
  license "MIT"
  head "https://github.com/kraklin/nowplaying-tui.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos
  depends_on "media-control"

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/nowplaying"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nowplaying --version")
  end
end
