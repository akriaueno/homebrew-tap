class Why < Formula
  desc "Why are you in my computer?"
  homepage "https://github.com/akriaueno/why-cli"
  url "https://github.com/akriaueno/why-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e7c25f062aca6dd086a712e53ea42e210b582139e11460e949153fad864ea024"
  license "MIT"
  version "0.1.1"

  depends_on "nim" => :build

  def install
    system "nimble", "build", "-Y", "-d:release", "--noNimblePath"
    bin.install "why"
  end

  test do
    system "#{bin}/why", "--help"
  end
end
