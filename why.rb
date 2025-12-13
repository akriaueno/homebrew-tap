class Why < Formula
  desc "Why are you in my computer?"
  homepage "https://github.com/akriaueno/why-cli"
  url "https://github.com/akriaueno/why-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "18759cb611c6c47720c14d30a287186afa4d5b65399adb31d7b92b544f68ff3f"
  license "MIT"
  version "0.1.2"

  depends_on "nim" => :build

  def install
    system "nimble", "build", "-Y", "-d:release", "--noNimblePath"
    bin.install "why"
  end

  test do
    system "#{bin}/why", "--help"
  end
end
