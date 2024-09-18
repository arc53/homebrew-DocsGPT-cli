class DocsgptCli < Formula
  desc "A CLI tool for DocsGPT"
  homepage "https://github.com/arc53/DocsGPT-cli"
  url "file://#{Dir.home}/Desktop/homebrew-tarballs/DocsGPT-cli-v1.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-o", bin/"docsgpt"
  end

  test do
    assert_match "DocsGPT-cli version", shell_output("#{bin}/docsgpt --version")
  end
end