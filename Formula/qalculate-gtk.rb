class QalculateGtk < Formula
  desc "Multi-purpose desktop calculator"
  homepage "https://qalculate.github.io/"
  # NOTE: Please keep these values in sync with libqalculate.rb when updating.
  url "https://github.com/Qalculate/qalculate-gtk/releases/download/v3.17.0/qalculate-gtk-3.17.0.tar.gz"
  sha256 "b95f4be3c6fd883dec280a92d46b4678f8a7de2e5b654344246bb9d87695626b"
  license "GPL-2.0-or-later"

  bottle do
    sha256 arm64_big_sur: "1f1d9ad6b73b670101b01b9fabcf310625808eb75f9df8fc8a1ef5b8cdcff296"
    sha256 big_sur:       "65abac4ee336a518d1053ba89586224c84d226052d97899844402b648a4255ac"
    sha256 catalina:      "b2047d43780b60f88c4bd935c115865ae853131746b15f258f93a56b66016046"
    sha256 mojave:        "7baa64b8011060b0df6364a23754b4da89b7622af1dd44decac89c4a4164a712"
  end

  depends_on "intltool" => :build
  depends_on "pkg-config" => :build
  depends_on "adwaita-icon-theme"
  depends_on "gtk+3"
  depends_on "libqalculate"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/qalculate-gtk", "-v"
  end
end
