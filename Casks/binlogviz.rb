cask "binlogviz" do
  version "0.23.7"

  on_macos do
    on_intel do
      sha256 "9645c7644dc90e80449441773cf3a66080bf215a702967ee46da4703baee85d2"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.7/binlogviz_0.23.7_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "de2d99fa4508139091196aaaa164b424cfb09d7ff96432d97d9dddd37354d52d"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.7/binlogviz_0.23.7_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "4787c59d8745bd31d4de0dbeda123406e79c096a9fff367ec58e645b786592cd"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.7/binlogviz_0.23.7_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "156116e3e41e961b3ec51ded2a27254f24dc1c7bd1911882cc69bc92d05e7853"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.7/binlogviz_0.23.7_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
