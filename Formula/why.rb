class Why < Formula
  desc "Show where a command on your system really comes from"
  homepage "https://github.com/akriaueno/why-cli"
  url "https://github.com/akriaueno/why-cli/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "946d27013b80510aec288512b755715e7eef3f7609d30bbf186f1237a66a4882"
  license "MIT"

  bottle do
    root_url "https://github.com/akriaueno/homebrew-tap/releases/download/why-0.1.8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5ed607e01003096a6105f6d576fdf9dd10c050f6a9441ef8904d699d494b47cf"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8c3cbffb311db5fefae00e34a2815d7ddd1665bb90149215c01be598a9d2d48e"
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
