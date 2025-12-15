class Why < Formula
  desc "Show where a command on your system really comes from"
  homepage "https://github.com/akriaueno/why-cli"
  url "https://github.com/akriaueno/why-cli/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "724a75a9eb0c49498566e395a457e39d349f96b14ffbe62006ec1e0f9aed5546"
  license "MIT"

  depends_on "nim" => :build

  resource "cligen" do
    url "https://github.com/c-blake/cligen/archive/refs/tags/1.7.0.tar.gz"
    sha256 "6ba26c5c476a7682dcb05c5029abe7c5659e8e0934a5af7a93d9445e8b504cb1"
  end

  def install
    resource("cligen").stage do
      (buildpath/"vendor/cligen").install Dir["*"]
    end

    system "nim", "c", "-d:release", "--path:#{buildpath}/vendor/cligen", "-o:why", "src/why.nim"
    bin.install "why"
  end

  test do
    system "#{bin}/why", "--help"
  end
end
