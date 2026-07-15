class CapixCode < Formula
  desc "Decentralized AI coding agent for the Capix network"
  homepage "https://capix.network"
  url "https://github.com/CapIX-Protocol/CapIX-Code/releases/download/v1.3.0/capix-code"
  version "1.3.0"
  sha256 "92bb32412122088897442c9003352386611fd409a634e468408744aae834b0ca"
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
