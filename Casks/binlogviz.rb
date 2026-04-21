cask "binlogviz" do
  version "0.20.2"

  on_macos do
    on_intel do
      sha256 "86723660f60e76319460acbbfb72634bc417ac118393a4e291e1a25757d74325"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.2/binlogviz_0.20.2_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "d2e08e028c928a1109abeb4da3acffa55b7c8a2ec4df0276bd29ccf082011e0a"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.2/binlogviz_0.20.2_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "e50c96e4230d05d02a2c9952af5792054aeea26c676a9c7c71b503029e3f8964"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.2/binlogviz_0.20.2_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "f49d7f158b541a873b4207b0ec1947cead0ba549452ec1754b85b45e3c7f7ffe"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.2/binlogviz_0.20.2_linux_arm64.tar.gz",
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
