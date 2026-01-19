class Gap < Formula
  desc "Gated Agent Proxy - secure credential management for AI agents"
  homepage "https://github.com/mikekelly/gap"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mikekelly/gap/releases/download/v0.5.0/gap-darwin-arm64.tar.gz"
      sha256 "c04e0093e40f75ddfffe9271e88d6cb9e90bd9bb1a18cf4c2b8160e67f6e7a0a"
    else
      # x86_64 binary not yet available
      odie "Intel Mac binary not yet available. Please build from source."
    end
  end

  def install
    bin.install "gap"
    bin.install "gap-server"
    # Alias for oh-my-zsh users who have 'gap' aliased to 'git apply'
    bin.install_symlink "gap" => "gap-cli"
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
