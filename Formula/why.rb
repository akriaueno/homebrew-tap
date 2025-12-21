class Why < Formula
  desc "Show where a command on your system really comes from"
  homepage "https://github.com/akriaueno/why-cli"
  url "https://github.com/akriaueno/why-cli/archive/refs/tags/v0.1.13.tar.gz"
  sha256 "094a6071cd76eb774a3b22d0ab36e79886b5037986906a343b3d15f22513a95c"
  license "MIT"

  bottle do
    root_url "https://github.com/akriaueno/homebrew-tap/releases/download/why-0.1.13"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8bbcd5569ab7a2fdb6bebf69e917e55d9e0888dc2705256292a3fe281b96ea35"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "de769bb359adb948990ffa17a83ea40bd8edea0aff6a39172aed5e5a6807f6ef"
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
