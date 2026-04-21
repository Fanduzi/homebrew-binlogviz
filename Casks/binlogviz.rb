cask "binlogviz" do
  version "0.20.3"

  on_macos do
    on_intel do
      sha256 "e0611045632d71b7aeed54c9136bab3ddae133f53a4e39e7a6c5492b1705b0dc"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.3/binlogviz_0.20.3_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "1e14bc9496fb4b52a41ed420dd0584cf1ece85e16b926988c2f2a77b813b79e0"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.3/binlogviz_0.20.3_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "c60b4fc92c41c727858e37cbffc5f1304afde676d5bdad653b512916dfb9e559"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.3/binlogviz_0.20.3_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "a0f6ecdfbe2707ddae11254d1017f7125848d0d4e991dec2267d93f2d63195c7"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.3/binlogviz_0.20.3_linux_arm64.tar.gz",
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
