# typed: false
# frozen_string_literal: true

# Homebrew Formula for sym - Symbolic Link Manager
class Sym < Formula
  desc "User-friendly symbolic link manager for ~/.local/bin"
  homepage "https://github.com/11ways/sym"
  url "https://github.com/11ways/sym/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a22b715e870959f29b92c136b9a4d82aba154ca66ba5615cf3453f4070fecfc7"
  license "MIT"
  head "https://github.com/11ways/sym.git", branch: "main"

  def install
    # Install the main script
    bin.install "sym.sh" => "sym"

    # Install pre-built man page
    man1.install "sym.1.gz"
  end

  test do
    # Test that the script runs
    assert_match "sym version", shell_output("#{bin}/sym --version")

    # Test basic functionality
    system "#{bin}/sym", "--help"
  end
end
