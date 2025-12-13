class Why < Formula
  desc "Why are you in my computer?"
  homepage "https://github.com/akriaueno/why-cli"
  url "https://github.com/akriaueno/why-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e2d1e01f8f07a2b62b2efeacf43ea4a8a0396a01b7ca5832d50fb168b151f2ff"
  license "MIT"
  version "0.1.0"

  depends_on "nim" => :build

  def install
    system "nimble", "build", "-Y", "-d:release", "--noNimblePath"
    bin.install "why"
  end

  test do
    system "#{bin}/why", "--help"
  end
end
