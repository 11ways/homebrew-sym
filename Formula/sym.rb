# typed: false
# frozen_string_literal: true

# Homebrew Formula for sym - Symbolic Link Manager
class Sym < Formula
  desc "User-friendly symbolic link manager for ~/.local/bin"
  homepage "https://github.com/11ways/sym"
  url "https://github.com/11ways/sym/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "70f9e719277ff6d6fb8646c90b5fd9d319e5f545244a512ae92651582037e2e4"
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
