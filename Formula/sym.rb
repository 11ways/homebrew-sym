# typed: false
# frozen_string_literal: true

# Homebrew Formula for sym - Symbolic Link Manager
class Sym < Formula
  desc "User-friendly symbolic link manager for ~/.local/bin"
  homepage "https://github.com/11ways/sym"
  url "https://github.com/11ways/sym/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3db5cc4bdf49a524a54f40f3dba04079badcfd7845b50256d18cb856abe00b30"
  license "MIT"
  head "https://github.com/11ways/sym.git", branch: "main"

  depends_on "pandoc" => :build

  def install
    # Install the main script
    bin.install "sym.sh" => "sym"

    # Build and install man page
    system "#{Formula["pandoc"].opt_bin}/pandoc",
           "--standalone",
           "--from", "markdown",
           "--to", "man",
           "sym.1.md",
           "-o", "sym.1"

    # Compress and install man page
    system "gzip", "-9", "sym.1"
    man1.install "sym.1.gz"
  end

  test do
    # Test that the script runs
    assert_match "sym version", shell_output("#{bin}/sym --version")

    # Test basic functionality
    system "#{bin}/sym", "--help"
  end
end
