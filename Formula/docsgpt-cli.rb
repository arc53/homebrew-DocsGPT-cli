class DocsgptCli < Formula
  desc "Command-line client for DocsGPT agents"
  homepage "https://github.com/arc53/DocsGPT-cli"
  url "https://github.com/arc53/DocsGPT-cli/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "1ef3769db91914fa21ed5e0d95a1590039cc40168009e234f55c16c010aa2ae5"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X docsgpt-cli/cmd.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match "docsgpt-cli version #{version}", shell_output("#{bin}/docsgpt-cli --version")
  end
end
