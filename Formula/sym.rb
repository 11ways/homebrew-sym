# typed: false
# frozen_string_literal: true

# Homebrew Formula for sym - Symbolic Link Manager
class Sym < Formula
  desc "User-friendly symbolic link manager for ~/.local/bin"
  homepage "https://github.com/11ways/sym"
  url "https://github.com/11ways/sym/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "ed81c5691aa1007fcd90e2bf95ddb19e213dda43b07687787be2cb221c94b954"
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
