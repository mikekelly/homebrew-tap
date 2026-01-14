class Tsk < Formula
  desc "Minimal task tracker for AI agents - plain markdown files, no database"
  homepage "https://github.com/mikekelly/tsk"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mikekelly/tsk/releases/download/v0.7.0/tsk-macos-arm64"
      sha256 "079831360531587a167f2e423c8b7f6d3f8192d494e74749f67706add4de30c1"
    end
    on_intel do
      odie "Intel Mac binaries not available. Please build from source."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mikekelly/tsk/releases/download/v0.7.0/tsk-linux-x86_64"
      sha256 "beff3479b4d91cfbbd0e0189e1381675e7ee3198fee046e9398ade01a3dd12c4"
    end
  end

  def install
    binary_name = if OS.mac? && Hardware::CPU.arm?
      "tsk-macos-arm64"
    elsif OS.linux? && Hardware::CPU.intel?
      "tsk-linux-x86_64"
    end
    bin.install binary_name => "tsk" if binary_name
  end

  test do
    assert_match "tsk", shell_output("#{bin}/tsk --version")
  end
end
