class Gorunn < Formula
  desc "Dockerized Local Develop Environment CLI"
  homepage "https://gorunn.io"
  version "1.0.0"

  if Hardware::CPU.intel?
    url "https://github.com/parapidcom/gorunn/releases/download/v1.0.0/gorunn-darwin-amd64"
    sha256 "791b124957b56b4ae2164dafd52edf141cdd4de5db88582ea826aa9ab679b1cf"
  elsif Hardware::CPU.arm?
    url "https://github.com/parapidcom/gorunn/releases/download/v1.0.0/gorunn-darwin-arm64"
    sha256 "0b8bd4701de6e46adccbf3ac45690a333c0d0c3a730e8ee10b16afee1ccc8a74"
  end

  def install
    bin.install "gorunn-darwin-#{Hardware::CPU.arch}" => "gorunn"
    chmod 0755, bin/"gorunn"
  end

  test do
    system "#{bin}/gorunn", "version"
  end
end
