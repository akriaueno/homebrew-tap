class Why < Formula
  desc "Show where a command on your system really comes from"
  homepage "https://github.com/akriaueno/why-cli"
  url "https://github.com/akriaueno/why-cli/archive/refs/tags/v0.1.12.tar.gz"
  sha256 "c201e6315550f00051bc47e5221ac1b51d8c4459f99f163d51a6bd24a01e7541"
  license "MIT"

  bottle do
    root_url "https://github.com/akriaueno/homebrew-tap/releases/download/why-0.1.12"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0d81ae3e935d6141f0fd28b820acedaa1dbc003c22f684a93090966c95f95cfa"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "752650dbe203318cef7d900088a889f4d53f7f0fa59e218dc225a4ff491c50dd"
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
