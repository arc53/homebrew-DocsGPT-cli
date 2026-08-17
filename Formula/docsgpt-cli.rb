class DocsgptCli < Formula
  desc "Command-line client for DocsGPT agents"
  homepage "https://github.com/arc53/DocsGPT-cli"
  url "https://github.com/arc53/DocsGPT-cli/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "fd199618493074df9cc3fb20c173e20820195ddf52d5eb93b884914ebd86f97e"
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
