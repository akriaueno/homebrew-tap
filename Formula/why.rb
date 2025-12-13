class Why < Formula
  desc "Show where a command on your system really comes from"
  homepage "https://github.com/akriaueno/why-cli"
  url "https://github.com/akriaueno/why-cli/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "a2f590ff9e30e55d48c0220cbb6023c89ea1b00738e25264383ceed79180d2dd"
  license "MIT"

  depends_on "nim" => :build

  def install
    system "nimble", "build", "-Y", "-d:release", "--noNimblePath"
    bin.install "why"
  end

  test do
    system "#{bin}/why", "--help"
  end
end
