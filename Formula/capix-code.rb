class CapixCode < Formula
  desc "Capix Code — decentralized AI coding agent"
  homepage "https://capix.network"
  url "https://github.com/CapIX-Protocol/CapIX-Code/releases/download/v1.3.0/capix-code"
  version "1.3.0"
  sha256 "placeholder"
  license "MIT"

  def install
    bin.install "capix-code"
  end

  def post_install
    # Download the engine binary
    engine_dir = Formula["capix-code"].libexec/"engine"
    engine_dir.mkpath
    system "curl", "-fsSL",
      "https://github.com/CapIX-Protocol/CapIX-Code/releases/download/v1.3.0/capix-engine",
      "-o", engine_dir/"capix-engine"
    chmod 0755, engine_dir/"capix-engine"
  end

  test do
    assert_match "1.3.0", shell_output("#{bin}/capix-code --version")
  end
end
