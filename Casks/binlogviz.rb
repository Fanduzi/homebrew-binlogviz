cask "binlogviz" do
  version "0.43.0"

  on_macos do
    on_intel do
      sha256 "aceb9bfc7554b8e93f9544e7c2d7cd03f52b901d342fd6842ec154c7d7a95f3c"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.43.0/binlogviz_0.43.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "09ce035a8da88fdb93448b7884ae7f5394b4cc001f2dc304932fe3cd763adf1d"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.43.0/binlogviz_0.43.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "1301ee010e4b74bf31a925e6df1803335c647b400c4acfc336cc704946f839c1"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.43.0/binlogviz_0.43.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "573c3b34ac5849730b83f6dff532e04c13f095509446f2f216ac948a42617356"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.43.0/binlogviz_0.43.0_linux_arm64.tar.gz",
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
