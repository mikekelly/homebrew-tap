class Gap < Formula
  desc "Gated Agent Proxy - secure credential management for AI agents"
  homepage "https://github.com/mikekelly/gap"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mikekelly/gap/releases/download/v0.3.1/gap-darwin-arm64.tar.gz"
      sha256 "1a50b05b4e4c08dba2d81bb0ebd32b496ef7277e77f5f04c6ec112e82822afd0"
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
