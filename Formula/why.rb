class Why < Formula
  desc "Show where a command on your system really comes from"
  homepage "https://github.com/akriaueno/why-cli"
  url "https://github.com/akriaueno/why-cli/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "2ac19122094b2aec5541d59dfd6e7bc48bc688d5bd301169b394a1869e85cd37"
  license "MIT"

  bottle do
    root_url "https://github.com/akriaueno/homebrew-tap/releases/download/why-0.1.9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cec1093bc750bff5ab2a2056dc2cd13dda372c6dfa157565772d258bd04ba11b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "08e1ac53f408fbf10dc545154909892dc0752e1e98a39ed8ed6bcb64102cf28b"
  end

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
