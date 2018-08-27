class Pngpaste < Formula
  desc "Paste PNG into files"
  homepage "https://github.com/hanxue/pngpaste"
  url "https://github.com/hanxue/pngpaste/archive/0.2.2.tar.gz"
  sha256 "13666f886b57446d696af18ca10bda97d80a37135f802efeac9060424602d96f"

  def install
    system "make", "all"
    bin.install "pngpaste"
  end

  test do
    png = test_fixtures("test.png")
    system "osascript", "-e", "set the clipboard to POSIX file (\"#{png}\")"
    system bin/"pngpaste", "test.png"
    assert_predicate testpath/"test.png", :exist?
  end
end
