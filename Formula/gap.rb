class Gap < Formula
  desc "Gated Agent Proxy - secure credential management for AI agents"
  homepage "https://github.com/mikekelly/gap"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mikekelly/gap/releases/download/v0.3.1/gap-darwin-arm64.tar.gz"
      sha256 "d8c00e59918e21ead39e1f47bc1ee074f700660ddbb9d79a139d0b61464e281e"
    else
      # x86_64 binary not yet available
      odie "Intel Mac binary not yet available. Please build from source."
    end
  end

  def install
    bin.install "gap"
    bin.install "gap-server"
  end

  service do
    run [opt_bin/"gap-server"]
    keep_alive true
    log_path var/"log/gap-server.log"
    error_log_path var/"log/gap-server.err"
  end

  test do
    system "#{bin}/gap-server", "--version"
  end
end
