class Why < Formula
  desc "Show where a command on your system really comes from"
  homepage "https://github.com/akriaueno/why-cli"
  url "https://github.com/akriaueno/why-cli/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "f71536e76e043e525d6a6f58c5c541f1c6bc4bb93b09c00f88a90e7b4c909c50"
  license "MIT"

  bottle do
    root_url "https://github.com/akriaueno/homebrew-tap/releases/download/why-0.1.10"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d56d7b55539f633e2a6efe98b36adc5df0b15f8a6309f6f4351b4127caee77cd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5fd593ba86bb1222d370c47e0d621eb69ce7946d015d03c35d56683584accf43"
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
